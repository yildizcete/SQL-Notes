--DML (SELECT - INSERT - UPTADE - DELETE)

--SELECT: KAYITLARI GETÝRÝR
--INSERT: YENÝ KAYITLAR EKLER
--UPDATE: KAYITLARI GÜNCELLER
--DELETE: KAYITLARI SÝLER

--SELECT INTO: Tabloyunun ikizini çýkartýr. Tabloyu kopyalar.
--Bu komut, mevcut veritabanýnda yeni bir tablo oluþturur ve ardýndan bu tabloya sorgudan elde edilen verileri ekler.
--Tabloyu kendi oluþturuyor ve sütunlarý da kendi oluþturuyor. Önceden tablo oluþturmana gerek yok.
--Update komutuyla bir müþteriye ait bir bilgi silinebilir(null atama).
--Update Insanlar
--set City=NULL where CustomerID in(3,7,15)

-- select * into yeni_tablo 
--from mevcut_tablo 
--where koþul
----------------------------------------------------------------------------------------------------------------------

--select * from CUSTOMERS -- tüm tabloyu getirir.
--select ID, NAMESURNAME from CUSTOMERS --ID ve NAMESURNAME sütunlarýný getirir.

--select * from CUSTOMERS where NAMESURNAME='Berkay' 
--select * from CUSTOMERS where GENDER='E' 
--select ID, NAMESURNAME from CUSTOMERS where ID<=10

--select * from CUSTOMERS where ID<=10 and CUSTOMERNAME = 'Ali'
--select * from CUSTOMERS where GENDER='E' or CITY='Konya'

--select * from CUSTOMERS where CUSTOMERNAME like '%f%' -- içinde fharfi olan müþteri isimlerini getir
--select * from CUSTOMERS where CUSTOMERNAME like '%f%' and GENDER='K'
--select * from CUSTOMERS where CUSTOMERNAME like 'f%' and GENDER='E' -- f harfi ile baþlayanlarý getir

--select * from CUSTOMERS where CITY in('Muðla','Ankara','Elazýð') -- Muðla veya(or) Ankara veya(or) Elazýð þehirlerini getir.
--select * from CUSTOMERS where CITY not in('Muðla','Ankara','Elazýð') -- Listede bu þehir olan satýrlarý getirme
--select * from CUSTOMERS where ID in(23,32,50)

--insert into tabloya veri eklemek için kullanýlýr.

--insert into CUSTOMERS (CUSTOMERNAME, GENDER, BIRTHDATE, CITY, TOWN, TELNR) 
--VALUES ('Fatma', 'K', '1970-06-22', 'Elazýð', 'Hasanbeyli', '(0242)2314525'); - ID kýsmýný yazmayarak.

--use CRM
--update tabloadý set güncelleneceksütun=yenideger where hangi satýr.

--update CUSTOMERS 
--set BIRTHDATE='2001-01-01', TELNR='(0416)3302924' WHERE ID=104 -- NULL olan kýsýmlarý doldurdum.

--update CUSTOMERS 
--set CITY='Ýstanbul', TOWN='Maltepe' where ID=101 -- þehri ve ilçeyi güncelledim.
--select * from CUSTOMERS

--delete from ogrenciTablosu -- Tablodaki tüm verileri siler.
--truncate table ogrenciTablosu -- delete ile ayný. Kýsýtlamalarý da siler
--delete from CUSTOMERS where ID in(103,104,105)
--select * from CUSTOMERS

--------------------------------------------------------------------------------------------------------------------
--SORU1. Northwind veritabanýndaki Orders tablosuna yeni bir sipariþ ekleyin ve bu sipariþi Customers tablosundaki bir müþteriyle iliþkilendirin.
--insert into Orders(CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia, Freight, ShipName)
--values('HANAR',3, '1997-05-23', '1997-05-23',2, 32.200,'Hanari Carnes')

--SORU2. Products tablosundaki fiyatý 50'den yüksek olan tüm ürünlerin fiyatýný %10 oranýnda artýrýn.
--select ProductName,Unitprice from Products where UnitPrice>50 order by UnitPrice
--update Products 
--set Unitprice = Unitprice*1.1 where UnitPrice>50

--SORU3. Employees tablosundaki EmployeeID 4 olan çalýþanýn adres bilgisini güncelleyin.
--select * from Employees where EmployeeID=4

--update Employees
--set Address = 'Akpýnar mah. malkoçoglu cd.' where EmployeeID=4

--SORU4. Orders tablosundaki sipariþlerin teslimat tarihini 1 hafta ileriye alarak güncelleyin.
--select ShippedDate from Orders where ShippedDate is not null order by ShippedDate

--update Orders
--set ShippedDate = dateadd(week, 1, ShippedDate) -- ya da dateadd(day,7,ShippedDate)

--SORU5. Categories tablosundaki tüm kategorilere ait ürün sayýsýný hesaplayarak her bir kategorinin sonunda bu deðeri ekleyin.
--select C.CategoryName, count(ProductID) as 'Ürün Sayýsý' from Categories C join Products P
--on C.CategoryID = P.CategoryID group by C.CategoryName
--Eðer count(*) kullanýrsan, NULL olmayan satýrlarý sayar. Bu durumda ProductID'yi saymak daha doðru olacaktýr.

--SORU6. Products tablosundaki Discontinued sütunu false olan ve fiyatý en yüksek olan 5 ürünü sýralayýn.
--select top 5 ProductName, UnitPrice, Discontinued from Products where Discontinued=0 order by UnitPrice desc
--Eðer Discontinued sütunu bit, boolean veya int türündeyse sorguyu þu þekilde yaz; Discontinued=0 

--SORU7. Orders tablosunda, 1997 yýlýna ait sipariþlerin tümünü silin.
--delete from Orders where Year(OrderDate)=1997

--SORU8. Suppliers tablosundaki tüm tedarikçilerin þehir bilgisini tek bir þehirle deðiþtirmek için güncelleme yapýn.
--update Suppliers
--set City='Ýstanbul'

--SORU9. Orders tablosunda, OrderDate deðeri 2000 yýlýna ait olan ve toplam tutarý 5000'den fazla olan sipariþleri silin.
--delete from Orders where Year(OrderDate)=2000 and OrderID in(select OrderID from OrderDetails group by OrderID having sum(Quantity*UnitPrice)>5000)

--SORU10. Employees tablosundaki tüm çalýþanlarýn doðum tarihini 1 yýl ileriye alarak güncelleyin.
--select BirthDate from Employees order by BirthDate

--update Employees 
--set BirthDate = Dateadd(year,1,BirthDate)

--SORU11. Sales.SalesOrderDetail tablosundaki ürünlerin fiyatýný %15 indirimli olarak güncelleyin.
--select UnitPrice from Sales.SalesOrderDetail order by UnitPrice
--update Sales.SalesOrderDetail
--set UnitPrice = UnitPrice*0.85

--SORU12. Products tablosundaki SupplierID 3 olan tedarikçiye ait tüm ürünleri silin.
--delete from Products where SupplierID=3

--SORU13. Insanlar tablosunda ID'si 3 7 15 olan müþterilerin telefon bilgilerini sil.
--Update Insanlar
--set City=NULL where CustomerID in(3,7,15)






