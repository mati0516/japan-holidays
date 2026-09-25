CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2001-01-01', '元日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-01-08', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-02-11', '建国記念の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-02-12', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-03-20', '春分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-04-29', 'みどりの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-04-30', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-05-03', '憲法記念日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-05-04', '休日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-05-05', 'こどもの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-07-20', '海の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-09-15', '敬老の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-09-23', '秋分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-09-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-10-08', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-11-03', '文化の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-11-23', '勤労感謝の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-12-23', '天皇誕生日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2001-12-24', '休日', '月');
