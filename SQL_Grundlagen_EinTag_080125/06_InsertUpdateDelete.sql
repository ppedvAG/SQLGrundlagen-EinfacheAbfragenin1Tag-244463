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

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zu bestehender Tabelle
ALTER TABLE PurchasingOrders
ADD NeueSpalte INT

SELECT * FROM PurchasingOrders

-- Spalte aus bestehender Tabelle l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte nach Datentyp �ndern:
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

-- INSERT - Hinzuf�gen von Datens�tze in die Tabelle

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

-- DELETE -- L�schen von Datens�tze in einer Tabelle zu erm�glichen

SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne WHERE Filter werden ALLE Datens�tze gel�scht!
DELETE FROM PurchasingOrders
WHERE ID = 2

-- Prim�r-/Fremdschl�sselbeziehungen verhindern das L�schen von Datens�tzen, wenn andere Datens�tze
-- sonst "ins Leere laufen w�rden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE- �ndern von Werten in einem vorhanden Datensatz

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 50
WHERE ID = 4

-- "L�schen" von Werten: SET = NULL
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