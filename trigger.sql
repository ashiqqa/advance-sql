
CREATE TABLE tblStudentsAudit
(ID INT  IDENTITY(1,1) PRIMARY KEY,
AuditData VARCHAR(100)
)

--Insert trigger
CREATE TRIGGER tr_tblStudent_ForInsert
ON tblStudents FOR INSERT
AS
BEGIN
DECLARE @Id INT
SELECT @Id = Id FROM inserted
INSERT INTO tblStudentsAudit 
VALUES('A new emoployee  with Id='+CAST(@Id as varchar)+' on '+FORMAT(GETDATE(),'MMM dd, yyyy hh:mm:ss'))
END

--Delete trigger
CREATE TRIGGER tr_tblStudent_ForDelete
ON tblStudents FOR DELETE
AS
BEGIN
DECLARE @Id INT
SELECT @Id = Id FROM deleted
INSERT INTO tblStudentsAudit 
VALUES('An existing emoployee  with Id='+CAST(@Id as varchar)+' is deleted on '+FORMAT(GETDATE(),'MMM dd, yyyy hh:mm:ss'))
END

DELETE tblStudents WHERE Id=7
sp_help tblStudentsAudit 

--Update trigger
ALTER TRIGGER tr_tblStudent_ForUpdate
ON tblStudents FOR UPDATE
AS
BEGIN
DECLARE @Id INT, @NewName VARCHAR(50),@NewEmail VARCHAR(50),
 @OldName VARCHAR(50), @OldEmail VARCHAR(50),
 @AuditStr NVARCHAR(500)

 SELECT * INTO #TempTable FROM inserted
 WHILE(EXISTS(SELECT Id FROM #TempTable))
 BEGIN
	SET @AuditStr=''
	SELECT TOP 1 @Id=Id, @NewName=Name, @NewEmail = Email FROM #TempTable
	SELECT @OldName=Name, @OldEmail = Email FROM deleted WHERE Id=@Id
	SET @AuditStr = 'Student with Id='+CAST(@Id AS VARCHAR)+' changed. '
	IF(@NewName<>@OldName)
		SET @AuditStr += 'Name from '+@OldName+' to '+@NewName
	IF(@NewEmail<>@OldEmail)
		SET @AuditStr += ' Email from '+@OldEmail+' to '+@NewEmail
		INSERT INTO tblStudentsAudit VALUES(@AuditStr)
		DELETE #TempTable WHERE Id=@Id
	END
 END

 UPDATE tblStudents SET Name= 'Md Ashiqur Rahman', Email='ars@gmail.com' WHERE Id=1
 SELECT * FROM tblStudentsAudit
