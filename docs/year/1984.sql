CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1984-01-01', '元日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-01-02', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-01-15', '成人の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-01-16', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-02-11', '建国記念の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-03-20', '春分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-04-29', '天皇誕生日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-04-30', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-05-03', '憲法記念日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-05-05', 'こどもの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-09-15', '敬老の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-09-23', '秋分の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-09-24', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-10-10', '体育の日', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-11-03', '文化の日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('1984-11-23', '勤労感謝の日', '金');
