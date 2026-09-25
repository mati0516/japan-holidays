CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2022-01-01', '元日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-01-10', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-02-11', '建国記念の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-02-23', '天皇誕生日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-03-21', '春分の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-04-29', '昭和の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-05-03', '憲法記念日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-05-04', 'みどりの日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-05-05', 'こどもの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-07-18', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-08-11', '山の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-09-19', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-09-23', '秋分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-10-10', 'スポーツの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-11-03', '文化の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2022-11-23', '勤労感謝の日', '水');
