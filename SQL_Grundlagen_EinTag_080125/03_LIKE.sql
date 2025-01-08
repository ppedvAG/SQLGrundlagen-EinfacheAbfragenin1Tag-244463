USE Northwind

-- LIKE: Für ungenauen Filterung/Suche 
-- (statt Vergleichsoperatoren)

SELECT ContactName FROm Customers 
WHERE ContactTitle LIKE 'Manager'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbol, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "_"-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles in den Klammern ist gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

-- "[a-z]" oder Gegenteil mit ^ [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^123]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderfällen: % '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- 1. Alle ContactNames die als Title "Owner" beeinhalten (Tabelle Customers)
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

-- 2. Alle ShipPostalCodes anzeigen lassen, die mit 0, 2 oder 4 beginnen (Tabelle Orders)
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'