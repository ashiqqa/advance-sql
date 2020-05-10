
CREATE TYPE EmpModel AS TABLE
(
	Id INT PRIMARY KEY,
	Name VARCHAR(50),
	ManagerId INT,
	Salary INT
   )

DECLARE @TblEmp EmpModel
SELECT * FROM @TblEmp

CREATE PROC spTableTypeParam
@TableData EmpModel READONLY,
@Id INT
AS BEGIN 
	SELECT * FROM @TableData WHERE  Id=@Id
END


DECLARE @tblEmp EmpModel
INSERT INTO @tblEmp SELECT * FROM tblEmployee
EXEC spTableTypeParam @tblEmp , 5