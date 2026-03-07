


SELECT ename,
	CASE job
	WHEN 'MANAGER' THEN 'BOSS'
	WHEN 'PRESIDENT' THEN 'BIG BOSS'
	WHEN 'CLERK' THEN 'WORKER'
	ELSE 'EMPLOYER'
	END AS job
FROM emp1

SELECT ename,
	CASE job
	WHEN 'MANAGER' THEN 'BOSS'
	WHEN 'PRESIDENT' THEN 'BIG BOSS'
	WHEN 'CLERK' THEN 'WORKER'
	ELSE job
	END AS job
FROM emp1

SELECT ename,
		CASE deptno
		WHEN 10 THEN 'ACCOUNTS'
		WHEN 20 THEN 'RESEARCH'
		WHEN 30 THEN 'SALES'
		ELSE 'UNKNOWN'
		END AS dept_name
FROM emp1

SELECT * FROM emp1

SELECT ename,sal,
	CASE 
	WHEN sal>3000 THEN 'HISAL'
	WHEN sal<3000 THEN 'LOSAL'
	ELSE 'AVGSAL'
	END AS salrange
FROM emp1

SELECT * FROM student

SELECT sid,
		s1+s2+s3 AS TOTAL,
		(s1+s2+s3)/3 AS AVG,
	CASE
	WHEN s1>=35 AND s2>=35 AND s3>=35 THEN 'PASS'
	ELSE 'FAIL'
	END AS result
FROM student

SELECT * FROM emp1  ORDER BY ename ASC
SELECT * FROM emp1 ORDER BY sal DESC
SELECT * FROM emp1 ORDER BY hiredate ASC

SELECT empno,ename,sal,deptno FROM emp1
		ORDER BY deptno ASC,sal DESC

SELECT empno,ename,hiredate,deptno FROM emp1
		ORDER BY deptno ASC,hiredate ASC


SELECT * FROM student2

SELECT * , (m+p+c)/3 AS avg
FROM student2
ORDER BY (m+p+c)/3 DESC,m DESC, p DESC

SELECT * FROM emp1 
WHERE job IN ('CLERK','MANAGER')
ORDER BY sal DESC

SELECT DISTINCT job FROM emp1
SELECT DISTINCT deptno FROM emp1

SELECT TOP 5 * FROM emp1

SELECT TOP 5 * FROM emp1
ORDER BY sal DESC

SELECT TOP 5 * FROM emp1
ORDER BY hiredate ASC


			