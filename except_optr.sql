
--EXCEPT | select unique rows from left query that are not in right query
SELECT Id,Name FROM (SELECT Id, Name FROM tblStudents) tbl1
EXCEPT
SELECT Id, Name FROM
(SELECT EmployeeId Id, Name FROM tblEmployee) tbl2

--Except in self table
SELECT * FROM tblEmployee WHERE Salary>=8000
EXCEPT
SELECT * FROM tblEmployee WHERE Salary>=10000

--Another way to select unique rows from left query that are not in right query
SELECT * FROM tblEmployee WHERE Salary>=8000 AND
 EmployeeId NOT IN
 (SELECT EmployeeId FROM tblEmployee WHERE Salary>=10000)


SELECT DISTINCT EmployeeId, Name, Salary FROM (
SELECT * FROM tblEmployee WHERE Salary>=8000
UNION ALL
SELECT * FROM tblEmployee WHERE Salary>=10000
) tbl

