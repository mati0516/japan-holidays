CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2026-01-01', '元日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-01-12', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-02-11', '建国記念の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-02-23', '天皇誕生日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-03-20', '春分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-04-29', '昭和の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-05-03', '憲法記念日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-05-04', 'みどりの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-05-05', 'こどもの日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-05-06', '休日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-07-20', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-08-11', '山の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-09-21', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-09-22', '休日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-09-23', '秋分の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-10-12', 'スポーツの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-11-03', '文化の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2026-11-23', '勤労感謝の日', '月');
