USE Northwind

/*
	
	- CREATE / ALTER / DROP - DDL (Data Definition Language)

*/
-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

-- CREATE
CREATE TABLE PurchasingOrders	
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID int NOT NULL
)

-- Beziehung zwischen PurchasingOrders und Products anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufügen zu bestehender Tabelle
ALTER TABLE PurchasingOrders
ADD NeueSpalte INT

SELECT * FROM PurchasingOrders

-- Spalte aus bestehender Tabelle löschen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte nach Datentyp ändern:
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

-- INSERT - Hinzufügen von Datensätze in die Tabelle

-- Alle Spalten befuellen:
INSERT INTO PurchasingOrders
VALUES('08.01.2025', 5, 20.23)

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders
(OrderDate, TestDaten, ProductID) VALUES ('08.01.2025', 10, 30)

SELECT * FROM PurchasingOrders

-- Ergebnis einer SELECT-Abfrage direkt insertend (Wenn Spaltenanzahl passt & Datentypen Kompatibel sind)
INSERT INTO PurchasingOrders
SELECT '08.01.2025', 10, NULL

-- DELETE -- Löschen von Datensätze in einer Tabelle zu ermöglichen

SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne WHERE Filter werden ALLE Datensätze gelöscht!
DELETE FROM PurchasingOrders
WHERE ID = 2

-- Primär-/Fremdschlüsselbeziehungen verhindern das Löschen von Datensätzen, wenn andere Datensätze
-- sonst "ins Leere laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE- Ändern von Werten in einem vorhanden Datensatz

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 50
WHERE ID = 4

-- "Löschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 4

--1. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Explizit einzelne Spalten befuellen:
INSERT INTO PurchasingOrders
(OrderDate, TestDaten, ProductID) VALUES ('08.01.2025', 10, 30)

INSERT INTO Employees
(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo)
VALUES ('asdasdas', 'asdasdas', 'dasdsd')

-- Transactions
BEGIN Transaction

UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 4

SELECT * FROM PurchasingOrders

COMMIT 
ROLLBACK