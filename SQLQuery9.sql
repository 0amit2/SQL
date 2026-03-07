-- COUNTRIES TABLE
CREATE TABLE countries(
country_id INT PRIMARY KEY,
country_name VARCHAR(50)
);

INSERT INTO countries VALUES
(1,'India'),
(2,'USA'),
(3,'Germany'),
(4,'Japan'),
(5,'Canada');


-- LOCATIONS TABLE
CREATE TABLE locations(
locid INT PRIMARY KEY,
city VARCHAR(50),
state VARCHAR(50),
country_id INT
);

INSERT INTO locations VALUES
(101,'Patna','Bihar',1),
(102,'Bangalore','Karnataka',1),
(103,'New York','NY',2),
(104,'Berlin','Berlin',3),
(105,'Tokyo','Tokyo',4),
(106,'Toronto','Ontario',5);


-- DEPT TABLE
CREATE TABLE dept(
deptno INT PRIMARY KEY,
dname VARCHAR(50),
locid INT
);

INSERT INTO dept VALUES
(10,'HR',101),
(20,'Finance',102),
(30,'IT',103),
(40,'Sales',104),
(50,'Marketing',105),
(60,'Support',NULL);


-- EMP TABLE
CREATE TABLE emp(
empno INT PRIMARY KEY,
ename VARCHAR(50),
sal MONEY,
deptno INT
);

INSERT INTO emp VALUES
(1001,'Amit',50000,10),
(1002,'Rahul',60000,20),
(1003,'Sneha',75000,30),
(1004,'John',80000,30),
(1005,'Ravi',45000,40),
(1006,'Neha',70000,20),
(1007,'David',90000,50),
(1008,'Priya',65000,10),
(1009,'Karan',72000,70),
(1010,'Anita',55000,NULL);

SELECT e.ename,d.dname,l.city,l.state,c.country_name
FROM emp AS e INNER JOIN dept AS d
ON e.deptno=d.deptno
			  INNER JOIN locations AS l
ON d.locid=l.locid
			  INNER JOIN countries AS c
ON l.country_id=c.country_id

SELECT c.country_name,COUNT(e.empno) AS no_of_emp
FROM emp AS e INNER JOIN dept AS d
ON e.deptno=d.deptno
			INNER JOIN locations AS l
ON d.locid=l.locid
			INNER JOIN countries AS c
ON l.country_id=c.country_id
GROUP BY country_name

SELECT * FROM COUNTRIES

CREATE TABLE T1(F1 TINYINT)
INSERT INTO T1 VALUES(10),(20),(30)

CREATE TABLE T2(C1 VARCHAR(10))
INSERT INTO T2 VALUES('A'),('B'),('C')

SELECT * FROM T1

WITH A AS 
(SELECT ROW_NUMBER()OVER(ORDER BY F1 ASC) AS rno,F1 FROM T1),
 B AS
(SELECT ROW_NUMBER()OVER(ORDER BY C1 ASC) AS rno,C1 FROM T2)
SELECT A.F1,B.C1
FROM A INNER JOIN B
ON A.rno=B.rno 

SELECT * FROM emp

SELECT e.ename,d.dname
FROM emp AS e LEFT JOIN dept AS d
ON e.deptno = d.deptno

SELECT e.ename,d.dname
FROM emp AS e RIGHT JOIN dept AS d
ON e.deptno=d.deptno

SELECT d.dname,COUNT(e.empno) AS no_of_emp
FROM emp AS e RIGHT JOIN dept AS d
ON e.deptno=d.deptno
GROUP BY d.dname

SELECT  e.ename,d.dname
FROM emp AS e FULL JOIN dept AS d
ON e.deptno=d.deptno

SELECT e.ename,d.dname
FROM  emp AS e LEFT JOIN dept AS d
ON e.deptno=d.deptno
WHERE d.dname IS NULL

SELECT e.ename,d.dname
FROM emp AS e FULL JOIN dept AS d
ON e.deptno=d.deptno
WHERE e.ename IS NULL
		OR d.dname IS NULL

-- PRODUCTS TABLE
CREATE TABLE products(
prodid INT PRIMARY KEY,
pname VARCHAR(50),
price INT
);

INSERT INTO products VALUES
(101,'Laptop',70000),
(102,'Mobile',20000),
(103,'Keyboard',1000),
(104,'Mouse',500),
(105,'Monitor',15000);


-- ORDERS TABLE
CREATE TABLE orders(
ordid INT,
prodid INT,
qty INT
);

INSERT INTO orders VALUES
(1,101,2),
(2,102,1),
(3,103,5),
(4,104,3),
(5,101,1),
(6,105,2),
(7,102,4),
(8,106,2);  

SELECT * FROM orders
SELECT * FROM products

SELECT o.*,p.*
FROM orders AS O INNER JOIN products AS p
ON o.prodid=p.prodid

SELECT o.*,p.*
FROM orders AS o RIGHT JOIN products AS p
ON o.prodid=p.prodid

SELECT * FROM emp1



