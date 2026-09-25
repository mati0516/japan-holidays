#!/usr/bin/env python3
"""書き出した全形式を読み戻し、元データと同じ中身かを確かめる。"""
from __future__ import annotations

import csv
import io
import json
import sqlite3
import sys
import tomllib
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET

DOCS = Path(__file__).resolve().parent.parent / "docs"
errors: list[str] = []


def check(cond, msg):
    if not cond:
        errors.append(msg)


def pairs_from_csv(text, delim=","):
    rows = list(csv.reader(io.StringIO(text), delimiter=delim))
    check(rows[0] == ["日付", "名称", "曜日"], f"見出しが違います: {rows[0]}")
    return {r[0]: r[1] for r in rows[1:]}


def verify_set(base: Path, expect: dict):
    def p(ext):
        return base.parent / f"{base.name}.{ext}"

    name = base.relative_to(DOCS)
    check(json.loads(p("json").read_text("utf-8")) == expect, f"{name}.json")
    check({d["date"]: d["name"] for d in json.loads(p("list.json").read_text("utf-8"))} == expect, f"{name}.list.json")
    check({(d := json.loads(l))["date"]: d["name"] for l in p("jsonl").read_text("utf-8").splitlines()} == expect, f"{name}.jsonl")
    raw = p("csv").read_bytes()
    check(not raw.startswith(b"\xef\xbb\xbf"), f"{name}.csv に BOM があります")
    check(pairs_from_csv(raw.decode("utf-8")) == expect, f"{name}.csv")
    bom = p("bom.csv").read_bytes()
    check(bom.startswith(b"\xef\xbb\xbf"), f"{name}.bom.csv に BOM がありません")
    check(pairs_from_csv(bom.decode("utf-8-sig")) == expect, f"{name}.bom.csv")
    check(pairs_from_csv(p("sjis.csv").read_bytes().decode("cp932")) == expect, f"{name}.sjis.csv")
    check(pairs_from_csv(p("tsv").read_text("utf-8"), "\t") == expect, f"{name}.tsv")
    root = ET.parse(p("xml")).getroot()
    check({e.get("date"): e.text for e in root} == expect, f"{name}.xml")
    t = tomllib.loads(p("toml").read_text("utf-8"))
    check({str(h["date"]): h["name"] for h in t["holidays"]} == expect, f"{name}.toml")
    # YAML は標準ライブラリに読み手が無いので、書式の形だけ確かめる
    y = p("yaml").read_text("utf-8").splitlines()
    got = {y[i][len("- date: "):]: json.loads(y[i + 1][len("  name: "):]) for i in range(0, len(y), 3)}
    check(got == expect, f"{name}.yaml")
    ics = p("ics").read_bytes().decode("utf-8")
    check(ics.count("BEGIN:VEVENT") == len(expect), f"{name}.ics の件数")
    check("\r\n" in ics and "\n" not in ics.replace("\r\n", ""), f"{name}.ics の改行が CRLF でない")
    for line in ics.split("\r\n"):
        check(len(line.encode("utf-8")) <= 75, f"{name}.ics に75バイト超の行: {line[:30]}")
    con = sqlite3.connect(":memory:")
    con.executescript(p("sql").read_text("utf-8"))
    check(dict(con.execute("SELECT date, name FROM holidays")) == expect, f"{name}.sql")
    check(p("md").read_text("utf-8").count("\n| ") == len(expect) + 1, f"{name}.md")
    check(p("html").read_text("utf-8").count("<tr><td>") == len(expect), f"{name}.html")


def main():
    meta = json.loads((DOCS / "meta.json").read_text("utf-8"))
    expect = json.loads((DOCS / "all.json").read_text("utf-8"))
    check(len(expect) == meta["count"], "件数が meta.json と違います")

    verify_set(DOCS / "all", expect)
    con = sqlite3.connect(DOCS / "all.sqlite")
    check(dict(con.execute("SELECT date, name FROM holidays")) == expect, "all.sqlite")
    with zipfile.ZipFile(DOCS / "all.xlsx") as z:
        check(z.testzip() is None, "all.xlsx が壊れています")
        sheet = ET.fromstring(z.read("xl/worksheets/sheet1.xml"))
        ns = {"s": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
        rows = [[t.text for t in r.iterfind(".//s:t", ns)] for r in sheet.iterfind(".//s:row", ns)]
        check({r[0]: r[2] for r in rows[1:]} == expect, "all.xlsx")

    for y in meta["years"]:
        verify_set(DOCS / "year" / str(y), {d: n for d, n in expect.items() if d.startswith(f"{y}-")})

    dates = sorted(p.stem for p in (DOCS / "date").glob("*.json"))
    check(dates == sorted(expect), "date/ の日付ファイルが揃っていません")

    ET.parse(DOCS / "feed.rss")
    ET.parse(DOCS / "feed.atom")

    if errors:
        print(f"検査で {len(errors)} 件の問題:", *errors[:30], sep="\n  ")
        return 1
    print(f"全形式を検査しました（{len(expect)}件・{len(meta['years'])}年分）")
    return 0


if __name__ == "__main__":
    sys.exit(main())
