CREATE TABLE IF NOT EXISTS holidays (
  date DATE PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  weekday CHAR(1) NOT NULL
);

INSERT INTO holidays (date, name, weekday) VALUES ('2019-01-01', '元日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-01-14', '成人の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-02-11', '建国記念の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-03-21', '春分の日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-04-29', '昭和の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-04-30', '休日', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-01', '休日（祝日扱い）', '水');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-02', '休日', '木');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-03', '憲法記念日', '金');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-04', 'みどりの日', '土');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-05', 'こどもの日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-05-06', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-07-15', '海の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-08-11', '山の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-08-12', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-09-16', '敬老の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-09-23', '秋分の日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-10-14', '体育の日（スポーツの日）', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-10-22', '休日（祝日扱い）', '火');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-11-03', '文化の日', '日');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-11-04', '休日', '月');
INSERT INTO holidays (date, name, weekday) VALUES ('2019-11-23', '勤労感謝の日', '土');
