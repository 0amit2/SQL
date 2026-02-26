USE DB7AM

SELECT * FROM student
SELECT * FROM cust
SELECT * FROM cust WHERE cid IN (100,102,105)
SELECT * FROM cust WHERE city IN ('blr','bhr','hyd')
SELECT * FROM cust WHERE city NOT IN ('blr','hyd')
SELECT * FROM cust WHERE age BETWEEN 30 AND 40
SELECT * FROM cust WHERE dor BETWEEN '2020-01-01' AND '2020-12-31'
SELECT * FROM cust WHERE dor NOT BETWEEN '2020-01-01' AND '2020-12-31'
SELECT * FROM cust WHERE city IN ('hyd','mum')
					AND (age BETWEEN 30 AND 40)
					AND (dor NOT BETWEEN '2020-01-01' AND '2020-12-31')

SELECT *FROM cust WHERE name LIKE 'S%'
SELECT *FROM cust WHERE NAME LIKE '%d'
SELECT * FROM cust WHERE name LIKE '%a%'
SELECT * FROM cust WHERE name LIKE '___a%'
SELECT * FROM cust WHERE name LIKE '____'
SELECT * FROM cust WHERE name LIKE 'a%'
					OR name LIKE 'e%'
					OR name LIKE 'i%'
					OR name LIKE 'o%'
					OR name LIKE 'u%'
SELECT * FROM cust WHERE name LIKE '[aeiou]%'
SELECT * FROM cust WHERE name LIKE '[a-p]%'
SELECT * FROM cust WHERE dor LIKE '_____04___'
SELECT * FROM cust WHERE dor LIKE '2020______'
SELECT * FROM cust WHERE dor LIKE '2020%'
SELECT * FROM cust WHERE dor LIKE '________0[1-9]'
SELECT * FROM cust WHERE dor LIKE '________0_'
SELECT * FROM cust WHERE dor LIKE '%0_'
SELECT * FROM cust WHERE name NOT LIKE '[aeiou]%'

CREATE TABLE student1(
sid TINYINT,
sname VARCHAR(20)
)
INSERT INTO student1 VALUES(10,'sachin_tendulkar'),(11,'virat%kholi'),(12,'mahandra_singh_dhoni')
SELECT * FROM student1
SELECT * FROM student1 WHERE sname LIKE '%_%'
SELECT * FROM student1 WHERE sname LIKE '%\_%' ESCAPE '\'
SELECT * FROM student1 WHERE sname LIKE '%\%%' ESCAPE '\'
SELECT * FROM student1 WHERE sname LIKE '%\_%\_%' ESCAPE '\'
SELECT * FROM student1 WHERE sname LIKE '%\%%\%%' ESCAPE '\'