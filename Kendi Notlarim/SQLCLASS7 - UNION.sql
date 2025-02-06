--intersect = iki sorgunun kesiþimini bulmak için kullanýlan bir komuttur. = inner join

--1. Hem 1997 ve hem de 1998 yýllarýnda sipariþ veren müþterileri bulun.
--select distinct CustomerID from Orders where year(OrderDate) = 1997
--intersect
--select distinct CustomerID from Orders where year(OrderDate) = 1998

--2.hem müþteri hem de tedarikçinin bulunduðu ülkeleri listeleyin
--select distinct Country from Customers
--intersect
--select distinct Country from Suppliers

--except = sadece ilk sorguda olan satýrlarý döndürür. 
--yalnýzca iki sorgunun ayný sütun sayýsýna ve uyumlu veri türlerine sahip olduðu durumlarda çalýþýr.

--1.Products tablosunda olan ancak henüz bir sipariþte (Order Details) bulunmayan ürünleri listeleyin.
--select ProductID from Products 
--except 
--select ProductID from OrderDetails

------------------------------------------------------------------------------------------------------
---------UNION VE UNION ALL---------------------------
--Union = Tablolarý birbirine baðlar. Ancak her kayýttan birer tane getirir. (ilk tabloda iki tane olsa bile bir tane getirir)
--Union All = Tablolardaki tüm satýrlarý döndürür, tekrarlarý da alýr.

--1.Products tablosundaki tüm ürünleri ve Suppliers tablosundaki tüm tedarikçileri birleþtiren bir sorgu yazýn. 
--Ancak her iki tablodan gelen tekrar eden satýrlar yalnýzca bir kez görünmelidir.

--select ProductName as 'Tüm Ürünler ve Þirket Ýsimleri' from Products
--Union
--select CompanyName as 'Tüm Ürünler ve Þirket Ýsimleri' from Suppliers

--2.Orders ve Shippers tablolarýndaki ShipperID deðerlerini birleþtirin, 
--ancak her iki tablodan gelen tekrarlanan ShipperID deðerleri bir kez görünsün.

--select ProductID from OrderDetails
--Union
--select ProductID from Products

--3.Products tablosundaki ProductID deðerleri ile Order Details tablosundaki ProductID deðerlerin tümünü birleþtirin.

--select ProductID from OrderDetails
--Union all
--select ProductID from Products

--4.Employees tablosundaki EmployeeID ve Orders tablosundaki EmployeeID'leri birleþtirin, 
--Ancak her iki tablodan gelen tekrarlarý da dahil edin.

--select EmployeeID from Employees
--Union all
--select EmployeeID from Orders
