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
SELECT CONCAT(ROUND(COUNT(*) * 100/SUM(COUNT(*)) OVER ()), "%") AS "Procent"
FROM Products
GROUP BY UnitsOnOrder, UnitsInStock, ReorderLevel
ORDER BY UnitsOnOrder, UnitsInStock, ReorderLevel
LIMIT 1;

-- rozwiązanie nie jest dobre, gdy nie ma żadnych produktów poza sprzedaża --

-- zadanie 4 --
SELECT COUNT(ContactName) * COUNT(*) * 100/SUM(COUNT(*)) OVER(PARTITION BY)
FROM Customers
WHERE ContactName LIKE "%a %"
GROUP BY Country;

