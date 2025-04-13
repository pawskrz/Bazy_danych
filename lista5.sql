-- zadanie 1 --
SELECT OrderID, UnitPrice*Quantity AS "Kwota", Quantity AS "Ilość"
FROM `Order Details`
ORDER BY UnitPrice*Quantity DESC
LIMIT 2;

-- zadanie 2 --
SELECT CustomerID
FROM Orders
GROUP BY CustomerID HAVING COUNT(OrderID) > 20;

-- zadanie 3 --
SELECT COUNT(ProductID)
FROM Products
WHERE UnitsOnOrder=0 AND UnitsInStock=0 AND ReorderLevel=0