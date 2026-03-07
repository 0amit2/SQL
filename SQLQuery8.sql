USE DB7AM
CREATE TABLE sale(
id  INT,
sdate DATE,
amt MONEY)

INSERT INTO sale (id, sdate, amt) VALUES
(1,  '2024-01-01', 1000),
(2,  '2024-01-02', 1050),
(3,  '2024-01-03', 980),
(4,  '2024-01-04', 1200),
(5,  '2024-01-05', 1250),
(6,  '2024-01-06', 1100),
(7,  '2024-01-07', 1300),
(8,  '2024-01-08', 1280),
(9,  '2024-01-09', 1350),
(10, '2024-01-10', 1400),
(11, '2024-01-11', 1380),
(12, '2024-01-12', 1450),
(13, '2024-01-13', 1500),
(14, '2024-01-14', 1480),
(15, '2024-01-15', 1550),
(16, '2024-01-16', 1600),
(17, '2024-01-17', 1580),
(18, '2024-01-18', 1650),
(19, '2024-01-19', 1700),
(20, '2024-01-20', 1750)

SELECT * FROM sale

SELECT * ,
SUM(amt) OVER(ORDER BY sdate ASC) AS running_total
FROM sale

SELECT *,
LAG(amt,1)OVER(ORDER BY sdate ASC) AS prev_day_sale,
amt-LAG(amt,1)OVER(ORDER BY sdate ASC) AS differenc
FROM sale

WITH E AS
(SELECT *,
LAG(amt,1)OVER(ORDER BY sdate ASC) AS prev_day_sale,
amt-LAG(amt,1)OVER(ORDER BY sdate ASC) AS differenc
FROM sale)
SELECT *,
(differenc/prev_day_sale)*100 AS pct
FROM E 

SELECT empno,ename,sal,
	AVG(sal)OVER(ORDER BY empno ASC) AS moving_avg
FROM emp1

SELECT *, AVG(amt)OVER(ORDER BY sdate ASC
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg
FROM sale

SELECT deptno,SUM(sal) AS totsal 
FROM emp1
GROUP BY deptno

SELECT job,MIN(sal) AS minsal,
		   MAX(sal) AS maxsal,
		   SUM(sal) AS totsal,
		   COUNT(*) AS cnt
FROM emp1
GROUP BY job

SELECT YEAR(hiredate) AS year ,COUNT(*) AS cnt
FROM emp1 
GROUP BY YEAR(hiredate)

SELECT DATENAME(DW,hiredate) AS day,COUNT(*) AS cnt
FROM emp1
GROUP BY DATENAME(DW,hiredate)

SELECT DATENAME(MM,hiredate) AS month ,COUNT(*) AS cnt
FROM emp1
WHERE YEAR(hiredate)=2023
GROUP BY DATENAME(MM,hiredate)

SELECT deptno,COUNT(*) AS cnt
FROM emp1
WHERE COUNT(*)>3
GROUP BY deptno 

SELECT deptno FROM emp1
GROUP BY deptno
HAVING COUNT(*) >3

SELECT deptno,job,SUM(sal) AS totsal
FROM emp1
GROUP BY deptno,job
ORDER BY deptno ASC

SELECT YEAR(hiredate) AS years,
DATEPART(qq,hiredate) AS qrt,
COUNT(*) AS no_of_emp
FROM emp1
GROUP BY YEAR(hiredate),DATEPART(QQ,hiredate)
ORDER BY years