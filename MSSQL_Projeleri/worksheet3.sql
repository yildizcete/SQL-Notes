	use AdventureWorks2017

	--IN KULLANIMI
--in=içinde demek.Sütun veya sütunlar içerisinde bir ya da birden fazla belirli kayýt aramak için kullanýlýr. 
--Aranmak istenen kayýtlar IN (bir, iki, ...) içerisinde virgül ile ayrýlarak belirtilir.
--IN ile gerçekleþtirdiðimiz sorguyu, OR karþýlaþtýrma operatörü ile de gerçekleþtirebiliriz.

 
select * from Sales.SalesOrderDetail

-- SalesorderdetailID'si 1,2,3 olanlarýn tüm kolonlarýný getir

select * from sales.SalesOrderDetail where SalesOrderDetailID=1 or SalesOrderDetailID=2 or SalesOrderDetailID=15

--Veya þöyle yapabiliriz. Daha kolay ve kýsa kullaným saðlar

select * from Sales.SalesOrderDetail where SalesOrderDetailID in(1,2,15)

SELECT ProductID, Name FROM Production.Product WHERE '2014-02-08 10:01:36.827' IN(SellStartDate, ModifiedDate) --'2014-02-08 10:01:36.827’ tarih deðerini SellStartDate ve ModifiedDate sütunlarýnda arayarak sonuçlarý listeledi
SELECT ProductID, Name FROM Production.Product WHERE Name IN('Chain', 'Chainring')  --Name sütununda Chain ve Chairing isimli ürünleri listeleyelim.

/*
		NOT IN KULLANIMI
IN ile birlikte NOT operatörünü kullanarak belirtilen kayýtlarýn dýþýndaki tüm kayýtlar listelenebilir.
*/

select * from Sales.SalesOrderDetail where SalesOrderDetailID Not in(1,2,15)


		--LIKE KULLANIMI
-- like komutu bir ifadeyi içeren verileri bulmak için kullanýlýr.

select * from production.product
select * from production.product where name like 'a%' 

-- a% = a ile baþlayan %a = a ile biten %asd% 0 asd içeren ifaleri geitirir.

select * from production.product where name like '%road%' and ProductID<750

		--BETWEEN KULLANIMI (ARASINDA)

select * from Production.Product
select * from production.product where ProductID>=01 and ProductID<=400 

 -- veya between kullanarak daha kýsa bir þekild yazayabiliriz.

select * from production.product where ProductID between 1 and 400

		--DISTINCT KULLANIMI (FARKLI)
-- Bir kolonda kaç farklý türde veri olduðunu gösterir.
-- Tekrarlayan verileri göstermez.

select * from person.person
select persontype from person.person
select distinct persontype from person.person
select distinct firstname from person.person 



		-- ORDER BY KULLANIMI
-- artan ya da azalan þekilde sýralamaya yarar
-- asc = artan a-z 1-9 (ascending)
-- desc = azalan z-a 9-1 (descending)

select * from sales.SalesOrderDetail
select * from sales.SalesOrderDetail order by UnitPrice asc
select LineTotal from sales.SalesOrderDetail order by LineTotal desc

select * from production.product 
select top 10 p.productID, Name from production.product p order by productID
select top 10 p.productID, Name from production.product p order by Name asc
select top 10 p.productID, Name, p.ReorderPoint from production.product p order by 2 asc 
 -- asc'dan önce yazdýðýmýz sayýnýn sütununa göre sýralama yapýyor.

/*
TOP n yazdýðýmýzDa ilk n kaydý getirecektir. Fakat ilk 3 kaydý getirirken 4. 5. ya da sonraki kayýtlarda ayný deðere sahip bir kayýt olabilir ve sorgumuz buna izin vermediði için bu verileri getiremeyecektir.
WITH TIES komutu ise bize ayný deðerdeki kayýtlarý da getirir ve ilk sorgumuzdan dolayý dýþarýda kalan kayýtlar da listelenmiþ olacaktýr.
WITH TIES yapýsýný kullanabilmek için ORDER BY kullanmamýz zorunludur.
SELECT TOP 3 WITH TIES komutunun anlamý:Sipariþteki ürün miktarý fazla olan ilk 3 kaydý getir ve ayný kayýt varsa onlarý da getir
WÝTH TÝES mantýðý þu sondaki veriyle ayný olan baþka veri varsa onu da getir 
*/

USE AdventureWorks2017
SELECT * FROM Production.Product 
SELECT * FROM Production.Product order by SafetyStockLevel asc
SELECT TOP(5) WITH TIES * FROM Production.Product ORDER BY SafetyStockLevel
--

SELECT TOP(5) PERCENT WITH TIES * FROM Production.Product ORDER BY ProductID --%5LÝK KISMI GETÝRÝR.


		SELECT INTO
select into tablo ya da kayýt kümesinin bir kopyasýný baþka bir tabloya kopyalar.

use AdventureWorks2017
select ProductID, Name
into Product_Backup0 --tablo daha oluþturulmamýþ
from Production.Product
select top 10 * from product_Backup0


select productID, Name
into ProductNameC
from Production.product
where name like 'C%'
select top 20 * from ProductNameC

