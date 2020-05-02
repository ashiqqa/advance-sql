
CREATE UNIQUE CLUSTERED INDEX PK_tblStudents_ID
ON tblStudents(Id ASC)
WITH IGNORE_DUP_KEY

DROP INDEX tblStudents.PK_tblStudents_ID 

CREATE NONCLUSTERED INDEX IX_tblStudents_GenderId_DeptId
ON tblStudents(GenderId ASC, DepartmentId ASC)

sp_helpindex tblStudents

SELECT * FROM tblStudents