CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1983-01-01', '元日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-01-15', '成人の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-02-11', '建国記念の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-03-21', '春分の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-04-29', '天皇誕生日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-05-03', '憲法記念日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-05-05', 'こどもの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-09-15', '敬老の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-09-23', '秋分の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-10-10', '体育の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-11-03', '文化の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1983-11-23', '勤労感謝の日', '水');
