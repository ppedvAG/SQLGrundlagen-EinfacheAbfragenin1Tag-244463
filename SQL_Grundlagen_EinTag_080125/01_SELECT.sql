-- USE Datenbanknamen wechselt angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Men� die richtige DB ausw�hlen
USE Northwind

-- einzeiliger Kommentar

/*
	Hallo, das
	ist ein
	Mehrzeiliger
	Text!
*/


/*
	SELECT: w�hlt Spalten aus, die im
	Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten in der angesprochene Tabelle

-- "Custom" - Werte und mathematische Operationen m�glich

SELECT 100

SELECT 'Hallo'

SELECT 'Hallo', 100

SELECT 100 + 5, 7 * 8
-- Nur einzelne "Anweisungen" ausf�hren: Zeile(n) markieren, ausf�hren

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

-- Die 20 gr��ten Frachtkosten von der Tabelle "Orders"
-- Spalte: Freight, FROM Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Die 20 kleinsten Frachtkosten von der Tabelle "Orders"
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- Duplikate "filtern" mit DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind
SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

-- UNION f�hrt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Datentypen m�ssen kompatibel sein, Spaltenanzahl gleich sein

SELECT * FROM Customers -- (91 Zeilen)
UNION
SELECT * FROM Customers -- (91 Zeilen)

-- mit UNION ALL wird KEIN DISTINCT ausgef�hrt

SELECT * FROM Customers -- (91 Zeilen)
UNION all
SELECT * FROM Customers -- (91 Zeilen)


-- Geht nicht
SELECT 100, 'Hallo'
UNION
SELECT 'Tsch�ss', 5

-- Geht wiederrum schon
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Tsch�ss'

-- Spalten "umbennen" �ber Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo' as Begr��ung

SELECT City as Stadt FROM Customers

-- Aliase k�nnen auch f�r Tabellennamen vergeben werden
SELECT * FROM Customers as cus