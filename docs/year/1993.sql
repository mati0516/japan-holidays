CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1993-01-01', '元日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-01-15', '成人の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-02-11', '建国記念の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-03-20', '春分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-04-29', 'みどりの日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-05-03', '憲法記念日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-05-04', '休日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-05-05', 'こどもの日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-06-09', '結婚の儀', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-09-15', '敬老の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-09-23', '秋分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-10-10', '体育の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-10-11', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-11-03', '文化の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-11-23', '勤労感謝の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1993-12-23', '天皇誕生日', '木');
