CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('1963-01-01', '元日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-01-15', '成人の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-03-21', '春分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-04-29', '天皇誕生日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-05-03', '憲法記念日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-05-05', 'こどもの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-09-24', '秋分の日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-11-03', '文化の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('1963-11-23', '勤労感謝の日', '土');
