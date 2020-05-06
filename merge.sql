CREATE TABLE [dbo].[tblTargetStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[GenderId] [int] NULL,
	[DepartmentId] [int] NULL,
	[DateOfBirth] [date] NULL,
	[EnrollDate] [datetime] NULL DEFAULT (getdate()),
	[Email] [varchar](100) NULL)

SELECT * FROM tblStudents
SELECT * FROM tblTargetStudents

MERGE tblTargetStudents AS T
USING tblStudents AS S
ON T.Id = S.Id

WHEN MATCHED THEN
UPDATE SET T.Email = SUBSTRING(S.Email, 0, 5)+'@gmail.com'

WHEN NOT MATCHED BY TARGET THEN
INSERT (Name, GenderId,DepartmentId, DateOfBirth,Email) 
VALUES(S.Name, S.GenderId, S.DepartmentId,S.DateOfBirth,S.Email)
WHEN NOT MATCHED BY SOURCE THEN
DELETE;