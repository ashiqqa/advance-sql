Create Table tblEmployee
(
  EmployeeId int Primary key,
  Name nvarchar(20),
  ManagerId int
)
Insert into tblEmployee values (1, 'Tom', 2)
Insert into tblEmployee values (2, 'Josh', null)
Insert into tblEmployee values (3, 'Mike', 2)
Insert into tblEmployee values (4, 'John', 3)
Insert into tblEmployee values (5, 'Pam', 1)
Insert into tblEmployee values (6, 'Mary', 3)
Insert into tblEmployee values (7, 'James', 1)
Insert into tblEmployee values (8, 'Sam', 5)
Insert into tblEmployee values (9, 'Simon', 1)

SELECT * FROM tblEmployee

WITH EmployeesCTE (EmployeeId, Name, ManagerId, [Level])
AS (
SELECT EmployeeId, Name, ManagerId, 1
FROM tblEmployee WHERE ManagerId IS NULL
UNION ALL
SELECT e.EmployeeId, e.Name, e.ManagerId, cte.[Level]+1
FROM tblEmployee e
JOIN EmployeesCTE cte ON cte.EmployeeId=e.ManagerId
)
SELECT empCTE.Name as Employee, ISNULL(mgrCTE.Name, 'Super Boss') as Manager, empCTE.[Level]
FROM EmployeesCTE empCTE
LEFT JOIN EmployeesCTE mgrCTE 
ON mgrCTE.EmployeeId = empCTE.ManagerId

