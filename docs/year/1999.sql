CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1999-01-01', '元日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-01-15', '成人の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-02-11', '建国記念の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-03-21', '春分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-03-22', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-04-29', 'みどりの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-05-03', '憲法記念日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-05-04', '休日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-05-05', 'こどもの日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-07-20', '海の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-09-15', '敬老の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-09-23', '秋分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-10-10', '体育の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-10-11', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-11-03', '文化の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-11-23', '勤労感謝の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1999-12-23', '天皇誕生日', '木');
