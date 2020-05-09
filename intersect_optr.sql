
--INTERSECT | Select commonn rows from both left and right query
SELECT * FROM tblEmployee WHERE Salary>=9000
INTERSECT
SELECT * FROM tblEmployee WHERE ManagerId=3

--Another way to Select commonn rows from both left and right query
--INNER JOIN can't filter duplicate rows
SELECT * FROM
(SELECT * FROM tblEmployee WHERE Salary>=9000) tbl1
INNER JOIN
(SELECT * FROM tblEmployee WHERE ManagerId=3) tbl2
ON tbl2.EmployeeId=tbl1.EmployeeId