
SELECT * FROM sys.dm_sql_referencing_entities('dbo.tblStudents','Object')

SELECT * FROM sys.dm_sql_referenced_entities('dbo.fnGetStudent','Object')

EXEC sp_depends 'tblStudents'
EXEC sp_depends 'tr_vwStudents_InsteadOfDelete'

--Sequence
CREATE SEQUENCE SequenceObj
AS INT
START WITH 1
INCREMENT BY 2
MAXVALUE 20

ALTER SEQUENCE [dbo].[SequenceObj]
INCREMENT BY -3
MINVALUE 1
MAXVALUE 30
CYCLE

SELECT NEXT VALUE FOR SequenceObj

ALTER SEQUENCE SequenceObj RESTART WITH 1

--GUID Global-Unique_Identifier
DECLARE @ID UNIQUEIDENTIFIER
SELECT ID = NEWID()

SELECT (CAST(0x0 as UNIQUEIDENTIFIER))

--Dynamic Sql
DECLARE @Sql NVARCHAR(500) = 'SELECT * FROM tblStudents WHERE GenderId = @GenderId'
DECLARE @params NVARCHAR(100) = '@GenderId INT'
EXEC sp_executeSql @Sql, @params, @GenderId=1


