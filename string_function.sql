

SELECt Id, Name, 
SUBSTRING(CONVERT(VARCHAR,DateOfBirth,112),0,5)+REPLICATE('*',2)+RIGHT(CONVERT(VARCHAR,DateOfBirth,112),2) DateOfBirth
FROM tblStudents

SELECT PATINDEX('%@%',Email) Email FROM tblStudents

SELECT STUFF(Email, 4,5,'*****') FROM tblStudents




