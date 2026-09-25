CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2020-01-01', '元日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-01-13', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-02-11', '建国記念の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-02-23', '天皇誕生日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-02-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-03-20', '春分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-04-29', '昭和の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-05-03', '憲法記念日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-05-04', 'みどりの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-05-05', 'こどもの日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-05-06', '休日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-07-23', '海の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-07-24', 'スポーツの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-08-10', '山の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-09-21', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-09-22', '秋分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-11-03', '文化の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2020-11-23', '勤労感謝の日', '月');
