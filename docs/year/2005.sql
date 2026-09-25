CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2005-01-01', '元日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-01-10', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-02-11', '建国記念の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-03-20', '春分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-03-21', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-04-29', 'みどりの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-05-03', '憲法記念日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-05-04', '休日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-05-05', 'こどもの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-07-18', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-09-19', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-09-23', '秋分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-10-10', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-11-03', '文化の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-11-23', '勤労感謝の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2005-12-23', '天皇誕生日', '金');
