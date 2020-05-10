
--DDL operation
--CREATE, ALTER, DROP, RENAME (table, function, index, stored procedure)

CREATE TRIGGER trOnDb
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
 PRINT 'A table has just created, nodified or deleted'
END

CREATE TABLE tblTestForTrigger (Id INT)

ALTER TRIGGER trForRollBack
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
	ROLLBACK
 PRINT 'Table can not be deleted. Rollback from trigger'
END

DISABLE TRIGGER trOnDb ON DATABASE

DROP TABLE tblTestForTrigger

ENABLE TRIGGER trOnDb ON DATABASE
DISABLE TRIGGER trForRollBack ON DATABASE

CREATE TRIGGER trForRename
ON DATABASE
FOR RENAME
AS
BEGIN
 PRINT 'Name updated successfully!'
END

EXEC sp_rename 'tblStudentsAudit', 'tblStudentAudit'
EXEC sp_rename 'tblTestForTrigger.Id', 'ID', 'column'

DROP TRIGGER trForRename ON DATABASE

CREATE TRIGGER trForRenameOnServerObj
ON ALL SERVER
FOR RENAME
AS BEGIN
	PRINT 'Object rename successfully!'
END