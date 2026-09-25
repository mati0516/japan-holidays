CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1989-01-01', '元日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-01-02', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-01-15', '成人の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-01-16', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-02-11', '建国記念の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-02-24', '大喪の礼', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-03-21', '春分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-04-29', 'みどりの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-05-03', '憲法記念日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-05-04', '休日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-05-05', 'こどもの日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-09-15', '敬老の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-09-23', '秋分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-10-10', '体育の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-11-03', '文化の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-11-23', '勤労感謝の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1989-12-23', '天皇誕生日', '土');
