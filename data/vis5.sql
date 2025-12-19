SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderDetail


SELECT TOP 10 
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSum
FROM Sales.SalesOrderDetail sod 
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSum DESC

