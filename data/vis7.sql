SELECT * FROM Sales.SalesTerritory 
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.Customer
SELECT * FROM Sales.Store

SELECT
    st.Name AS Region,
    CASE
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END AS CustomerType,
    SUM(soh.TotalDue) / COUNT(soh.SalesOrderID) AS AverageOrderValue
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
LEFT JOIN Sales.Store s ON c.StoreID = s.BusinessEntityID
GROUP BY st.Name,
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store'
        ELSE 'Individual'
    END
