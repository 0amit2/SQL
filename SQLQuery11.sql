select * FROM emP1

WITH E AS
(SELECT COUNT(*) AS cnt FROM emp1
UNION
SELECT COUNT(*) AS cnt FROM dept)
SELECT SUM(cnt) FROM E

SELECT job FROM emp1 WHERE deptno=20
UNION ALL
SELECT job FROM emp1 WHERE deptno=30

SELECT job FROM emp1 WHERE deptno=20
INTERSECT
SELECT job FROM emp1 WHERE deptno=30

SELECT job FROM emp1 WHERE deptno=20
EXCEPT
SELECT job FROM emp1 WHERE deptno=30

SELECT * FROM emp1 WHERE sal> (SELECT sal FROM emp1 WHERE ename='AMIT')
SELECT * FROM emp1 WHERE HIREDATE<(SELECT hiredate FROM emp1 WHERE ename='NEHA')

SELECT ename FROM emp1 WHERE sal=(SELECT MAX(sal) FROM emp1)

SELECT ename,DATEDIFF(yy,HIREDATE,GETDATE()) AS expr
FROM emp1 WHERE hiredate=(SELECT MIN(hiredate) FROM emp1)

SELECT ename,DATEDIFF(yy,HIREDATE,GETDATE()) AS expr
FROM emp1 WHERE hiredate IN ((SELECT MIN(hiredate) FROM emp1),
								(SELECT MAX(hiredate) FROM emp1))

SELECT ename FROM emp1 WHERE 
deptno=(SELECT deptno FROM dept1 WHERE loc='NEW YORK')

SELECT * FROM dept

CREATE TABLE dept1(
deptno INT,
dname VARCHAR(20),
loc VARCHAR(20))
INSERT INTO dept1 VALUES(10,'ACCUNTS','NEW YORK'),(20,'RESEARCH','DALLAS'),
					(30,'SALES','CICAGO'),(40,'OPERATION','BOSTON')
SELECT * FROM dept1