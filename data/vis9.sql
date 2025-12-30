SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesTerritory

SELECT 
    st.Name AS Region,
    YEAR(OrderDate) AS [Year],
    MONTH(OrderDate) AS [Month],
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
WHERE OrderDate >= '2024-01-01'
AND OrderDate < '2025-01-01'
GROUP BY st.Name, YEAR(OrderDate), MONTH(OrderDate)
ORDER BY [Year], [Month]
