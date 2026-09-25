CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2002-01-01', '元日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-01-14', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-02-11', '建国記念の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-03-21', '春分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-04-29', 'みどりの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-05-03', '憲法記念日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-05-04', '休日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-05-05', 'こどもの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-05-06', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-07-20', '海の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-09-15', '敬老の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-09-16', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-09-23', '秋分の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-10-14', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-11-03', '文化の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-11-04', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-11-23', '勤労感謝の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2002-12-23', '天皇誕生日', '月');
