#!/usr/bin/env python3
"""内閣府の「国民の祝日」CSV を取得し、docs/ 以下へ各形式で書き出す。

標準ライブラリのみで動く（Excel も zip を直接組み立てる）。
取得したデータが壊れていそうな時は何も書き換えずに異常終了する。
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import io
import json
import shutil
import sqlite3
import sys
import urllib.request
import zipfile
from dataclasses import dataclass
from datetime import date, datetime, timedelta, timezone
from email.utils import format_datetime, parsedate_to_datetime
from pathlib import Path
from xml.sax.saxutils import escape

SOURCE_URL = "https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv"
SOURCE_PAGE = "https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"
SITE_URL = "https://mati0516.github.io/japan-holidays/"
TITLE = "日本の祝日・休日"
JST = timezone(timedelta(hours=9))
WEEKDAYS = ["月", "火", "水", "木", "金", "土", "日"]
WEEKDAYS_EN = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
RAW = ROOT / "data" / "syukujitsu.csv"

# 各形式の拡張子（年別・全件で共通に出す）
FORMATS = [
    ("json", "日付→名称の対応表"),
    ("list.json", "配列（曜日つき）"),
    ("jsonl", "JSON Lines"),
    ("csv", "CSV（UTF-8）"),
    ("bom.csv", "CSV（UTF-8 BOM付き・Excel向け）"),
    ("sjis.csv", "CSV（Shift_JIS）"),
    ("tsv", "TSV（UTF-8）"),
    ("xml", "XML"),
    ("yaml", "YAML"),
    ("toml", "TOML"),
    ("ics", "iCalendar"),
    ("sql", "SQL（INSERT文）"),
    ("md", "Markdown の表"),
    ("html", "HTML の表"),
]
FORMATS_ALL_ONLY = [
    ("sqlite", "SQLite データベース"),
    ("xlsx", "Excel"),
]


@dataclass(frozen=True)
class Holiday:
    date: date
    name: str

    @property
    def iso(self) -> str:
        return self.date.isoformat()

    @property
    def weekday(self) -> str:
        return WEEKDAYS[self.date.weekday()]

    @property
    def weekday_en(self) -> str:
        return WEEKDAYS_EN[self.date.weekday()]

    def as_dict(self) -> dict:
        return {
            "date": self.iso,
            "name": self.name,
            "year": self.date.year,
            "month": self.date.month,
            "day": self.date.day,
            "weekday": self.weekday,
            "weekday_en": self.weekday_en,
        }


# ─── 取得と検査 ──────────────────────────────────────────


def fetch(url: str) -> tuple[bytes, str | None]:
    req = urllib.request.Request(url, headers={"User-Agent": "japan-holidays (+https://github.com/mati0516/japan-holidays)"})
    last_err = None
    for _ in range(3):
        try:
            with urllib.request.urlopen(req, timeout=60) as res:
                return res.read(), res.headers.get("Last-Modified")
        except Exception as e:  # noqa: BLE001
            last_err = e
    raise SystemExit(f"取得に失敗しました: {last_err}")


def parse(raw: bytes) -> list[Holiday]:
    text = raw.decode("cp932")
    rows = list(csv.reader(io.StringIO(text)))
    if not rows or "月日" not in rows[0][0]:
        raise SystemExit(f"見出し行が想定と違います: {rows[:1]}")
    out: list[Holiday] = []
    for i, row in enumerate(rows[1:], start=2):
        if not row or not "".join(row).strip():
            continue
        if len(row) < 2:
            raise SystemExit(f"{i}行目の列が足りません: {row}")
        y, m, d = (int(x) for x in row[0].strip().split("/"))
        name = row[1].strip()
        if not name:
            raise SystemExit(f"{i}行目の名称が空です")
        out.append(Holiday(date(y, m, d), name))
    out.sort(key=lambda h: h.date)
    if len({h.date for h in out}) != len(out):
        raise SystemExit("同じ日付が重複しています")
    return out


def sanity(new: list[Holiday], old: list[Holiday] | None, today: date) -> None:
    if len(new) < 900:
        raise SystemExit(f"件数が少なすぎます（{len(new)}件）")
    if new[0].date.year > 1955:
        raise SystemExit(f"最初の年が想定と違います（{new[0].date.year}年）")
    if new[-1].date.year < today.year:
        raise SystemExit(f"今年の祝日が入っていません（最終 {new[-1].date.year}年）")
    if old and len(new) < len(old) * 0.95:
        raise SystemExit(f"件数が急に減りました（{len(old)} → {len(new)}）")
    if old:
        # 過去の祝日が消える・変わるのは異常（将来分の変更は正常にありうる）
        new_map = {h.date: h.name for h in new}
        for h in old:
            if h.date < date(today.year - 1, 1, 1) and new_map.get(h.date) != h.name:
                raise SystemExit(f"過去の祝日が変わっています: {h.iso} {h.name} → {new_map.get(h.date)}")


# ─── 各形式 ──────────────────────────────────────────────


def to_map_json(hs):
    return json.dumps({h.iso: h.name for h in hs}, ensure_ascii=False, indent=2) + "\n"


def to_list_json(hs):
    return json.dumps([h.as_dict() for h in hs], ensure_ascii=False, indent=2) + "\n"


def to_jsonl(hs):
    return "".join(json.dumps(h.as_dict(), ensure_ascii=False) + "\n" for h in hs)


def to_delimited(hs, delim=","):
    buf = io.StringIO()
    w = csv.writer(buf, delimiter=delim, lineterminator="\r\n")
    w.writerow(["日付", "名称", "曜日"])
    for h in hs:
        w.writerow([h.iso, h.name, h.weekday])
    return buf.getvalue()


def to_xml(hs, stamp):
    lines = ['<?xml version="1.0" encoding="UTF-8"?>',
             f'<holidays source="{escape(SOURCE_URL)}" updated="{stamp}" count="{len(hs)}">']
    for h in hs:
        lines.append(f'  <holiday date="{h.iso}" weekday="{h.weekday}">{escape(h.name)}</holiday>')
    lines.append("</holidays>")
    return "\n".join(lines) + "\n"


def _yq(s: str) -> str:
    return json.dumps(s, ensure_ascii=False)  # JSON の文字列は YAML・TOML でも正しい文字列


def to_yaml(hs):
    lines = []
    for h in hs:
        lines += [f"- date: {h.iso}", f"  name: {_yq(h.name)}", f"  weekday: {_yq(h.weekday)}"]
    return "\n".join(lines) + "\n"


def to_toml(hs):
    lines = []
    for h in hs:
        lines += ["[[holidays]]", f"date = {h.iso}", f"name = {_yq(h.name)}", f"weekday = {_yq(h.weekday)}", ""]
    return "\n".join(lines)


def _ics_fold(line: str) -> str:
    out, cur = [], b""
    for ch in line:
        b = ch.encode("utf-8")
        if len(cur) + len(b) > (75 if not out else 74):
            out.append(cur.decode("utf-8"))
            cur = b""
        cur += b
    out.append(cur.decode("utf-8"))
    return "\r\n ".join(out)


def to_ics(hs, stamp, calname):
    dtstamp = datetime.fromisoformat(stamp).astimezone(timezone.utc).strftime("%Y%m%dT%H%M%S")
    lines = ["BEGIN:VCALENDAR", "VERSION:2.0", "PRODID:-//japan-holidays//JA", "CALSCALE:GREGORIAN",
             "METHOD:PUBLISH", f"X-WR-CALNAME:{calname}", "X-WR-TIMEZONE:Asia/Tokyo",
             "REFRESH-INTERVAL;VALUE=DURATION:P7D", "X-PUBLISHED-TTL:P7D"]
    for h in hs:
        lines += ["BEGIN:VEVENT", f"UID:{h.iso}@japan-holidays", f"DTSTAMP:{dtstamp}Z",
                  f"DTSTART;VALUE=DATE:{h.date.strftime('%Y%m%d')}",
                  f"DTEND;VALUE=DATE:{(h.date + timedelta(days=1)).strftime('%Y%m%d')}",
                  f"SUMMARY:{h.name}", "TRANSP:TRANSPARENT", "CLASS:PUBLIC", "END:VEVENT"]
    lines.append("END:VCALENDAR")
    return "\r\n".join(_ics_fold(l) for l in lines) + "\r\n"


def to_sql(hs):
    lines = ["CREATE TABLE IF NOT EXISTS holidays (",
             "  date DATE PRIMARY KEY,",
             "  name VARCHAR(64) NOT NULL,",
             "  weekday CHAR(1) NOT NULL",
             ");", ""]
    for h in hs:
        name = h.name.replace("'", "''")
        lines.append(f"INSERT INTO holidays (date, name, weekday) VALUES ('{h.iso}', '{name}', '{h.weekday}');")
    return "\n".join(lines) + "\n"


def to_md(hs, title):
    lines = [f"# {title}", "", "| 日付 | 曜日 | 名称 |", "|---|---|---|"]
    lines += [f"| {h.iso} | {h.weekday} | {h.name} |" for h in hs]
    return "\n".join(lines) + "\n"


def to_html(hs, title):
    rows = "\n".join(
        f'<tr><td>{h.iso}</td><td>{h.weekday}</td><td>{escape(h.name)}</td></tr>' for h in hs)
    return f"""<!DOCTYPE html>
