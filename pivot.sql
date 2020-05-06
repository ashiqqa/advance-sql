Create Table tblProductSales 
( SalesAgent nvarchar(50), SalesCountry nvarchar(50), SalesAmount int )

Insert into tblProductSales values('Tom', 'UK', 200) 
Insert into tblProductSales values('John', 'US', 180) 
Insert into tblProductSales values('John', 'UK', 260) 
Insert into tblProductSales values('David', 'India', 450) 
Insert into tblProductSales values('Tom', 'India', 350) 
Insert into tblProductSales values('David', 'US', 200) 
Insert into tblProductSales values('Tom', 'US', 130) 
Insert into tblProductSales values('John', 'India', 540) 
Insert into tblProductSales values('John', 'UK', 120) 
Insert into tblProductSales values('David', 'UK', 220)
Insert into tblProductSales values('John', 'UK', 420) 
Insert into tblProductSales values('David', 'US', 320)
Insert into tblProductSales values('Tom', 'US', 340) 
Insert into tblProductSales values('Tom', 'UK', 660) 
Insert into tblProductSales values('John', 'India', 430) 
Insert into tblProductSales values('David', 'India', 230) 
Insert into tblProductSales values('David', 'India', 280)
Insert into tblProductSales values('Tom', 'UK', 480) 
Insert into tblProductSales values('John', 'US', 360) 
Insert into tblProductSales values('David', 'UK', 140)

SELECT * FROM tblProductSales

SELECT SalesCountry, SalesAgent, SUM(SalesAmount) SalesAmount FROM tblProductSales
GROUP BY SalesCountry, SalesAgent
ORDER BY SalesCountry, SalesAgent

SELECT SalesAgent,India, US,UK
FROM tblProductSales
PIVOT ( SUM(SalesAmount) FOR SalesCountry IN ([India], [US],[UK]))
AS PivotTable

Create Table tblProductsSale
 (Id int primary key,   SalesAgent nvarchar(50),   SalesCountry nvarchar(50),   SalesAmount int )

 Insert into tblProductsSale values(1, 'Tom', 'UK', 200) 
 Insert into tblProductsSale values(2, 'John', 'US', 180) 
 Insert into tblProductsSale values(3, 'John', 'UK', 260) 
 Insert into tblProductsSale values(4, 'David', 'India', 450) 
 Insert into tblProductsSale values(5, 'Tom', 'India', 350) 
 Insert into tblProductsSale values(6, 'David', 'US', 200) 
 Insert into tblProductsSale values(7, 'Tom', 'US', 130) 
 Insert into tblProductsSale values(8, 'John', 'India', 540) 
 Insert into tblProductsSale values(9, 'John', 'UK', 120) 
 Insert into tblProductsSale values(10, 'David', 'UK', 220) 
 Insert into tblProductsSale values(11, 'John', 'UK', 420) 
 Insert into tblProductsSale values(12, 'David', 'US', 320) 
 Insert into tblProductsSale values(13, 'Tom', 'US', 340) 
 Insert into tblProductsSale values(14, 'Tom', 'UK', 660) 
 Insert into tblProductsSale values(15, 'John', 'India', 430) 
 Insert into tblProductsSale values(16, 'David', 'India', 230) 
 Insert into tblProductsSale values(17, 'David', 'India', 280) 
 Insert into tblProductsSale values(18, 'Tom', 'UK', 480) 
 Insert into tblProductsSale values(19, 'John', 'US', 360) 
 Insert into tblProductsSale values(20, 'David', 'UK', 140)

 SELECT SalesAgent,India, US,UK
FROM (SELECT SalesAgent, SalesCountry,SalesAmount FROM tblProductsSale) AS SrcTable
PIVOT ( SUM(SalesAmount) FOR SalesCountry IN ([India], [US],[UK]))
AS PivotTable
