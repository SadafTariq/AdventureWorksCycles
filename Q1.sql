--CREATE VIEW BestPerformingCountry1 AS
SELECT Country, Sum(TotalSales) AS CountryTotalSales
FROM CountrySales
Group BY Country

--CREATE VIEW CountrySales AS
SELECT TerritoryID, T.CountryRegionCode,C.Name AS Country, T.Name AS Region,
CAST(SalesYTD AS INT) AS SalesYTD, CAST(SalesLastYear AS INT) AS SalesLastYear,
CAST((SalesYTD + SalesLastYear) AS INT) AS TotalSales
FROM Sales.SalesTerritory AS T
INNER JOIN Person.CountryRegion AS C
ON T.CountryRegionCode=C.CountryRegionCode

--CREATE VIEW Sales_Category AS
WITH product AS(
SELECT ProductID,PS.ProductSubcategoryID,PS.ProductCategoryID,PC.Name AS Category
FROM Production.Product AS P 
INNER JOIN Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID=PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID=PC.ProductCategoryID
WHERE PS.ProductSubcategoryID IS NOT NULL),

territory AS(SELECT ProductID, SOH.SalesOrderID,T.TerritoryID,T.Name AS Region
FROM Sales.SalesOrderHeader	AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID=SOD.SalesOrderDetailID
INNER JOIN Sales.SalesTerritory AS T
ON SOH.TerritoryID=T.TerritoryID
WHERE T.TerritoryID IN (1,2,3,4,5))

SELECT Region,Category,COUNT(*) AS TotalSales FROM product AS p
INNER JOIN territory AS t
ON p.ProductID=t.ProductID
GROUP BY Region,Category

--CREATE VIEW Comparison AS
SELECT TS.TerritoryID,T.Name,TotalStores,TotalOrders
FROM TotalStores AS TS
INNER JOIN TotalOrders AS T
ON TS.TerritoryID=T.TerritoryID


--CREATE VIEW TotalStores AS
SELECT  COUNT(C.StoreID) AS TotalStores, C.TerritoryID, ST.Name
FROM Sales.Store AS S	
INNER JOIN Sales.Customer AS C
ON S.BusinessEntityID=C.StoreID
INNER JOIN Sales.SalesTerritory AS ST
ON C.TerritoryID=ST.TerritoryID
WHERE C.TerritoryID IN (1,2,3,4,5)
GROUP BY C.TerritoryID,ST.Name
ORDER BY TerritoryID

--CREATE VIEW TotalOrders AS
SELECT SOD.TerritoryID, COUNT(*) AS TotalOrders, ST.Name 
FROM Sales.SalesOrderHeader AS SOD
INNER JOIN Sales.SalesTerritory AS ST
ON SOD.TerritoryID=ST.TerritoryID
WHERE SOD.TerritoryID IN (1,2,3,4,5)
GROUP BY SOD.TerritoryID,ST.Name
ORDER BY TerritoryID



