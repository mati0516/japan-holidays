CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1981-01-01', '元日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-01-15', '成人の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-02-11', '建国記念の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-03-21', '春分の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-04-29', '天皇誕生日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-05-03', '憲法記念日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-05-04', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-05-05', 'こどもの日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-09-15', '敬老の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-09-23', '秋分の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-10-10', '体育の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-11-03', '文化の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1981-11-23', '勤労感謝の日', '月');
