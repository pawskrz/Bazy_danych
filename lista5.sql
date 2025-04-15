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
SELECT COUNT(ContactName), Country, COUNT(ContactName) * 100/SUM(COUNT(ContactName)) OVER (PARTITION BY ContactName LIKE "%a %" ORDER BY ContactName CURRENT ROW)
FROM Customers
GROUP BY Country;


SELECT COUNT(ContactName), Country
FROM Customers
WHERE ContactName LIKE"%a %"
GROUP BY Country;
