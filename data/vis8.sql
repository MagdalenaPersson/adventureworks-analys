SELECT * FROM Sales.SalesOrderHeader 
SELECT * FROM Sales.SalesOrderDetail 
SELECT * FROM Production.Product  
SELECT * FROM Production.ProductSubcategory  
SELECT * FROM Production.ProductCategory  
SELECT * FROM Sales.SalesTerritory 

SELECT
    st.Name AS Region,
    pc.Name AS Category,
    SUM(sod.LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail sod
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY st.Name, pc.Name;