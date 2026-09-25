CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2016-01-01', '元日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-01-11', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-02-11', '建国記念の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-03-20', '春分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-03-21', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-04-29', '昭和の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-05-03', '憲法記念日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-05-04', 'みどりの日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-05-05', 'こどもの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-07-18', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-08-11', '山の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-09-19', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-09-22', '秋分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-10-10', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-11-03', '文化の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-11-23', '勤労感謝の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2016-12-23', '天皇誕生日', '金');
