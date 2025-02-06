
/*
COUNT() KULLANIMI
Count() fonksiyonu belirtilen alandaki veya tablodaki toplam kay�t say�s�n� verir. Burada dikkat edilmesi gereken alan �zerindeki kay�t say�lar� al�n�rken bo� verilerin dikkate al�nmamas�d�r. 
parantez i�ine * veya ekrana yazd�rmka istedi�in kolon isimlerini yaz�yorsun
*/
select* from Production.Product
select count(*) from Production.Product where color = 'Black'

select * from person.Person
select count (FirstName) AS 'Farkl� �simlerin Say�s�' from person.person 
select count (distinct FirstName) AS 'Farkl� �simlerin Say�s�' from person.person 

select count( musteriNo) as Erkeksayisi from MusteriBilgileri where Cinsiyet = 'E'

select count(distinct sehir) as 'Farkl� �ehir Say�s�' from musteriBilgileri 


/*
AVG() VE SUM() KULLANIMI
AVG() i�levi, say�sal bir s�tunun ortalamas�n� g�sterir.
SUM() say�sal bir s�tundaki de�erlerin toplam�n� g�sterir.
*/
select AVG(Puan) as 'Ortalama Puan' from musteribilgileri




/*
ALT SORGU KULLANIMI
Bir sorgudan elde etti�iniz sonucu, di�er bir sorgu i�in kullanman�z gerekti�inde bunu alt sorgu ile yapar�z.
K�saca sorgu i�inde sorgu k�mesidir.
Alt sorgu tek de�er ya da birden fazla de�er d�nd�rebilir.Buna g�re ikiye ayr�l�r. Skaler ve multi-valued 
skalerde = kullan�l�yor
Birden fazla de�er d�nd�ren sorgularda = yerine in kullan�r�z.
*/

use AdventureWorks2017
select * from production.product
select listprice from production.product where name = 'Chainring Bolts'
select name from production.product where listprice = '0.00'
select name from production.product where listprice = (select listprice from production.product where name = 'Chainring Bolts')

-- name'i Chainring Bolts olan ki�inin listpricesiyle ayn� olan ki�ilerin isimlerini ekrana yazd�r

select * from Production.TransactionHistory
select MAX( t.transactionID) from Production.TransactionHistory t

select TransactionID, ProductID, TransactionDate, Quantity 
from Production.TransactionHistory
where TransactionID = (select MAX( t.transactionID) from Production.TransactionHistory t)

-- alt sorguda ��kan sonu� bir say�
-- TransactionID en y�ksek olan ki�inin TransactionID, ProductID, TransactionDate, Quantitylerini getir

select TerritoryID from sales.salesPerson where businessentityID = 276
select customerID from Sales.Customer where TerritoryID = '4'
select customerID from Sales.Customer where TerritoryID = (select TerritoryID from sales.salesPerson where businessentityID = 276)


Select ProductID, Name from Production.Product where ProductID in (Select ProductID from Sales.SalesOrderDetail)
Select * From sales.SalesOrderDetail
Select productID From sales.SalesOrderDetail where productID is not null

-- E�er bir tabloda NULL de�er i�eren kay�tlar bulunmak isteniyorsa sorguda  IS NULL ifadesi kullan�l�r. Ayn� �ekilde NULL de�er i�ermeyen kay�tlar listelenmek isteniyorsa da IS NOT NULL ifadesi kullan�l�r.

Select ProductID, Name from Production.Product where ProductID not in (Select productID From sales.SalesOrderDetail)
Select ProductID, Name from Production.Product where ProductID not in (Select productID From sales.SalesOrderDetail where ProductID is not null)

-- hocan�n pptsinden ald�m. Zaten productId kolonunda hi� bo� de�er yok sa�malam��
-- Kolon de�erinin bir liste i�erisinden herhangi bir de�ere e�it olmas� istenen durumda IN operat�r� kullan�labilir. Listede herhangi bir de�ere e�it olmas� istenilmeyen durumda da NOT IN operat�r� kullan�l�r.

Select CustomerID, SalesOrderID From Sales.SalesOrderHeader where CustomerID in (select CustomerID from sales.Customer where TerritoryID = 4)
Select c.CustomerID, s.SalesOrderID From Sales.SalesOrderHeader s inner join sales.customer c on c.CustomerID=s.CustomerID where c.TerritoryID = 4

-- �stteki iki sorgu da ayn� sonucu veriyor. inner joinle yap�lan sorgu daha uzun s�r�yor


select * from Ogrenci where OgrenciNo in (select OgrenciNo from OgrenciAdres where Sehir = 35)
-- OgrenciAdres tablosunda sehiri 35 olan ��rencilerin nosu, Ogrenci adl� tablodaki OgrenciNosuna e�it olan ��rencilerin t�m bilgilerini getir

select orderid, customerid from orders as or1 where 30 < (select quantity from orderdetails as od where or1.orderid = od.orderid and od.productid = 30)
