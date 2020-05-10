
SELECT * FROM sys.dm_exec_sessions WHERE is_user_process=1

CREATE TRIGGER trOnLogon
ON ALL SERVER
FOR LOGON
As BEGIN
 DECLARE @LoginName NVARCHAR(50)
 SET @LoginName = ORIGINAL_LOGIN()
 IF((SELECT COUNT(*) FROM sys.dm_exec_sessions WHERE is_user_process=1 AND original_login_name=@LoginName)>3)
 BEGIN
 PRINT 'Fourth connection of '+@LoginName+' blocked'
 ROLLBACK
 END
END

sp_readerrorlog

DISABLE TRIGGER trOnLogon ON ALL SERVER
ENABLE TRIGGER trOnLogon ON ALL SERVER