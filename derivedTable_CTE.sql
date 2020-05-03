
--Temporary Table
Select tblDepartment.Name as Department, COUNT(*) as TotalStudents
into #TempStudentCount
from tblStudents
join tblDepartment
on tblDepartment.Id = tblStudents.DepartmentId
group by tblDepartment.Name

Select Department, TotalStudents
From #TempStudentCount
where TotalStudents >= 2

Drop Table #TempStudentCount

--Table variable
Declare @tblStudentCount table
(DeptName nvarchar(50),DepartmentId int, TotalStudent int)

Insert @tblStudentCount
Select d.Name DeptName, s.DepartmentId, COUNT(*) as TotalStudent
from tblStudents s
join tblDepartment d
on d.Id = s.DepartmentId
group by d.Name, DepartmentId

Select DeptName, TotalStudent
From @tblStudentCount
where  TotalStudent >= 2

--Derived Table
Select DepartmentName, TotalStudents
from 
 (
  Select d.Name DepartmentName, s.DepartmentId, COUNT(*) as TotalStudents
  from tblStudents s
  join tblDepartment d
  on d.Id = s.DepartmentId
  group by d.Name, s.DepartmentId
 ) 
as EmployeeCount
where TotalStudents >= 2

--CTE (Common Table Expression)
With StudentCountByDept(DepartmentName, DepartmentId, TotalStudents)
as
(
 Select d.Name DepartmentName, s.DepartmentId, COUNT(*) as TotalStudents
 from tblStudents s
 join tblDepartment d
 on d.Id = s.DepartmentId
 group by d.Name, s.DepartmentId
),

WITH StudentCountByGender(GenderId, TotalStudents)
AS (
SELECT s.GenderId, COUNT(*) TotalStudents
FROM tblStudents  s
GROUP BY s.GenderId
)

Select GenderId, g.Name Gender, TotalStudents
from StudentCountByGender s
JOIN tblGender g ON g.Id=s.GenderId