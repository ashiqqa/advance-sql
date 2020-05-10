
SELECT * INTO tblEmpBackup FROM 
(SELECT s.Id, s.Name, s.Email, d.Id DeptId, d.Name DeptName FROM tblStudents s
JOIN tblDepartment d ON d.Id = s.DepartmentId) tbl

SELECT * FROM tblEmpBackup

INSERT INTO tblEmpBackup (EmployeeId,Name, ManagerId, Salary)
SELECT EmployeeId,Name, ManagerId, Salary FROM tblEmpBackup