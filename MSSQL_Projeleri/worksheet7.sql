
/*
COUNT() KULLANIMI
Count() fonksiyonu belirtilen alandaki veya tablodaki toplam kayýt sayýsýný verir. Burada dikkat edilmesi gereken alan üzerindeki kayýt sayýlarý alýnýrken boþ verilerin dikkate alýnmamasýdýr. 
parantez içine * veya ekrana yazdýrmka istediðin kolon isimlerini yazýyorsun
*/
select* from Production.Product
select count(*) from Production.Product where color = 'Black'

select * from person.Person
select count (FirstName) AS 'Farklý Ýsimlerin Sayýsý' from person.person 
select count (distinct FirstName) AS 'Farklý Ýsimlerin Sayýsý' from person.person 

select count( musteriNo) as Erkeksayisi from MusteriBilgileri where Cinsiyet = 'E'

select count(distinct sehir) as 'Farklý Þehir Sayýsý' from musteriBilgileri 


/*
AVG() VE SUM() KULLANIMI
AVG() iþlevi, sayýsal bir sütunun ortalamasýný gösterir.
SUM() sayýsal bir sütundaki deðerlerin toplamýný gösterir.
*/
select AVG(Puan) as 'Ortalama Puan' from musteribilgileri




/*
ALT SORGU KULLANIMI
Bir sorgudan elde ettiðiniz sonucu, diðer bir sorgu için kullanmanýz gerektiðinde bunu alt sorgu ile yaparýz.
Kýsaca sorgu içinde sorgu kümesidir.
Alt sorgu tek deðer ya da birden fazla deðer döndürebilir.Buna göre ikiye ayrýlýr. Skaler ve multi-valued 
skalerde = kullanýlýyor
Birden fazla deðer döndüren sorgularda = yerine in kullanýrýz.
*/

use AdventureWorks2017
select * from production.product
select listprice from production.product where name = 'Chainring Bolts'
select name from production.product where listprice = '0.00'
select name from production.product where listprice = (select listprice from production.product where name = 'Chainring Bolts')

-- name'i Chainring Bolts olan kiþinin listpricesiyle ayný olan kiþilerin isimlerini ekrana yazdýr

select * from Production.TransactionHistory
select MAX( t.transactionID) from Production.TransactionHistory t

select TransactionID, ProductID, TransactionDate, Quantity 
from Production.TransactionHistory
where TransactionID = (select MAX( t.transactionID) from Production.TransactionHistory t)

-- alt sorguda çýkan sonuç bir sayý
-- TransactionID en yüksek olan kiþinin TransactionID, ProductID, TransactionDate, Quantitylerini getir

select TerritoryID from sales.salesPerson where businessentityID = 276
select customerID from Sales.Customer where TerritoryID = '4'
select customerID from Sales.Customer where TerritoryID = (select TerritoryID from sales.salesPerson where businessentityID = 276)


Select ProductID, Name from Production.Product where ProductID in (Select ProductID from Sales.SalesOrderDetail)
Select * From sales.SalesOrderDetail
Select productID From sales.SalesOrderDetail where productID is not null

-- Eðer bir tabloda NULL deðer içeren kayýtlar bulunmak isteniyorsa sorguda  IS NULL ifadesi kullanýlýr. Ayný þekilde NULL deðer içermeyen kayýtlar listelenmek isteniyorsa da IS NOT NULL ifadesi kullanýlýr.

Select ProductID, Name from Production.Product where ProductID not in (Select productID From sales.SalesOrderDetail)
Select ProductID, Name from Production.Product where ProductID not in (Select productID From sales.SalesOrderDetail where ProductID is not null)

-- hocanýn pptsinden aldým. Zaten productId kolonunda hiç boþ deðer yok saçmalamýþ
-- Kolon deðerinin bir liste içerisinden herhangi bir deðere eþit olmasý istenen durumda IN operatörü kullanýlabilir. Listede herhangi bir deðere eþit olmasý istenilmeyen durumda da NOT IN operatörü kullanýlýr.

Select CustomerID, SalesOrderID From Sales.SalesOrderHeader where CustomerID in (select CustomerID from sales.Customer where TerritoryID = 4)
Select c.CustomerID, s.SalesOrderID From Sales.SalesOrderHeader s inner join sales.customer c on c.CustomerID=s.CustomerID where c.TerritoryID = 4

-- üstteki iki sorgu da ayný sonucu veriyor. inner joinle yapýlan sorgu daha uzun sürüyor


select * from Ogrenci where OgrenciNo in (select OgrenciNo from OgrenciAdres where Sehir = 35)
-- OgrenciAdres tablosunda sehiri 35 olan öðrencilerin nosu, Ogrenci adlý tablodaki OgrenciNosuna eþit olan öðrencilerin tüm bilgilerini getir

select orderid, customerid from orders as or1 where 30 < (select quantity from orderdetails as od where or1.orderid = od.orderid and od.productid = 30)
