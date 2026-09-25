# 日本の祝日・休日データ

内閣府が公表している「国民の祝日」を毎月自動で取り込み、さまざまな形式に変換して配布しています。
登録不要・無料で、ブラウザやプログラムから直接取得できます。

**公開ページ：https://mati0516.github.io/japan-holidays/**

## 特長

- **全自動で更新**：毎月1日に内閣府のデータを確認し、変更があればすべての形式を作り直します。
- **形式が豊富**：JSON・CSV（3種類の文字コード）・XML・YAML・TOML・iCalendar・RSS・Atom・SQL・SQLite・Excel など。
- **カレンダーに登録できる**：iCalendar の URL を登録すれば、Google カレンダーや iPhone に祝日が表示され続けます。
- **壊れたデータを配らない**：取得したデータの件数が急に減った、過去の祝日が変わった、などの異常を検知した場合は更新を止めます。

## 取得先

`https://mati0516.github.io/japan-holidays/` の後ろに、以下のパスを付けてください。

| 内容 | パス |
|---|---|
| 全件（1955年〜） | `all.<拡張子>` |
| 年ごと | `year/2026.<拡張子>` |
| その日が祝日か | `date/2026-01-01.json`（祝日でなければ 404） |
| RSS | `feed.rss` |
| Atom | `feed.atom` |
| 収録範囲などの情報 | `meta.json` |
| 最終確認日時 | `checked.json` |

## 形式の一覧

| 拡張子 | 内容 | 文字コード |
|---|---|---|
| `json` | 日付→名称の対応表 | UTF-8 |
| `list.json` | 配列（年・月・日・曜日つき） | UTF-8 |
| `jsonl` | JSON Lines（1行に1件） | UTF-8 |
| `csv` | CSV | UTF-8 |
| `bom.csv` | CSV（Excel でそのまま開けます） | UTF-8（BOM付き） |
| `sjis.csv` | CSV | Shift_JIS |
| `tsv` | タブ区切り | UTF-8 |
| `xml` | XML | UTF-8 |
| `yaml` | YAML | UTF-8 |
| `toml` | TOML | UTF-8 |
| `ics` | iCalendar（カレンダー登録用） | UTF-8 |
| `sql` | SQL（テーブル作成と INSERT 文） | UTF-8 |
| `md` | Markdown の表 | UTF-8 |
| `html` | HTML の表 | UTF-8 |
| `sqlite` | SQLite データベース（全件のみ） | — |
| `xlsx` | Excel（全件のみ） | — |

CSV・TSV の改行は CRLF です。列は「日付, 名称, 曜日」の順です。

## 使い方の例

### JSON

```
https://mati0516.github.io/japan-holidays/year/2026.json
```

```json
{
  "2026-01-01": "元日",
  "2026-01-12": "成人の日",
  ...
}
```

### 配列の JSON

```
https://mati0516.github.io/japan-holidays/year/2026.list.json
```

```json
[
  {
    "date": "2026-01-01",
    "name": "元日",
    "year": 2026,
    "month": 1,
    "day": 1,
    "weekday": "木",
    "weekday_en": "Thu"
  },
  ...
]
```

### 今日が祝日か調べる（JavaScript）

```js
const today = new Intl.DateTimeFormat('sv-SE', { timeZone: 'Asia/Tokyo' }).format(new Date());
const res = await fetch(`https://mati0516.github.io/japan-holidays/date/${today}.json`);
if (res.ok) {
  const h = await res.json();
  console.log(`今日は${h.name}です`);
} else {
  console.log('今日は祝日ではありません');
}
```

### Python

```python
import json, urllib.request

url = "https://mati0516.github.io/japan-holidays/all.json"
holidays = json.load(urllib.request.urlopen(url))
print(holidays.get("2026-05-05"))  # こどもの日
```

### シェル

```sh
curl -s https://mati0516.github.io/japan-holidays/year/2026.csv
```

### カレンダーに登録する

次の URL を登録してください。

```
https://mati0516.github.io/japan-holidays/all.ics
```

- **Google カレンダー**：「他のカレンダー」の「＋」→「URL で追加」
- **iPhone**：「設定」→「カレンダー」→「アカウント」→「アカウントを追加」→「その他」→「照会するカレンダーを追加」
- **Outlook**：「予定表を追加」→「Web から購読」

## 更新の仕組み

1. GitHub Actions が毎月1日 9時17分（日本時間）に動きます。
2. 内閣府の CSV（Shift_JIS）を取得し、内容に異常がないかを検査します。
3. 問題がなければ `docs/` 以下の全形式を作り直し、すべての形式を読み戻して中身が一致するかを確かめます。
4. コミットすると GitHub Pages に反映されます。

内閣府のデータに変更がない月も、確認日時（`docs/checked.json`）だけは更新します。
GitHub Actions の定期実行は、リポジトリに60日間動きがないと自動で止まってしまうためです。

手元で作り直す場合は、次のように実行します（Python 3.11 以上・標準ライブラリのみ）。

```sh
python scripts/generate.py            # 内閣府から取得して作り直す
python scripts/generate.py --offline  # data/ の CSV から作り直す
python scripts/validate.py            # 全形式を検査する
```

## 注意

- 曜日は内閣府のデータには含まれていないため、日付から計算して付けています。
- 名称が「休日」となっているものは、振替休日と国民の休日です（内閣府の表記どおり）。
- 内閣府は例年2月ごろに翌年分を公表します。法改正などで将来の祝日が変わった場合は、次の月初の確認で反映されます。
- 公式の情報ではありません。正確さが重要な用途では、内閣府の公表内容をご確認ください。

## 出典とライセンス

- データの出典：内閣府「[国民の祝日について](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html)」（CSV を加工して作成）
- 内閣府のコンテンツは「政府標準利用規約（第2.0版）」に基づいて利用しています。
- プログラム（`scripts/` など）は MIT ライセンスです。詳しくは `LICENSE` をご覧ください。
