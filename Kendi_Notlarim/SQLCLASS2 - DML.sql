--DML (SELECT - INSERT - UPTADE - DELETE)

--SELECT: KAYITLARI GET�R�R
--INSERT: YEN� KAYITLAR EKLER
--UPDATE: KAYITLARI G�NCELLER
--DELETE: KAYITLARI S�LER

--SELECT INTO: Tabloyunun ikizini ��kart�r. Tabloyu kopyalar.
--Bu komut, mevcut veritaban�nda yeni bir tablo olu�turur ve ard�ndan bu tabloya sorgudan elde edilen verileri ekler.
--Tabloyu kendi olu�turuyor ve s�tunlar� da kendi olu�turuyor. �nceden tablo olu�turmana gerek yok.
--Update komutuyla bir m��teriye ait bir bilgi silinebilir(null atama).
--Update Insanlar
--set City=NULL where CustomerID in(3,7,15)

-- select * into yeni_tablo 
--from mevcut_tablo 
--where ko�ul
----------------------------------------------------------------------------------------------------------------------

--select * from CUSTOMERS -- t�m tabloyu getirir.
--select ID, NAMESURNAME from CUSTOMERS --ID ve NAMESURNAME s�tunlar�n� getirir.

--select * from CUSTOMERS where NAMESURNAME='Berkay' 
--select * from CUSTOMERS where GENDER='E' 
--select ID, NAMESURNAME from CUSTOMERS where ID<=10

--select * from CUSTOMERS where ID<=10 and CUSTOMERNAME = 'Ali'
--select * from CUSTOMERS where GENDER='E' or CITY='Konya'

--select * from CUSTOMERS where CUSTOMERNAME like '%f%' -- i�inde fharfi olan m��teri isimlerini getir
--select * from CUSTOMERS where CUSTOMERNAME like '%f%' and GENDER='K'
--select * from CUSTOMERS where CUSTOMERNAME like 'f%' and GENDER='E' -- f harfi ile ba�layanlar� getir

--select * from CUSTOMERS where CITY in('Mu�la','Ankara','Elaz��') -- Mu�la veya(or) Ankara veya(or) Elaz�� �ehirlerini getir.
--select * from CUSTOMERS where CITY not in('Mu�la','Ankara','Elaz��') -- Listede bu �ehir olan sat�rlar� getirme
--select * from CUSTOMERS where ID in(23,32,50)

--insert into tabloya veri eklemek i�in kullan�l�r.

--insert into CUSTOMERS (CUSTOMERNAME, GENDER, BIRTHDATE, CITY, TOWN, TELNR) 
--VALUES ('Fatma', 'K', '1970-06-22', 'Elaz��', 'Hasanbeyli', '(0242)2314525'); - ID k�sm�n� yazmayarak.

--use CRM
--update tabload� set g�ncelleneceks�tun=yenideger where hangi sat�r.

--update CUSTOMERS 
--set BIRTHDATE='2001-01-01', TELNR='(0416)3302924' WHERE ID=104 -- NULL olan k�s�mlar� doldurdum.

--update CUSTOMERS 
--set CITY='�stanbul', TOWN='Maltepe' where ID=101 -- �ehri ve il�eyi g�ncelledim.
--select * from CUSTOMERS

--delete from ogrenciTablosu -- Tablodaki t�m verileri siler.
--truncate table ogrenciTablosu -- delete ile ayn�. K�s�tlamalar� da siler
--delete from CUSTOMERS where ID in(103,104,105)
--select * from CUSTOMERS

--------------------------------------------------------------------------------------------------------------------
--SORU1. Northwind veritaban�ndaki Orders tablosuna yeni bir sipari� ekleyin ve bu sipari�i Customers tablosundaki bir m��teriyle ili�kilendirin.
--insert into Orders(CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia, Freight, ShipName)
--values('HANAR',3, '1997-05-23', '1997-05-23',2, 32.200,'Hanari Carnes')

--SORU2. Products tablosundaki fiyat� 50'den y�ksek olan t�m �r�nlerin fiyat�n� %10 oran�nda art�r�n.
--select ProductName,Unitprice from Products where UnitPrice>50 order by UnitPrice
--update Products 
--set Unitprice = Unitprice*1.1 where UnitPrice>50

--SORU3. Employees tablosundaki EmployeeID 4 olan �al��an�n adres bilgisini g�ncelleyin.
--select * from Employees where EmployeeID=4

--update Employees
--set Address = 'Akp�nar mah. malko�oglu cd.' where EmployeeID=4

--SORU4. Orders tablosundaki sipari�lerin teslimat tarihini 1 hafta ileriye alarak g�ncelleyin.
--select ShippedDate from Orders where ShippedDate is not null order by ShippedDate

--update Orders
--set ShippedDate = dateadd(week, 1, ShippedDate) -- ya da dateadd(day,7,ShippedDate)

--SORU5. Categories tablosundaki t�m kategorilere ait �r�n say�s�n� hesaplayarak her bir kategorinin sonunda bu de�eri ekleyin.
--select C.CategoryName, count(ProductID) as '�r�n Say�s�' from Categories C join Products P
--on C.CategoryID = P.CategoryID group by C.CategoryName
--E�er count(*) kullan�rsan, NULL olmayan sat�rlar� sayar. Bu durumda ProductID'yi saymak daha do�ru olacakt�r.

--SORU6. Products tablosundaki Discontinued s�tunu false olan ve fiyat� en y�ksek olan 5 �r�n� s�ralay�n.
--select top 5 ProductName, UnitPrice, Discontinued from Products where Discontinued=0 order by UnitPrice desc
--E�er Discontinued s�tunu bit, boolean veya int t�r�ndeyse sorguyu �u �ekilde yaz; Discontinued=0 

--SORU7. Orders tablosunda, 1997 y�l�na ait sipari�lerin t�m�n� silin.
--delete from Orders where Year(OrderDate)=1997

--SORU8. Suppliers tablosundaki t�m tedarik�ilerin �ehir bilgisini tek bir �ehirle de�i�tirmek i�in g�ncelleme yap�n.
--update Suppliers
--set City='�stanbul'

--SORU9. Orders tablosunda, OrderDate de�eri 2000 y�l�na ait olan ve toplam tutar� 5000'den fazla olan sipari�leri silin.
--delete from Orders where Year(OrderDate)=2000 and OrderID in(select OrderID from OrderDetails group by OrderID having sum(Quantity*UnitPrice)>5000)

--SORU10. Employees tablosundaki t�m �al��anlar�n do�um tarihini 1 y�l ileriye alarak g�ncelleyin.
--select BirthDate from Employees order by BirthDate

--update Employees 
--set BirthDate = Dateadd(year,1,BirthDate)

--SORU11. Sales.SalesOrderDetail tablosundaki �r�nlerin fiyat�n� %15 indirimli olarak g�ncelleyin.
--select UnitPrice from Sales.SalesOrderDetail order by UnitPrice
--update Sales.SalesOrderDetail
--set UnitPrice = UnitPrice*0.85

--SORU12. Products tablosundaki SupplierID 3 olan tedarik�iye ait t�m �r�nleri silin.
--delete from Products where SupplierID=3

--SORU13. Insanlar tablosunda ID'si 3 7 15 olan m��terilerin telefon bilgilerini sil.
--Update Insanlar
--set City=NULL where CustomerID in(3,7,15)






