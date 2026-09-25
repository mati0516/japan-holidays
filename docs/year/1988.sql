CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1988-01-01', '元日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-01-15', '成人の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-02-11', '建国記念の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-03-20', '春分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-03-21', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-04-29', '天皇誕生日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-05-03', '憲法記念日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-05-04', '休日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-05-05', 'こどもの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-09-15', '敬老の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-09-23', '秋分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-10-10', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-11-03', '文化の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1988-11-23', '勤労感謝の日', '水');
