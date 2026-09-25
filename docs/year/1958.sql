CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1958-01-01', '元日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-01-15', '成人の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-03-21', '春分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-04-29', '天皇誕生日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-05-03', '憲法記念日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-05-05', 'こどもの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-09-23', '秋分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-11-03', '文化の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1958-11-23', '勤労感謝の日', '日');
