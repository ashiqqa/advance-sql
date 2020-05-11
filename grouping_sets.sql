--Grouping Sets


SELECT Country, Gender, SUM(Salary) TotalSalary
FROM Employees
GROUP BY
	GROUPING SETS (
	(Country, Gender),
	(Country),
	(Gender),
	()
	)
Order By Grouping(Country), Grouping(Gender), Gender

SELECT Country,Gender, Sum(Salary) TotalSalary 
FROM Employees
GROUP BY ROLLUP(Country)


SELECT Country,Gender, Sum(Salary) TotalSalary,
 GROUPING(Country) IsGroupedCountry, GROUPING(Gender) IsGroupedGender,
 GROUPING_ID(Country, Gender)
FROM Employees
GROUP BY CUBE(Country,Gender)
--HAVING (GROUPING_ID(Country,Gender)=2)
HAVING (GROUPING_ID(Country,Gender)=3)
ORDER BY GROUPING_ID(Country,Gender)