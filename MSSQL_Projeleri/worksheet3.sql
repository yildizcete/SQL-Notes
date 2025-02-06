	use AdventureWorks2017

	--IN KULLANIMI
--in=i�inde demek.S�tun veya s�tunlar i�erisinde bir ya da birden fazla belirli kay�t aramak i�in kullan�l�r. 
--Aranmak istenen kay�tlar IN (bir, iki, ...) i�erisinde virg�l ile ayr�larak belirtilir.
--IN ile ger�ekle�tirdi�imiz sorguyu, OR kar��la�t�rma operat�r� ile de ger�ekle�tirebiliriz.

 
select * from Sales.SalesOrderDetail

-- SalesorderdetailID'si 1,2,3 olanlar�n t�m kolonlar�n� getir

select * from sales.SalesOrderDetail where SalesOrderDetailID=1 or SalesOrderDetailID=2 or SalesOrderDetailID=15

--Veya ��yle yapabiliriz. Daha kolay ve k�sa kullan�m sa�lar

select * from Sales.SalesOrderDetail where SalesOrderDetailID in(1,2,15)

SELECT ProductID, Name FROM Production.Product WHERE '2014-02-08 10:01:36.827' IN(SellStartDate, ModifiedDate) --'2014-02-08 10:01:36.827� tarih de�erini SellStartDate ve ModifiedDate s�tunlar�nda arayarak sonu�lar� listeledi
SELECT ProductID, Name FROM Production.Product WHERE Name IN('Chain', 'Chainring')  --Name s�tununda Chain ve Chairing isimli �r�nleri listeleyelim.

/*
		NOT IN KULLANIMI
IN ile birlikte NOT operat�r�n� kullanarak belirtilen kay�tlar�n d���ndaki t�m kay�tlar listelenebilir.
*/

select * from Sales.SalesOrderDetail where SalesOrderDetailID Not in(1,2,15)


		--LIKE KULLANIMI
-- like komutu bir ifadeyi i�eren verileri bulmak i�in kullan�l�r.

select * from production.product
select * from production.product where name like 'a%' 

-- a% = a ile ba�layan %a = a ile biten %asd% 0 asd i�eren ifaleri geitirir.

select * from production.product where name like '%road%' and ProductID<750

		--BETWEEN KULLANIMI (ARASINDA)

select * from Production.Product
select * from production.product where ProductID>=01 and ProductID<=400 

 -- veya between kullanarak daha k�sa bir �ekild yazayabiliriz.

select * from production.product where ProductID between 1 and 400

		--DISTINCT KULLANIMI (FARKLI)
-- Bir kolonda ka� farkl� t�rde veri oldu�unu g�sterir.
-- Tekrarlayan verileri g�stermez.

select * from person.person
select persontype from person.person
select distinct persontype from person.person
select distinct firstname from person.person 



		-- ORDER BY KULLANIMI
-- artan ya da azalan �ekilde s�ralamaya yarar
-- asc = artan a-z 1-9 (ascending)
-- desc = azalan z-a 9-1 (descending)

select * from sales.SalesOrderDetail
select * from sales.SalesOrderDetail order by UnitPrice asc
select LineTotal from sales.SalesOrderDetail order by LineTotal desc

select * from production.product 
select top 10 p.productID, Name from production.product p order by productID
select top 10 p.productID, Name from production.product p order by Name asc
select top 10 p.productID, Name, p.ReorderPoint from production.product p order by 2 asc 
 -- asc'dan �nce yazd���m�z say�n�n s�tununa g�re s�ralama yap�yor.

/*
TOP n yazd���m�zDa ilk n kayd� getirecektir. Fakat ilk 3 kayd� getirirken 4. 5. ya da sonraki kay�tlarda ayn� de�ere sahip bir kay�t olabilir ve sorgumuz buna izin vermedi�i i�in bu verileri getiremeyecektir.
WITH TIES komutu ise bize ayn� de�erdeki kay�tlar� da getirir ve ilk sorgumuzdan dolay� d��ar�da kalan kay�tlar da listelenmi� olacakt�r.
WITH TIES yap�s�n� kullanabilmek i�in ORDER BY kullanmam�z zorunludur.
SELECT TOP 3 WITH TIES komutunun anlam�:Sipari�teki �r�n miktar� fazla olan ilk 3 kayd� getir ve ayn� kay�t varsa onlar� da getir
W�TH T�ES mant��� �u sondaki veriyle ayn� olan ba�ka veri varsa onu da getir 
*/

USE AdventureWorks2017
SELECT * FROM Production.Product 
SELECT * FROM Production.Product order by SafetyStockLevel asc
SELECT TOP(5) WITH TIES * FROM Production.Product ORDER BY SafetyStockLevel
--

SELECT TOP(5) PERCENT WITH TIES * FROM Production.Product ORDER BY ProductID --%5L�K KISMI GET�R�R.


		SELECT INTO
select into tablo ya da kay�t k�mesinin bir kopyas�n� ba�ka bir tabloya kopyalar.

use AdventureWorks2017
select ProductID, Name
into Product_Backup0 --tablo daha olu�turulmam��
from Production.Product
select top 10 * from product_Backup0


select productID, Name
into ProductNameC
from Production.product
where name like 'C%'
select top 20 * from ProductNameC

