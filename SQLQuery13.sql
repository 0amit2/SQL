create TABLE T3(amt MONEY)
INSERT INTO T3 VALUES(1000),(-200),(3000),(-500),(5000),(-400)

SELECT * FROM T3

SELECT * FROM T3 WHERE amt>=0
SELECT * FROM T3 WHERE amt<0

SELECT CASE
		WHEN amt>0 THEN amt
		END AS pos,
		CASE
		WHEN amt<0 THEN amt
		END AS neg
FROM T3

WITH  P AS
(SELECT ROW_NUMBER() OVER(ORDER BY amt ASC) AS rno,amt
FROM T3 WHERE amt>=0),
N AS
(SELECT ROW_NUMBER() OVER(ORDER BY amt ASC) AS rno,amt
FROM T3 WHERE amt<0)
SELECT P.amt AS pos,N.amt AS neg
FROM P INNER JOIN N
ON P.rno=N.rno

CREATE TABLE cricket(
teamA VARCHAR(20),
teamB VARCHAR(20),
winner  VARCHAR(20))

INSERT INTO cricket VALUES
('India','Australia','India'),
('India','England','England'),
('India','Pakistan','India'),
('India','South Africa','South Africa'),
('India','New Zealand','New Zealand'),
('Australia','England','Australia'),
('Australia','Pakistan','Australia'),
('Australia','South Africa','South Africa'),
('Australia','New Zealand','Australia'),
('Australia','India','India'),
('England','Pakistan','England'),
('England','South Africa','South Africa'),
('England','New Zealand','England'),
('England','India','India'),
('England','Australia','Australia'),
('Pakistan','South Africa','Pakistan'),
('Pakistan','New Zealand','New Zealand'),
('Pakistan','India','India'),
('Pakistan','Australia','Australia'),
('Pakistan','England','England'),
('South Africa','New Zealand','South Africa'),
('South Africa','India','India'),
('South Africa','Australia','Australia'),
('South Africa','England','England'),
('South Africa','Pakistan','Pakistan'),
('New Zealand','India','India'),
('New Zealand','Australia','Australia'),
('New Zealand','England','England'),
('New Zealand','Pakistan','Pakistan'),
('New Zealand','South Africa','South Africa'),
('India','Sri Lanka','India'),
('India','Bangladesh','India'),
('Australia','Sri Lanka','Australia'),
('Australia','Bangladesh','Australia'),
('England','Sri Lanka','England'),
('England','Bangladesh','England'),
('Pakistan','Sri Lanka','Pakistan'),
('Pakistan','Bangladesh','Bangladesh'),
('South Africa','Sri Lanka','South Africa'),
('South Africa','Bangladesh','South Africa'),
('New Zealand','Sri Lanka','New Zealand'),
('New Zealand','Bangladesh','New Zealand'),
('Sri Lanka','Bangladesh','Sri Lanka'),
('Sri Lanka','India','India'),
('Sri Lanka','Australia','Australia'),
('Sri Lanka','England','England'),
('Bangladesh','India','India'),
('Bangladesh','Australia','Australia'),
('Bangladesh','England','England'),
('Bangladesh','Pakistan','Pakistan');

SELECT * FROM cricket

WITH P AS
(SELECT country ,COUNT(*) AS played
FROM(SELECT teamA AS country FROM cricket
	UNION ALL
	SELECT teamB AS country FROM cricket) AS E
GROUP BY country),
W AS
(SELECT winner AS country,COUNT(*) AS won
FROM cricket
GROUP BY winner)
SELECT P.country, P.played,W.won,P.played-W.won AS lost
FROM P INNER JOIN W
ON P.country=W.country