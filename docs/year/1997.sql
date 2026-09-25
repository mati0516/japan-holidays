CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1997-01-01', '元日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-01-15', '成人の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-02-11', '建国記念の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-03-20', '春分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-04-29', 'みどりの日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-05-03', '憲法記念日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-05-05', 'こどもの日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-07-20', '海の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-07-21', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-09-15', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-09-23', '秋分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-10-10', '体育の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-11-03', '文化の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-11-23', '勤労感謝の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-11-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1997-12-23', '天皇誕生日', '火');
