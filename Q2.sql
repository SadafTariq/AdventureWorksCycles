
--CREATE VIEW AnnualLeave AS
SELECT E.BusinessEntityID,(VacationHours/24) AS RVacationDays,Bonus
FROM HumanResources.Employee AS E LEFT JOIN 
Sales.SalesPerson AS P ON E.BusinessEntityID=P.BusinessEntityID


--CREATE VIEW HourlyRate1 AS
SELECT E.BusinessEntityID,(VacationHours/24) AS RVacationDays,Bonus,Rate
FROM HumanResources.Employee AS E
LEFT JOIN Sales.SalesPerson AS P
ON E.BusinessEntityID=P.BusinessEntityID
LEFT JOIN HumanResources.EmployeePayHistory AS EPH
ON E.BusinessEntityID = EPH.BusinessEntityID
ORDER BY RATE DESC

--CREATE VIEW Scatter AS
SELECT E.BusinessEntityID,(VacationHours/24) 
AS RVacationDays,Bonus 
FROM HumanResources.Employee 
AS E INNER JOIN Sales.SalesPerson AS B 
ON E.BusinessEntityID=B.BusinessEntityID