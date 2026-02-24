--

USE DB7AM
--SHOW TABLES;
SELECT * FROM CUST

INSERT INTO cust VALUES (106,'Mohit',88,NULL,'2023-04-11')
INSERT INTO cust(cid,name,age,dor) VALUES (107,'Sohit',45,'2023-04-11')
SELECT * FROM CUST

SELECT name,city FROM cust
SELECT name,city,age FROM cust
SELECT * FROM cust WHERE cid=103

SELECT *
FROM cust
WHERE cid=106

SELECT * FROM cust WHERE name='Amit'

SELECT age FROM cust WHERE name='Amit'

SELECT city FROM cust WHERE name='Amit'

SELECT * FROM cust WHERE age>30

SELECT * FROM cust WHERE dor>'2025'

SELECT * FROM cust WHERE dor<'2025-01-01'

SELECT * FROM cust WHERE city='hyd'
SELECT * FROM cust WHERE city !='hyd'
SELECT * FROM cust WHERE city <> 'hyd'