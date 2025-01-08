USE Northwind

/*
	Inner JOIN:
	=> Wenn du nur übereinstimmende Daten aus beiden Tabelle brauchst

	Left Join:
	=> Wenn du alle Daten aus der Linken Tabelle brauchst (inkl. nicht übereinstimmende).

	Right Join:
	=> Wenn du alle Daten aus der Rechten Tabelle brauchst (inkl. nicht übereinstimmende).

	Full Join:
	=> Wenn du alle Daten aus beiden Tabellen brauchst, egal ob sie übereinstimmen
*/

-- Die Customers und Orders Tabelle in ein Ergebnisfenster ausgeben
SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax:

	SELECT * FROM [Tabelle A]
	JOIN [Tabelle B] ON [Tabelle A].KeySpalte = [Tabelle B].KeySpalte
*/
SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Mehrdeutige Spaltennamen
SELECT CompanyName, Customers.CustomerID FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Alle Spalten nur aus einer Tabelle:
SELECT CompanyName, Orders.* FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Freight > 500
ORDER BY Freight

-- Mit Aliasen
SELECT * FROM Orders as Ord
JOIN Customers as cus ON Cus.CustomerID = Ord.CustomerID

-- Joinen: Customers - Orders - Order Details
SELECT * FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID


-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
SELECT DISTINCT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Employees.LastName = 'Leverling'

/*
	JOIN Syntax:

	SELECT * FROM [Tabelle A]
	JOIN [Tabelle B] ON [Tabelle A].KeySpalte = [Tabelle B].KeySpalte
*/


-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Tabellen: Customers - Orders
SELECT OrderID FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Products - Categories Tables
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 5. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
--> Orders - Order Details - Products
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details]. OrderID
WHERE Discontinued = 1

-- OUTER Joins: LEFT/RIGHT und FULL OUTER

-- Left: 
-- Alle Datensätze aus der Linken Tabelle, auch wenn es keine passende Verknüpfung gibt
-- Bestellungen von keinem Kunden (gibts keine)
SELECT * FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID


-- Right: Z. 189 & Z. 502
-- Alle Datensätze aus der Rechten Tabelle, auc hwenn es keine Passende Verknüpfung dazu gibt
-- Kunden ohne Bestellungen
SELECT * FROM Orders 
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Full Outer:
-- Kunden ohne Bestellungen und Bestellungen ohne Kunden werden angezeigt, mit NULL Werten
-- für fehlende Daten
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (A x B) 91 x 830
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo