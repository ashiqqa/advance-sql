

SELECT Name, Salary, Gender, 
COUNT(Gender) OVER (PARTITION BY Gender) TotalGender,
Avg(Salary) OVER (PARTITION BY Gender) AvgSal,
MIN(Salary) OVER (PARTITION BY Gender) MinSal,
MAX(Salary) OVER (PARTITION BY Gender) MaxSal
FROM Employees

--Ranking Function
SELECT *, 
ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Country) RowNum
FROM Employees

SELECT *, 
RANK() OVER(ORDER BY SALARY DESC) [Rank],
DENSE_RANK() OVER(ORDER BY SALARY DESC) [DensRank]
FROM Employees

SELECT *, 
RANK() OVER(PARTITION BY Gender ORDER BY SALARY DESC) [Rank],
DENSE_RANK() OVER(PARTITION BY Gender ORDER BY SALARY DESC) [DensRank]
FROM Employees

WITH EmpCte AS (
SELECT *, 
RANK() OVER(ORDER BY SALARY DESC) SalaryRank
FROM Employees
)
SELECT * FROM EmpCte WHERE SalaryRank=4

WITH EmpCte AS (
SELECT *, 
DENSE_RANK() OVER(ORDER BY SALARY DESC) SalaryRank
FROM Employees
)
SELECT * FROM EmpCte WHERE SalaryRank=4

--Analytical Function
SELECT *,
 SUM(Salary) OVER(Partition by Gender ORDER BY Salary) RunningTotal,
 NTILE(2) OVER (Partition by Gender ORDER BY Salary) [NTILE],
 LEAD(Salary, 2, -1) OVER (ORDER BY Salary) Lead_by_2,
 LAG(Salary, 1, -1) OVER (ORDER BY Salary) Lag_by_1,
 FIRST_VALUE(Salary) OVER (PARTITION BY Gender ORDER BY Gender) FirstValue,
 LAST_VALUE(Salary) OVER (PARTITION BY Gender ORDER BY Gender) LastValue
 FROM Employees


 SELECT *,
 AVG(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AvgSal,
 SUM(Salary) OVER (ORDER BY Salary) RunningTotal,
 SUM(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) RunningTotalByRows,
 SUM(Salary) OVER (ORDER BY Salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) RunningTotalRange
 FROM Employees