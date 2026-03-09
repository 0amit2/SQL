SELECT * FROM dept1

SELECT e.*,d.*
FROM emp1 AS e INNER JOIN dept1 AS d
ON e.deptno = d.deptno

SELECT MAX(sal) FROM emp1 WHERE 
sal != (SELECT MAX(sal) FROM emp1 )

SELECT * FROM emp1
SELECT * FROM dept1
ORDER BY saL DESC

SELECT ename,sal FROM emp1 WHERE 
sal=(SELECT MAX(sal) FROM emp1 WHERE 
	 sal <> (SELECT MAX(sal) FROM emp1))

SELECT ename FROM emp1 WHERE 
deptno IN (SELECT deptno FROM dept1 WHERE loc IN ('NEW YORK','CICAGO'))

CREATE TABLE emp2
(empno TINYINT,
ename VARCHAR(20),
sal MONEY,
deptno INT)
INSERT INTO emp2 VALUES (1,'A',5000,10),(2,'B',3000,20),
						(3,'C',4000,30),(4,'D',4000,10),
						(5,'E',5000,20)

SELECT * FROM emp2 WHERE 
sal> (SELECT AVG(sal) FROM emp2)

SELECT * FROM emp2 AS e
WHERE sal > (SELECT AVG(sal) FROM emp2 WHERE deptno=e.deptno )

SELECT * FROM emp2 AS e 
WHERE sal =(SELECT MAX(sal) FROM emp2 WHERE deptno=e.deptno)

SELECT DISTINCT TOP 3 sal FROM emp1
ORDER BY sal DESC

SELECT DISTINCT A.sal FROM emp2 AS A
WHERE 3>(SELECT COUNT(DISTINCT B.sal)
			FROM emp2 AS B WHERE A.sal<B.sal)
ORDER BY  A.sal DESC

SELECT DISTINCT A.sal FROM emp2 AS A
WHERE (3-1)=(SELECT COUNT(DISTINCT B.sal)
			FROM emp2 AS B WHERE A.sal<B.sal)
ORDER BY  A.sal DESC

--FUNCTION
CREATE OR ALTER FUNCTION getTopNsal(@n INT) RETURNS TABLE AS 
RETURN(
SELECT DISTINCT A.sal FROM emp2 AS A
WHERE (@n-1)=(SELECT COUNT(DISTINCT B.sal)
			FROM emp2 AS B WHERE A.sal<B.sal)
)
SELECT * FROM DBO.getTopNsal(3)

--Drived Table
SELECT * 
FROM(SELECT empno,ename,sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1) AS E
WHERE rnk <=5

SELECT DISTINCT sal
FROM(SELECT sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1) AS E
WHERE rnk <=3
ORDER BY sal DESC

SELECT DISTINCT sal
FROM(SELECT sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1) AS E
WHERE rnk =11

SELECT *
FROM (SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1) AS E
WHERE rno<=5

SELECT *
FROM (SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1) AS E
WHERE rno>=(SELECT COUNT(*)-2 FROM emp1)



SELECT * FROM emp2