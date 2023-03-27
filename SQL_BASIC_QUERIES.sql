INSERT INTO EMPLOYEE_DATA VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

SELECT * FROM EMPLOYEE_DATA a

INSERT INTO EMPLOYEE_SALARY VALUES 
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)


SELect jobtitle,max(salary)  FROM project1..employee_salary
where jobtitle = 'Salesman'
group by jobtitle

SELect * FROM employee_data
where age between 20 and 30 
--firstname like '%vin'
and gender is not null

SELECT GENDER, COUNT(GENDER)
FROM EMPLOYEE_DATA
--WHERE AGE > 30
GROUP BY GENDER
ORDER BY 1 DESC

SELECT * FROM 
EMPLOYEE_DATA A FULL OUTER JOIN EMPLOYEE_SALARY B ON
A.EMPID=B.EMPID

select jobtitle,avg(salary) from employee_salary
group by jobtitle
having count(jobtitle) > 1
order by avg(salary) desc

SELECT * FROM 
EMPLOYEE_DATA A LEFT JOIN EMPLOYEE_SALARY B ON
A.EMPID=B.EMPID

SELECT * FROM 
EMPLOYEE_DATA A RIGHT JOIN EMPLOYEE_SALARY B ON
A.EMPID=B.EMPID

select * from employee_salary

select * from employee_salary


SELECT * FROM 
EMPLOYEE_DATA A INNER JOIN EMPLOYEE_SALARY B ON
A.EMPID=B.EMPID

select distinct(empid) from
(select * from employee_salary
union 
select empid,firstname,age from employee_data
) a

select salary,empid,
case 
	when empid = '1001' then salary + 2* salary
	when empid = '1002' then salary + salary
	
END
from employee_salary

--updateing the values in a row
update employee_salary
set salary = 90
where empid = 1001

select * from employee_salary

--delete - only for a specific row in the table
DELETE FROM EMPLOYEE_DATA
WHERE EMPID=1001
SELECT * FROM EMPLOYEE_DATA

--PARITION BY DOES PARTITION OF THE DATA AND THEN APPLY FUNCTIONS ON IT
SELECT * ,
COUNT(GENDER) OVER(PARTITION BY GENDER)
FROM EMPLOYEE_DATA 

--CTE-COMMON TABLE EXPRESSION- IT ACTS LIKE A SUBQUERY
WITH CTE_NEW AS 
(
SELECT FIRSTNAME,LASTNAME,SALARY,GENDER,
COUNT(GENDER) OVER (PARTITION BY GENDER),
AVG(SALARY) OVER(PARTITION BY GENDER)
FROM EMPLOYEE_DATA D JOIN EMPLOYEE_SALARY S
ON D.EMPID = S.EMPID
--WHERE SALARY > '45000'
) 

--TEMP TABLE 
DROP TABLE IF EXISTS #TEMP_EMP
CREATE TABLE #TEMP_EMP(
EMPID INT,
JOBTITLE VARCHAR(50),
AVG_SALARY INT
)

INSERT INTO #TEMP_EMP
SELECT EMPID,JOBTITLE,AVG(SALARY)
FROM EMPLOYEE_SALARY
GROUP BY EMPID,JOBTITLE

SELECT* FROM #TEMP_EMP

--TRIM,LOWER,UPPER,LTRIM,RTRIM,REPLACE,SUBSTRING
SELECT EMPID,REPLACE(EMPID,1001,'')
FROM EMPLOYEE_SALARY


--SUBSTRING CAN BE USED FOR FUZZY MATCHING
SELECT SUBSTRING(LASTNAME,1,2)
FROM EMPLOYEE_DATA
SELECT * FROM EMPLOYEE_DATA