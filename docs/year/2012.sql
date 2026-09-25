CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2012-01-01', '元日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-01-02', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-01-09', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-02-11', '建国記念の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-03-20', '春分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-04-29', '昭和の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-04-30', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-05-03', '憲法記念日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-05-04', 'みどりの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-05-05', 'こどもの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-07-16', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-09-17', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-09-22', '秋分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-10-08', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-11-03', '文化の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-11-23', '勤労感謝の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-12-23', '天皇誕生日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2012-12-24', '休日', '月');
