CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2023-01-01', '元日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-01-02', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-01-09', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-02-11', '建国記念の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-02-23', '天皇誕生日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-03-21', '春分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-04-29', '昭和の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-05-03', '憲法記念日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-05-04', 'みどりの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-05-05', 'こどもの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-07-17', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-08-11', '山の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-09-18', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-09-23', '秋分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-10-09', 'スポーツの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-11-03', '文化の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2023-11-23', '勤労感謝の日', '木');
