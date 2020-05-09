

SELECT * FROM SYSOBJECTS
SELECT DISTINCT xtype FROM SYSOBJECTS

SELECT * FROM SYSOBJECTS WHERE xtype='U' --user table
SELECT * FROM SYSOBJECTS WHERE xtype='V' --select view
SELECT * FROM SYSOBJECTS WHERE xtype='P' --select stored procedure
SELECT * FROM SYSOBJECTS WHERE xtype='PK' --select primary key constraints
SELECT * FROM SYSOBJECTS WHERE xtype='IT' --select internal table
SELECT * FROM SYSOBJECTS WHERE xtype='S' --select system table
SELECT * FROM SYSOBJECTS WHERE xtype='SQ' --select service queue
SELECT * FROM SYSOBJECTS WHERE xtype='TF' --select table function
SELECT * FROM SYSOBJECTS WHERE xtype='TR' --select trigger
--For more http://msdn.microsoft.com/en-us/library/ms177596.aspx

SELECT * FROM SYS.tables

 SELECT * FROM INFORMATION_SCHEMA.TABLES
 SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 SELECT * FROM INFORMATION_SCHEMA.VIEWS

  SELECT col_length('tblStudents','Email')