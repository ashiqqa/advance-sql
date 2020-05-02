
ALTER FUNCTION fnAge(@Date DATE)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @Years INT,@Month INT, @Days INT, @tempDate DATE
SELECT @tempDate = @Date
SELECT @Years = DATEDIFF(YEAR,@tempDate,GETDATE()) - CASE WHEN			
 MONTH(@Date)>MONTH(GETDATE()) OR 
 ((MONTH(@Date)=MONTH(GETDATE())) AND (DAY(@Date)>DAY(GETDATE()))) THEN 1 ELSE 0 END
 
 SELECT @tempDate = DATEADD(YEAR,@Years,@tempDate)

 SELECT @Month = DATEDIFF(MONTH,@tempDate, GETDATE()) - CASE WHEN
 DAY(@Date)>Day(GETDATE()) THEN 1 ELSE 0 END

 SELECT @tempDate = DATEADD(MONTH,@Month,@tempDate)

 SET @Days = DATEDIFF(DAY,@tempDate, GETDATE())
 RETURN CAST(@Years AS varchar) +' years ' +CAST(@Month as varchar) +' month '+CAST(@Days as varchar)+' days'
 END

 SELECT Name,DateOfBirth, dbo.fnAge(DateOfBirth) AS Age FROM tblStudents


CREATE FUNCTION fnGetStudent (@ID INT)
RETURNS TABLE
RETURN (SELECT * FROM tblStudents WHERE Id=@Id)

ALTER FUNCTION fnGetStudent (@Id INT=0)
RETURNS TABLE
AS
RETURN (SELECT * FROM tblStudents WHERE Id=CASE WHEN @Id=0 THEN Id ELSE @Id END)

SELECT * FROM dbo.fnGetStudent(DEFAULT)
SELECT * FROM dbo.fnGetStudent(1)

sp_helptext fnAge
sp_helptext fnGetStudent

