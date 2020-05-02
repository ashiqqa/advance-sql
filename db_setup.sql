CREATE DATABASE SqlBasicToAdvance

CREATE TABLE tblStudents (
Id INT PRIMARY KEY IDENTITY(1,1), Name VARCHAR(50), GenderId INT, DepartmentId INT,
 DateOfBirth Date, EnrollDate DATETIME DEFAULT GETDATE()
 )

 ALTER TABLE tblStudents
 ALTER COLUMN Name VARCHAR(50) NOT NULL
 
 EXEC sp_help tblStudents

INSERT INTO tblStudents (Name,GenderId,DepartmentId,DateOfBirth) VALUES('Mr Alex', 1,1,'1969-10-01')
INSERT INTO tblStudents (Name,GenderId,DepartmentId,DateOfBirth) VALUES('Sadia', 2,3,'1997-12-01')
INSERT INTO tblStudents (Name,GenderId,DepartmentId,DateOfBirth) VALUES('Kamal', 1,2,'1992-3-15')
INSERT INTO tblStudents (Name,GenderId,DepartmentId,DateOfBirth) VALUES('Jamal Ahmed', 1,3,'1985-5-25')

SELECt * FROM tblStudents

CREATE TABLE tblGender (Id INT PRIMARY KEY IDENTITY(1,1), Name VARCHAR(15))
INSERT INTO tblGender VALUES('Male')
INSERT INTO tblGender VALUES('Female')
INSERT INTO tblGender VALUES('Unknown')

ALTER TABLE tblGender
ADD CONSTRAINT AK_tblGender_Name UNIQUE (Name)

SELECT * FROM tblGender

CREATE TABLE tblDepartment (Id INT PRIMARY KEY IDENTITY(1,1), Name VARCHAR(15))

ALTER TABLE tblDepartment ALTER COLUMN Name VARCHAR(50) NOT NULL

ALTER TABLE tblStudents
ADD CONSTRAINT CK_tblStudents_Gender CHECK (GenderId>0 AND GenderId<4)

INSERT INTO tblDepartment VALUES('Electrical & Electronics Engineering')
INSERT INTO tblDepartment VALUES('Computer Science & Engineering')
INSERT INTO tblDepartment VALUES('Telecomunication Engineering')

SELECt * FROM tblDepartment
TRUNCATE TABLE tblDepartment

CREATE VIEW vwStudents
AS 
SELECT s.Id, s.Name, g.Name Gender, d.Name Department, s.DateOfBirth
FROM tblStudents s
LEFT JOIN tblGender g ON g.Id = s.GenderId
LEFT JOIN tblDepartment d ON d.Id = s.DepartmentId

SELECT * FROM vwStudents