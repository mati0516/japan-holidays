CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2014-01-01', '元日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-01-13', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-02-11', '建国記念の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-03-21', '春分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-04-29', '昭和の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-05-03', '憲法記念日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-05-04', 'みどりの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-05-05', 'こどもの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-05-06', '休日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-07-21', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-09-15', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-09-23', '秋分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-10-13', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-11-03', '文化の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-11-23', '勤労感謝の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-11-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2014-12-23', '天皇誕生日', '火');
