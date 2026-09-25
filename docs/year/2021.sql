CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2021-01-01', '元日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-01-11', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-02-11', '建国記念の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-02-23', '天皇誕生日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-03-20', '春分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-04-29', '昭和の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-05-03', '憲法記念日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-05-04', 'みどりの日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-05-05', 'こどもの日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-07-22', '海の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-07-23', 'スポーツの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-08-08', '山の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-08-09', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-09-20', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-09-23', '秋分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-11-03', '文化の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2021-11-23', '勤労感謝の日', '火');