<html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{escape(title)}</title>
<style>body{{font-family:system-ui,sans-serif;margin:16px}}table{{border-collapse:collapse}}td,th{{border:1px solid #999;padding:4px 10px}}</style>
</head><body><h1>{escape(title)}</h1>
<table><thead><tr><th>日付</th><th>曜日</th><th>名称</th></tr></thead><tbody>
{rows}
</tbody></table></body></html>
"""


def write_sqlite(hs, path: Path):
    if path.exists():
        path.unlink()
    con = sqlite3.connect(path)
    con.execute("CREATE TABLE holidays (date TEXT PRIMARY KEY, name TEXT NOT NULL, year INTEGER NOT NULL,"
                " month INTEGER NOT NULL, day INTEGER NOT NULL, weekday TEXT NOT NULL)")
    con.executemany("INSERT INTO holidays VALUES (?,?,?,?,?,?)",
                    [(h.iso, h.name, h.date.year, h.date.month, h.date.day, h.weekday) for h in hs])
    con.commit()
    con.execute("VACUUM")
    con.close()


def write_xlsx(hs, path: Path):
    def cell(ref, v):
        return f'<c r="{ref}" t="inlineStr"><is><t>{escape(v)}</t></is></c>'

    rows = ['<row r="1">' + cell("A1", "日付") + cell("B1", "曜日") + cell("C1", "名称") + "</row>"]
    for i, h in enumerate(hs, start=2):
        rows.append(f'<row r="{i}">' + cell(f"A{i}", h.iso) + cell(f"B{i}", h.weekday) + cell(f"C{i}", h.name) + "</row>")
    sheet = ('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
             '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
             '<cols><col min="1" max="1" width="12" customWidth="1"/><col min="2" max="2" width="6" customWidth="1"/>'
             '<col min="3" max="3" width="20" customWidth="1"/></cols>'
             f'<sheetData>{"".join(rows)}</sheetData></worksheet>')
    parts = {
        "[Content_Types].xml": '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
        '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
        '<Default Extension="xml" ContentType="application/xml"/>'
        '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>'
        '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
        '</Types>',
        "_rels/.rels": '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>'
        '</Relationships>',
        "xl/workbook.xml": '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" '
        'xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'
        '<sheets><sheet name="祝日" sheetId="1" r:id="rId1"/></sheets></workbook>',
        "xl/_rels/workbook.xml.rels": '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>'
        '</Relationships>',
        "xl/worksheets/sheet1.xml": sheet,
    }
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as z:
        for name, body in parts.items():
            info = zipfile.ZipInfo(name, date_time=(2000, 1, 1, 0, 0, 0))  # 中身が同じなら同じバイト列に
            info.compress_type = zipfile.ZIP_DEFLATED
            z.writestr(info, body)


def to_rss(hs, stamp_dt: datetime):
    items = []
    for h in reversed(hs):
        pub = format_datetime(datetime(h.date.year, h.date.month, h.date.day, tzinfo=JST))
        items.append(f"""    <item>
      <title>{h.iso}（{h.weekday}） {escape(h.name)}</title>
      <link>{SITE_URL}date/{h.iso}.json</link>
      <guid isPermaLink="false">{h.iso}@japan-holidays</guid>
      <pubDate>{pub}</pubDate>
      <description>{h.date.year}年{h.date.month}月{h.date.day}日（{h.weekday}）は「{escape(h.name)}」です。</description>
    </item>""")
    return f"""<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>{TITLE}</title>
    <link>{SITE_URL}</link>
    <atom:link href="{SITE_URL}feed.rss" rel="self" type="application/rss+xml"/>
    <description>内閣府が公表している国民の祝日・休日（今年以降）</description>
    <language>ja</language>
    <lastBuildDate>{format_datetime(stamp_dt)}</lastBuildDate>
{chr(10).join(items)}
  </channel>
</rss>
"""


def to_atom(hs, stamp):
    entries = []
    for h in reversed(hs):
        ts = f"{h.iso}T00:00:00+09:00"
        entries.append(f"""  <entry>
    <title>{h.iso}（{h.weekday}） {escape(h.name)}</title>
    <id>tag:mati0516.github.io,2026:japan-holidays:{h.iso}</id>
    <link href="{SITE_URL}date/{h.iso}.json"/>
    <updated>{ts}</updated>
    <summary>{h.date.year}年{h.date.month}月{h.date.day}日（{h.weekday}）は「{escape(h.name)}」です。</summary>
  </entry>""")
    return f"""<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="ja">
  <title>{TITLE}</title>
  <subtitle>内閣府が公表している国民の祝日・休日（今年以降）</subtitle>
  <link href="{SITE_URL}"/>
  <link href="{SITE_URL}feed.atom" rel="self"/>
  <id>tag:mati0516.github.io,2026:japan-holidays</id>
  <updated>{stamp}</updated>
  <author><name>japan-holidays</name></author>
{chr(10).join(entries)}
</feed>
"""


# ─── 書き出し ────────────────────────────────────────────


def write_text(path: Path, text: str, encoding="utf-8", newline=""):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding=encoding, newline=newline) as f:
        f.write(text)


def write_set(hs, base: Path, title: str, stamp: str):
    """base＝拡張子を除いたパス（例 docs/all、docs/year/2026）"""
    def p(ext):
        return base.parent / f"{base.name}.{ext}"

    csv_text = to_delimited(hs)
    write_text(p("json"), to_map_json(hs))
    write_text(p("list.json"), to_list_json(hs))
    write_text(p("jsonl"), to_jsonl(hs))
    write_text(p("csv"), csv_text)
    write_text(p("bom.csv"), csv_text, encoding="utf-8-sig")
    write_text(p("sjis.csv"), csv_text, encoding="cp932")
    write_text(p("tsv"), to_delimited(hs, "\t"))
    write_text(p("xml"), to_xml(hs, stamp))
    write_text(p("yaml"), to_yaml(hs))
    write_text(p("toml"), to_toml(hs))
    write_text(p("ics"), to_ics(hs, stamp, title))
    write_text(p("sql"), to_sql(hs))
    write_text(p("md"), to_md(hs, title))
    write_text(p("html"), to_html(hs, title))


def build(hs: list[Holiday], raw: bytes, source_modified: str | None, now: datetime):
    # データ由来の時刻（毎回変わる「今」を中身へ入れない＝差分を作らない）
    if source_modified:
        src_dt = parsedate_to_datetime(source_modified).astimezone(JST)
    else:
        src_dt = now
    stamp = src_dt.replace(microsecond=0).isoformat()

    for sub in ("year", "date"):
        shutil.rmtree(DOCS / sub, ignore_errors=True)
    for f in DOCS.glob("all.*"):
        f.unlink()

    write_set(hs, DOCS / "all", TITLE, stamp)
    write_sqlite(hs, DOCS / "all.sqlite")
    write_xlsx(hs, DOCS / "all.xlsx")

    years = sorted({h.date.year for h in hs})
    for y in years:
        yh = [h for h in hs if h.date.year == y]
        write_set(yh, DOCS / "year" / str(y), f"{y}年の{TITLE}", stamp)

    for h in hs:
        write_text(DOCS / "date" / f"{h.iso}.json", json.dumps(h.as_dict(), ensure_ascii=False, indent=2) + "\n")

    upcoming = [h for h in hs if h.date.year >= now.year]
    write_text(DOCS / "feed.rss", to_rss(upcoming, src_dt))
    write_text(DOCS / "feed.atom", to_atom(upcoming, stamp))

    meta = {
        "source": SOURCE_URL,
        "source_page": SOURCE_PAGE,
        "source_last_modified": stamp,
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "count": len(hs),
        "first": hs[0].iso,
        "last": hs[-1].iso,
        "years": years,
        "formats": [{"ext": e, "label": l} for e, l in FORMATS + FORMATS_ALL_ONLY],
    }
    write_text(DOCS / "meta.json", json.dumps(meta, ensure_ascii=False, indent=2) + "\n")
    (DOCS / ".nojekyll").touch()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--offline", action="store_true", help="取得せず data/syukujitsu.csv から作り直す")
    args = ap.parse_args()
    now = datetime.now(JST)

    old = parse(RAW.read_bytes()) if RAW.exists() else None
    if args.offline:
        raw, modified = RAW.read_bytes(), None
        meta_path = DOCS / "meta.json"
        if meta_path.exists():
            modified = format_datetime(datetime.fromisoformat(json.loads(meta_path.read_text())["source_last_modified"]))
    else:
        raw, modified = fetch(SOURCE_URL)
    hs = parse(raw)
    sanity(hs, old, now.date())

    RAW.parent.mkdir(parents=True, exist_ok=True)
    RAW.write_bytes(raw)
    build(hs, raw, modified, now)

    # 毎月必ず書き換わる唯一のファイル＝定期実行が60日で止まらないための足場
    write_text(DOCS / "checked.json", json.dumps(
        {"checked_at": now.replace(microsecond=0).isoformat(), "count": len(hs)},
        ensure_ascii=False, indent=2) + "\n")
    print(f"{len(hs)}件（{hs[0].iso}〜{hs[-1].iso}）を書き出しました")


if __name__ == "__main__":
    sys.exit(main())
