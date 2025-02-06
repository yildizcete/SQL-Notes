
		--SELECT KULLANIMI
USE WORKSHEET
GO
CREATE TABLE ornek_table0 (
userid int not null primary key identity(1,1),
name_surname nvarchar(50) not null,
gender nvarchar(1) not null,
city nvarchar(50),
district nvarchar(50))
GO
SELECT * FROM ORNEK_TABLE0


		--INSERT KULLANIMI
INSERT INTO ornek_table0 (name_surname, gender, city, district)
VALUES ('HAZAL KAYA', 'K', 'MALATYA', 'DARENDE')


		--UPTADE KULLANIMI
UPDATE ornek_table0 SET city = 'BOLU', district= 'ABANT' 
WHERE userid=1


		--DELETE KULLANIMI
DELETE FROM ornek_table0 WHERE userid=3
DELETE FROM ornek_table0 WHERE userid>10



USE AdventureWorks2017
		--WHERE KULLANIMI
SELECT * FROM PRODUCTION.PRODUCT
WHERE SafetyStockLevel=1000

SELECT SafetyStockLevel FROM PRODUCTION.PRODUCT
WHERE SafetyStockLevel=1000

SELECT SafetyStockLevel FROM PRODUCTION.PRODUCT
WHERE SafetyStockLevel=1000 AND ProductID<350

SELECT * FROM PRODUCTION.PRODUCT
WHERE ProductID=2
-- PRODUCTID'SÝ 2 OLAN SATIRIN TÜM KOLONLARINI GETÝR.

SELECT * FROM PRODUCTION.PRODUCT
WHERE Color='Silver'

		--AND KULLANIMI
-- TÜM KOÞULLARIN DOÐRU OLURSA ÇALIÞIR

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Employee WHERE JobTitle='Design Engineer' and BusinessEntityID>5 

		--OR(VEYA) KULLANIMI
-- BÝR TANE ÝFADENÝN DOÐRU OLMASI YETERLÝDÝR.

SELECT * FROM HumanResources.Employee WHERE JobTitle='Design Engineer' OR BusinessEntityID>5 
SELECT FirstName,LastName
FROM Person.Person 
WHERE FirstName='Alex' or LastName='Bell'

USE AdventureWorks2017
GO
SELECT
TOP(5) WITH TIES *
FROM
Production.Product
ORDER BY
ProductID;



		--AS KULLANIMI (TAKMA AD)
-- UZUN KOLON ADLARINA TAKMA ADLAR VEREREK KULLANABÝLMESÝNÝ YARAR. KOLAYLIK SAÐLAR

SELECT PersonType AS 'P', FirstName AS 'AD', LastName AS 'SOYAD' FROM PERSON.PERSON WHERE BusinessEntityID<20






