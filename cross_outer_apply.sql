SELECT * FROM fnGetStudentByDeptId(1)


--CROSS Apply
SELECT d.Id DeptId,  d.Name DeptName,s.Id, s.Name FROM tblDepartment d 
CROSS APPLY fnGetStudentByDeptId(d.Id) s

--OUTER Apply
SELECT d.Id DeptId,  d.Name DeptName,s.Id, s.Name FROM tblDepartment d 
OUTER APPLY fnGetStudentByDeptId(d.Id) s


--The APPLY operator introduced in SQL Server 2005, is used to join a table to a table-valued function.
--The Table Valued Function on the right hand side of the APPLY operator gets called for each row from the left (also called outer table) table.
--Cross Apply returns only matching rows (semantically equivalent to Inner Join)
--Outer Apply returns matching + non-matching rows (semantically equivalent to Left Outer Join). The unmatched columns of the table valued function will be set to NULL.
