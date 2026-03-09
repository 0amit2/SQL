
CREATE TABLE emp1(
empno INT PRIMARY KEY,
ename VARCHAR(50),
job VARCHAR(50),
mgr INT,
hiredate DATE,
sal INT,
comm INT,
deptno INT
);

INSERT INTO emp1 VALUES
(1001,'Amit','Manager',NULL,'2015-01-10',80000,NULL,10),
(1002,'Rahul','Analyst',1001,'2017-03-12',60000,NULL,10),
(1003,'Sneha','Clerk',1002,'2019-07-01',35000,NULL,10),
(1004,'Ravi','Salesman',1001,'2018-04-22',40000,5000,20),
(1005,'Priya','Salesman',1001,'2018-09-15',42000,6000,20),
(1006,'Neha','Clerk',1002,'2020-02-10',32000,NULL,10),
(1007,'Karan','Analyst',1001,'2017-11-05',62000,NULL,30),
(1008,'John','Clerk',1007,'2021-06-18',30000,NULL,30),
(1009,'David','Salesman',1001,'2018-01-25',45000,7000,20),
(1010,'Anita','Clerk',1007,'2022-03-12',31000,NULL,30),
(1011,'Rohit','Manager',NULL,'2014-05-19',85000,NULL,20),
(1012,'Simran','Analyst',1011,'2016-08-30',64000,NULL,20),
(1013,'Pooja','Clerk',1012,'2020-11-11',33000,NULL,20),
(1014,'Arjun','Salesman',1011,'2019-02-14',41000,4000,20),
(1015,'Vikas','Clerk',1012,'2021-09-09',30000,NULL,20),
(1016,'Nisha','Analyst',1001,'2018-12-01',61000,NULL,10),
(1017,'Deepak','Clerk',1016,'2022-05-17',29000,NULL,10),
(1018,'Kavita','Salesman',1011,'2019-10-10',43000,4500,20),
(1019,'Manoj','Clerk',1016,'2023-01-21',28000,NULL,10),
(1020,'Suresh','Analyst',1011,'2017-07-07',65000,NULL,20);

SELECT * FROM emp1

SELECT x.ename AS employee, y.ename AS manager
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr=y.empno

SELECT x.ename AS employee, y.ename AS manager
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr=y.empno
WHERE y.ename='Amit'

SELECT COUNT(x.ename)
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr=y.empno
WHERE y.ename='Amit'

SELECT x.ename ,x.sal, y.ename AS manager ,y.sal AS magsal
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr =y.empno
WHERE x.sal>y.sal

SELECT * FROM emp1

SELECT x.ename ,x.hiredate, y.ename AS manager ,y.hiredate AS magdate
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr =y.empno
WHERE x.hiredate < y.hiredate


SELECT x.ename , y.ename AS manager 
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr =y.empno
ORDER BY y.ename ASC

SELECT y.ename AS manager,COUNT(X.ename) AS no_of_emp
FROM emp1 AS x INNER JOIN emp1 AS y
ON x.mgr = y.empno
GROUP BY y.ename

CREATE TABLE team(
id INT,
country VARCHAR(10)
)
INSERT INTO team VALUES(1,'IND'),(2,'AUS'),(3,'SA')

SELECT A.country+ ' VS ' +B.country AS match
FROM team AS A INNER JOIN team AS B
ON A.id < B.id


SELECT job FROM emp1 WHERE deptno=20
UNION
SELECT job FROM emp1 WHERE deptno=30