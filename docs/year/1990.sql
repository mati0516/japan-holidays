CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1990-01-01', '元日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-01-15', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-02-11', '建国記念の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-02-12', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-03-21', '春分の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-04-29', 'みどりの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-04-30', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-05-03', '憲法記念日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-05-04', '休日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-05-05', 'こどもの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-09-15', '敬老の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-09-23', '秋分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-09-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-10-10', '体育の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-11-03', '文化の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-11-12', '即位礼正殿の儀', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-11-23', '勤労感謝の日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-12-23', '天皇誕生日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1990-12-24', '休日', '月');
