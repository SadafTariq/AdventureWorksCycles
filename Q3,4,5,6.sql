--Q3
SELECT cr.Name,sum(SalesLastYear) AS Totalsaleslastyear ,sum(SalesYTD) AS totalsalesYTD 
FROM sales.SalesTerritory 
INNER JOIN person.CountryRegion AS cr 
ON cr.CountryRegionCode  = sales.SalesTerritory.CountryRegionCode 
GROUP BY cr.Name

--Q4
--Jobtitle vs Sickleave
select JobTitle,OrganizationLevel,avg(SickLeaveHours) as SickLeaveHours 
from HumanResources.Employee 
group by JobTitle,OrganizationLevel
order by SickLeaveHours DESC;

--Organisation level vs sickleave
select JobTitle,OrganizationLevel,avg(SickLeaveHours) as SickLeaveHours
from HumanResources.Employee
group by JobTitle,OrganizationLevel;


--Q5
SELECT AnnualRevenue, (2022-YearOpened) AS Duration, AnnualRevenue * (2022-YearOpened) AS TOTALREVENUE FROM [Sales].[vStoreWithDemographics] 
SELECT YearOpened,(2022-YearOpened)AS Duration, AVG(AnnualRevenue*(2022-YearOpened)) AS Revenue 
FROM Sales.vStoreWithDemographics
GROUP BY (YearOpened)

--Q6
SELECT SquareFeet, NumberEmployees,AnnualRevenue FROM Sales.vStoreWithDemographics;
