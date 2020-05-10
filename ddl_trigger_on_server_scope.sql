--Store SERVER audit data using DDL Trigger

CREATE TABLE tblDdlOperation
(Id INT PRIMARY KEY IDENTITY(1,1),
DatabaseName NVARCHAR(250),
ObjectName NVARCHAR(250),
ObjectType NVARCHAR(250),
EventType NVARCHAR(250),
LoginName NVARCHAR(250),
SqlCommand NVARCHAR(2500),
AuditDateTime datetime
)

ALTER TABLE tblDdlOperation
ADD UserName NVARCHAR(250)

ALTER TRIGGER trOnServer
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE, RENAME
AS BEGIN
DECLARE @EventData XML
SELECT @EventData = EVENTDATA()
	INSERT INTO SqlBasicToAdvance.dbo.tblDdlOperation (DatabaseName,ObjectName,ObjectType,EventType,LoginName,UserName,SqlCommand,AuditDateTime)
	VALUES (
	@EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/ObjectType)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/EventType)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/LoginName)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/UserName)[1]','nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]','nvarchar(250)'),
	GETDATE()
	)
END

SELECT * FROM tblDdlOperation
CREATE TABLE tblTestForTrigger (Id INT)
EXEC sp_rename 'tblTestForTrigger.Id', 'ID', 'column'
