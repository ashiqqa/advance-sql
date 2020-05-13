

SELECT CHOOSE (2,'A','B','C')

SELECT Name, DateOfBirth,
CHOOSE(DATEPART(MM,DateOfBirth), 'Jan', 'Feb', 'Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec') MonthName,
IIF(GenderId=1, 'Male','Female')
FROM tblStudents

SELECT CAST('2020-05-01' AS DATE)
SELECT PARSE('2020-05-01' AS DATE)
SELECT TRY_PARSE('2020-05-01' AS DATE)

SELECT CONVERT(XML, '<parent>child</parent>')
SELECT IIF(TRY_CONVERT(XML, '<parent>child</parent>') IS NULL, 'Faied to convert','Converted')

--Last date of month
SELECT EOMONTH(GETDATE(),-15)
SELECT EOMONTH(GETDATE(),-3)

SELECT DATEFROMPARTS(1999,06,01)
SELECT DATETIMEFROMPARTS(1999,06,01,12,15,30,576)


