SELECT 
    st.Name AS Region,
    YEAR(OrderDate) AS [Year],
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name, YEAR(OrderDate)
ORDER BY [Year]