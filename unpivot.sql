

Create Table tblForUnPivot
(
 SalesAgent nvarchar(50),
 India int,
 US int,
 UK int
)
Go

Insert into tblForUnPivot values ('David', 960, 520, 360)
Insert into tblForUnPivot values ('John', 970, 540, 800)
Go

SELECT * FROM tblForUnPivot

--Unpivot
SELECT SalesAgent, Country, SalesAmount
FROM tblForUnPivot
UNPIVOT (
	SalesAmount FOR Country IN (India, US, UK)
	) tbl


--Pivot
SELECT SalesAgent, India, US, UK
FROM (SELECT SalesAgent, SalesCountry, SalesAmount FROM tblProductsSale) AS src
PIVOT (
SUM(SalesAmount) FOR SalesCountry IN ([India], [US], [UK])
) AS tbl

--Reverse Pivot
SELECT SalesAgent, SalesCountry, SalesAmount
FROM (
	SELECT SalesAgent, India, US, UK
	FROM (SELECT SalesAgent, SalesCountry, SalesAmount FROM tblProductsSale) As src
	PIVOT (
	SUM(SalesAmount) FOR SalesCountry IN (India,US, UK)
	) AS pivot_tbl
 ) as pivot_tbl
 UNPIVOT (
 SalesAmount FOR SalesCountry IN (India, US, UK)
 ) AS unpivot_tbl

 SELECT * FROM tblProductsSale


