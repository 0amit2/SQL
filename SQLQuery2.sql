use DB7AM
SELECT * FROM cust WHERE cid=100 OR cid=103 OR cid=105
SELECT * FROM cust

SELECT * FROM cust WHERE city ='hyd' OR city='blr'

SELECT * FROM cust WHERE city='hyd' AND age>30

SELECT * FROM cust WHERE age>30 AND age<40

SELECT * FROM cust WHERE city='hyd' OR city='Bhr' AND age>20
SELECT * FROM cust 

CREATE TABLE Student(
sid TINYINT,
name VARCHAR(20),
s1 TINYINT,
s2 TINYINT,
s3 TINYINT)

INSERT INTO student VALUES(1,'A',80,90,70),
						(2,'B',30,60,40),
						(3,'C',60,20,30),
						(4,'D',10,10,30)

SELECT * FROM student
-- pass
SELECT * FROM student WHERE s1>=35 AND s2>=35 AND s3>35

-- fail
SELECT * FROM student WHERE s1<35 OR s2<35 OR s3<35

-- fail in 1 sub
SELECT * FROM student WHERE
(s1<35 AND s2>=35 AND s3>=35)
OR (s1>=35 AND s2<35 AND s3>=35)
OR (s1>=35 AND s2>=35 AND s3<35)

-- fail in 2 sub
SELECT * FROM student WHERE
(s1<35 AND s2<35 AND s3>=35)
OR (s1>=35 AND s2<35 AND s3<35)
OR (s1<35 AND s2>=35 AND s3<35)

-- fail in 3 sub
SELECT * FROM student WHERE
(s1<35 AND s2<35 AND s3<35)

