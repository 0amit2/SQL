SELECT*FROM emp1

SELECT empno,ename,sal,
	ROW_NUMBER() OVER(ORDER BY sal DESC) AS RNO
FROM emp1

SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1

WITH E AS
(SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1)
SELECT * FROM E WHERE rno<=5


WITH E AS
(SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1)
SELECT * FROM E WHERE rno IN (15,10,5)


WITH E AS
(SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1)
SELECT * FROM E WHERE rno%2=0


WITH E AS
(SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1)
SELECT * FROM E WHERE rno BETWEEN 5 AND 10


WITH E AS
(SELECT empno,ename,sal,
ROW_NUMBER()OVER(ORDER BY empno DESC) AS rno
FROM emp1)
DELETE FROM E WHERE rno<=3

SELECT * FROM emp1

CREATE TABLE emp44
( eno TINYINT,
  ename VARCHAR(10),
  sal INT)
INSERT INTO emp44 VALUES(1,'A',5000),(2,'B',6000),(3,'C',7000),(1,'A',5000),(2,'B',6000)

SELECT * FROM emp44

SELECT *,
ROW_NUMBER()OVER(PARTITION BY eno,ename,sal ORDER BY eno) AS rno
FROM emp44

WITH E AS
(SELECT *, ROW_NUMBER() OVER(PARTITION  BY eno,ename,sal ORDER BY eno) AS rno
FROM emp44)
DELETE FROM E WHERE rno>1
SELECT * FROM emp44

SELECT empno,ename,sal,
	LAG(sal,1) OVER(ORDER BY empno ASC) AS prev_sal
FROM emp1

CREATE TABLE population
(year INT,
population NUMERIC)

INSERT INTO population VALUES(2020,12335465),(2021,13234382),(2022,14234566),(2023,15243556),
(2024,16234547)
SELECT * FROM population

SELECT year,population,
	population-LAG(population,1)OVER(ORDER BY year ASC) AS growth
FROM population

SELECT year,population,
	population-LAG(population,1)OVER(ORDER BY year ASC) AS growth,
	((population-LAG(population,1)OVER(ORDER BY year ASC))/LAG(population,1)OVER(ORDER BY year ASC))*100 AS pct
FROM population

WITH P AS
(SELECT year,population,
	LAG(population,1)OVER(ORDER BY year ASC) AS previous_year_pop,
	population-LAG(population,1)OVER(ORDER BY year ASC) AS growth
FROM population)
SELECT year,population,previous_year_pop,growth,
	CAST((growth/previous_year_pop)*100 AS DECIMAL(4,1)) AS pct
FROM P

SELECT empno,ename,sal,
	LAG(sal,1) OVER(ORDER BY empno ASC) AS prev_sal
FROM emp1

DROP TABLE sales
CREATE TABLE sales
(id INT,
saledate DATE,
amt money)

INSERT INTO sales (id, saledate, amt) VALUES
(1,  '2024-01-01', 1345.67),
(2,  '2024-01-03', 987.23),
(3,  '2024-01-04', 2104.55),
(4,  '2024-01-07', 765.40),
(5,  '2024-01-08', 1890.10),
(6,  '2024-01-11', 2450.75),
(7,  '2024-01-12', 1120.90),
(8,  '2024-01-15', 980.00),
(9,  '2024-01-16', 1675.35),
(10, '2024-01-19', 2230.60),
(11, '2024-01-20', 1540.45),
(12, '2024-01-23', 875.25),
(13, '2024-01-24', 1999.99),
(14, '2024-01-27', 1425.80),
(15, '2024-01-28', 2660.15),
(16, '2024-01-31', 3050.70),
(17, '2024-02-01', 1210.10),
(18, '2024-02-04', 1785.55),
(19, '2024-02-05', 940.95),
(20, '2024-02-08', 2890.30);
SELECT * FROM sales

WITH E AS 
(SELECT *,
LAG(saledate,1)OVER(ORDER BY id ASC) AS prev_sale_date
FROM sales)
SELECT * FROM E
WHERE DATEDIFF(dd,prev_sale_date,saledate)>=3

--AGGREGATE FUNCTION
-- MAX()
SELECT MAX(sal) FROM emp1
SELECT MAX(hiredate) FROM emp1
SELECT MAX(ename) FROM emp1
SELECT MAX(LEN(ename)) FROM emp1

-- MIN()
SELECT MIN(sal) FROM emp1
SELECT MIN(hiredate) FROM emp1
SELECT MIN(ename) FROM emp1
SELECT MIN(LEN(ename)) FROM emp1

-- SUM()
SELECT SUM(sal) FROM emp1
SELECT SUM(sal) FROM emp1 WHERE job='MANAGER'
SELECT SUM(sal+ISNULL(comm,0)) FROM emp1

SELECT SUM(CASE job
			WHEN 'CLERK' THEN sal
			END) AS CLERK
FROM emp1

SELECT SUM(CASE job
		WHEN 'MANAGER' THEN sal
		END) AS manager,
	    SUM(CASE job
		WHEN 'CLERK' THEN sal
		END) AS CLERK,
		SUM(CASE job
		WHEN 'SALESMAN' THEN sal
		END) AS salesman
FROM emp1

--AVG()
SELECT AVG(sal) FROM emp1
SELECT FLOOR(AVG(sal)) FROM emp1
SELECT CEILING(AVG(sal)) FROM emp1

SELECT AVG(comm) FROM emp1

SELECT COUNT(empno) FROM emp1
SELECT COUNT(comm) FROM emp1

SELECT COUNT(*) FROM emp1

SELECT 1 FROM emp1
SELECT COUNT(1) FROM emp1

SELECT COUNT(1) FROM emp1 
WHERE YEAR(hiredate) =2023

SELECT COUNT(*) FROM emp1 WHERE 
DATENAME(DW,hiredate)='Sunday'

SELECT COUNT(*) FROM emp1 WHERE
deptno=10

SELECT COUNT(CASE deptno
		WHEN 10 THEN empno
		END) AS [10],
		COUNT(CASE deptno
		WHEN 20 THEN empno
		END) AS [20],
		COUNT(CASE deptno
		WHEN 30 THEN empno
		END) AS [30]
FROM emp1

SELECT ename FROM emp1 
WHERE sal=(SELECT MAX(sal) FROM emp1)

SELECT ename FROM emp1
WHERE hiredate=(SELECT MIN(hiredate) FROM emp1)
