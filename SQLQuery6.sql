SELECT * FROM emp1
SELECT * FROM emp1 WHERE 
hiredate >= FORMAT(DATEADD(yy,-5,GETDATE()),'yyyy-MM-dd')

SELECT DATEDIFF(yy,'2025-03-03',GETDATE())
SELECT DATEDIFF(MM,'2025-03-03',GETDATE())
SELECT DATEDIFF(dd,'2025-03-03',GETDATE())

SELECT ename,DATEDIFF(yy,hiredate,GETDATE()) AS experience,hiredate
FROM emp1

SELECT  ename,DATEDIFF(MM,hiredate,GETDATE()) AS experience_Months FROM emp1

SELECT ename, DATEDIFF(dd,hiredate,GETDATE()) AS ex_DAYS FROM emp1

SELECT ename,hiredate,
		DATEDIFF(MM,hiredate,GETDATE())/12 AS years,
		DATEDIFF(MM,hiredate,GETDATE())%12 AS months
FROM emp1

SELECT * FROM emp1 WHERE 
DATEDIFF(yy,hiredate,GETDATE()) > 5

SELECT EOMONTH(GETDATE())
SELECT EOMONTH(GETDATE(),1)
SELECT EOMONTH(GETDATE(),-1)

SELECT DATEADD(dd,1,EOMONTH(GETDATE()))
SELECT DATEADD(dd,1,EOMONTH(GETDATE(),-1))


SELECT DATEADD(dd,1,EOMONTH(GETDATE(),9))

SELECT DATEADD(dd,1,EOMONTH(GETDATE(),-3))

SELECT ename,sal,ISNULL(comm,500) AS comm FROM emp1

SELECT ename,sal,sal+ISNULL(comm,0) AS TOTSAL FROM emp1

SELECT COALESCE(NULL,NULL,200,300)

SELECT ename,sal,ISNULL(CAST(comm AS VARCHAR),'N/A') AS comm FROM emp1

--Analytical function(window function)
-- RANK()
-- DENSE_RANK()

SELECT empno,ename,sal,
		RANK() OVER(ORDER BY sal DESC) AS rnk
FROM emp1

SELECT empno,ename,sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1

SELECT empno,ename,hiredate,sal,
DENSE_RANK()OVER(ORDER BY sal DESC, hiredate ASC) AS rnk
FROM emp1

SELECT deptno,ename,sal,
DENSE_RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) AS rnk
FROM emp1

SELECT  deptno,ename,sal,
DENSE_RANK()OVER( ORDER BY sal DESC) AS rnk
FROM emp1

WITH E AS
  (SELECT  sal,
   DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
   FROM emp1 )
SELECT sal FROM E WHERE rnk=5

WITH E AS 
(SELECT sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1)
SELECT sal FROM E WHERE rnk=3

WITH E AS 
(SELECT empno,ename,sal,
DENSE_RANK()OVER(ORDER BY sal DESC) AS rnk
FROM emp1)
SELECT * FROM E WHERE rnk<=5

SELECT empno,ename,sal,
	ROW_NUMBER()OVER(ORDER BY sal DESC) AS RNO
FROM emp1

SELECT * FROM emp1

SELECT empno,ename,sal,
	ROW_NUMBER()OVER(ORDER BY empno) AS rno
FROM emp1

