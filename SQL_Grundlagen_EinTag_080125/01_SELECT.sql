-- USE Datenbanknamen wechselt angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Menü die richtige DB auswählen
USE Northwind

-- einzeiliger Kommentar

/*
	Hallo, das
	ist ein
	Mehrzeiliger
	Text!
*/


/*
	SELECT: wählt Spalten aus, die im
	Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten in der angesprochene Tabelle

-- "Custom" - Werte und mathematische Operationen möglich

SELECT 100

SELECT 'Hallo'

SELECT 'Hallo', 100

SELECT 100 + 5, 7 * 8
-- Nur einzelne "Anweisungen" ausführen: Zeile(n) markieren, ausführen

-- Spalte CompanyName, Country von Customers ausgeben:
SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons gesetzt werden
sElEcT					cOuNtrY,

		cOmPanYnAmE
FrOm				CusTomErs


-- Sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City ASC


-- Absteigende sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City DESC
-- Order by ist syntaktisch immer am Ende
-- DESC = Descending = absteigend
-- ASC = Ascending = aufsteigend (der Standardwert)

-- Mehrere Spalten gleichzeitig sortiert, DESC bezieht sich immer nur auf eine Spalte
SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName ASC

-- TOP X gibt nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht mit %-Angaben
SELECT TOP 10 PERCENT * FROM Customers

-- 10 untersten Kunden von Customers
SELECT TOP 10 * FROM Customers
ORDER BY CustomerID DESC

-- Die 20 größten Frachtkosten von der Tabelle "Orders"
-- Spalte: Freight, FROM Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Die 20 kleinsten Frachtkosten von der Tabelle "Orders"
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- Duplikate "filtern" mit DISTINCT
-- Filtert alle Ergebnisse/Datensätze deren Werte exakt gleich sind
SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Datentypen müssen kompatibel sein, Spaltenanzahl gleich sein

SELECT * FROM Customers -- (91 Zeilen)
UNION
SELECT * FROM Customers -- (91 Zeilen)

-- mit UNION ALL wird KEIN DISTINCT ausgeführt

SELECT * FROM Customers -- (91 Zeilen)
UNION all
SELECT * FROM Customers -- (91 Zeilen)


-- Geht nicht
SELECT 100, 'Hallo'
UNION
SELECT 'Tschüss', 5

-- Geht wiederrum schon
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Tschüss'

-- Spalten "umbennen" über Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo' as Begrüßung

SELECT City as Stadt FROM Customers

-- Aliase können auch für Tabellennamen vergeben werden
SELECT * FROM Customers as cus