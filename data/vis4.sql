SELECT * FROM Sales.SalesOrderHeader

SELECT
    YEAR(OrderDate) AS Year,
    COUNT(SalesOrderID) AS Orders,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate) 
ORDER BY Year ASC