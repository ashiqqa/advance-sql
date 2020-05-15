

SELECT cp.usecounts, cp.cacheobjtype, cp.objtype, st.text, qp.query_plan
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS qp
ORDER BY cp.usecounts DESC

DBCC FREEPROCCACHE

declare	@name nvarchar(100)
set @name = 'sadia'+' SELECT * FROM tblStudents'
DECLARE @sql nvarchar(100) = N'SELECT * FROM tblStudents WHERE Name=@name'
EXEC sp_executesql @sql, N'@name nvarchar(100)',@name=@name


Declare @FN nvarchar(50)
Set @FN = ''' SELECT * FROM tblStudents --'''
Declare @sql nvarchar(max)
Set @sql = 'Select * from Employees where Name = ''' + @FN + ''''
Exec(@sql)

Declare @FN nvarchar(50)
--Set @FN = ''' SELECT * FROM tblStudents --'''
Set @FN = 'Mark'
Declare @sql nvarchar(max)
Set @sql = 'Select * from Employees where Name = '+QUOTENAME(@FN,'''')
Exec(@sql)

SELECT QUOTENAME('Ashiq','()')