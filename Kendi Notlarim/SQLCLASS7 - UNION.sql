--intersect = iki sorgunun kesi�imini bulmak i�in kullan�lan bir komuttur. = inner join

--1. Hem 1997 ve hem de 1998 y�llar�nda sipari� veren m��terileri bulun.
--select distinct CustomerID from Orders where year(OrderDate) = 1997
--intersect
--select distinct CustomerID from Orders where year(OrderDate) = 1998

--2.hem m��teri hem de tedarik�inin bulundu�u �lkeleri listeleyin
--select distinct Country from Customers
--intersect
--select distinct Country from Suppliers

--except = sadece ilk sorguda olan sat�rlar� d�nd�r�r. 
--yaln�zca iki sorgunun ayn� s�tun say�s�na ve uyumlu veri t�rlerine sahip oldu�u durumlarda �al���r.

--1.Products tablosunda olan ancak hen�z bir sipari�te (Order Details) bulunmayan �r�nleri listeleyin.
--select ProductID from Products 
--except 
--select ProductID from OrderDetails

------------------------------------------------------------------------------------------------------
---------UNION VE UNION ALL---------------------------
--Union = Tablolar� birbirine ba�lar. Ancak her kay�ttan birer tane getirir. (ilk tabloda iki tane olsa bile bir tane getirir)
--Union All = Tablolardaki t�m sat�rlar� d�nd�r�r, tekrarlar� da al�r.

--1.Products tablosundaki t�m �r�nleri ve Suppliers tablosundaki t�m tedarik�ileri birle�tiren bir sorgu yaz�n. 
--Ancak her iki tablodan gelen tekrar eden sat�rlar yaln�zca bir kez g�r�nmelidir.

--select ProductName as 'T�m �r�nler ve �irket �simleri' from Products
--Union
--select CompanyName as 'T�m �r�nler ve �irket �simleri' from Suppliers

--2.Orders ve Shippers tablolar�ndaki ShipperID de�erlerini birle�tirin, 
--ancak her iki tablodan gelen tekrarlanan ShipperID de�erleri bir kez g�r�ns�n.

--select ProductID from OrderDetails
--Union
--select ProductID from Products

--3.Products tablosundaki ProductID de�erleri ile Order Details tablosundaki ProductID de�erlerin t�m�n� birle�tirin.

--select ProductID from OrderDetails
--Union all
--select ProductID from Products

--4.Employees tablosundaki EmployeeID ve Orders tablosundaki EmployeeID'leri birle�tirin, 
--Ancak her iki tablodan gelen tekrarlar� da dahil edin.

--select EmployeeID from Employees
--Union all
--select EmployeeID from Orders
