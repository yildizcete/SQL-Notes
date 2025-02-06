-- JO�N ��LEMLER� 
hi�bir ortak bir �eye ba�lamadan yazma.
select Employees.FirstName,Employees.LastName, Customers.Phone from Employees, Customers order by Employees.FirstName desc



-- Where ile join kombinasyonlar�

--1.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolar�n�, SalesOrderID s�tunu �zerinden birle�tirerek,
--her sat�� sipari�i i�in SalesOrderID, OrderDate ve sat�lan �r�nlerin ProductID bilgilerini listeleyin.

--select SalesOrderHeader.SalesOrderID, Sales.SalesOrderHeader.OrderDate,SalesOrderDetail.OrderQty 
--from Sales.SalesOrderHeader,Sales.SalesOrderDetail 
--where  Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID

--takma ad kulland�m.
--select SH.SalesOrderID,SH.OrderDate,SD.OrderQty 
--from Sales.SalesOrderHeader SH,Sales.SalesOrderDetail SD
--where  SH.SalesOrderID = SD.SalesOrderID

--2.Person.Person ve Sales.SalesPerson tablolar�n� kullanarak
--m��teri bilgilerini ve her m��terinin bonus puanlar�n� listeleyin.

--select PP.FirstName, PP.Lastname, SSP.Bonus
--from Person.Person PP, Sales.SalesPerson SSP
--where PP.BusinessEntityID = SSP.BusinessEntityID

-- INNER JOIN ile birle�tirme kombinasyonlar�
--where ile yap�lan join i�lemeri inner joinle kolayl�kla yap�l�r. where biraz eski usul.

--1.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolar�n�, SalesOrderID s�tunu �zerinden birle�tirerek, 
--her sipari�in ID'si, sipari� tarihi ve sat�lan �r�nlerin adet bilgilerini listeleyin.

--select SH.SalesOrderID, SH.OrderDate, SD.OrderQty 
--from Sales.SalesOrderHeader SH
--inner join Sales.SalesOrderDetail SD
--on SH.SalesOrderID = SD.SalesOrderID

--2.Person.Person ve Sales.SalesPersonQuotaHistory tablolar�ndan
--m��teri isimlerini ve her m��terinin sat�� kotas�n� listeleyin.

--select PP.FirstName, PP.LastName, SH.SalesQuota
--from Person.Person PP inner join Sales.SalesPersonQuotaHistory SH
--on PP.BusinessEntityID = SH.BusinessEntityID

-- LEFT ve RIGHT JOIN ile birle�tirme kombinasyonlar�

--1.Person.Person ve Sales.SalesPerson tablolar�n� BusinessEntityID s�tunu �zerinden birle�tirerek,
--t�m �al��anlar� ve her �al��an�n sat�� performans�n� listeleyin.
--Sat�� performans� olmayan �al��anlar i�in sat�� bilgisi bo� g�r�ns�n.

--select PP.BusinessEntityID, PP.FirstName, PP.LastName, SSp.SalesQuota 
--from Person.Person PP left join Sales.SalesPerson SSP 
--on PP.BusinessEntityID = SSP.BusinessEntityID

--2.Production.Product ve Sales.SalesOrderDetail tablolar�n� ProductID s�tunu �zerinden birle�tirerek,
--t�m �r�nlerin sat�� bilgilerini listeleyin. 
--Sat��� olmayan �r�nlerde sat�� bilgileri bo� g�r�ns�n.

--select PP.*, SD.OrderQty, SD.LineTotal from Production.Product PP
--left join Sales.SalesOrderDetail SD
--on PP.ProductID = SD.ProductID

--3.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolar�n� SalesOrderID s�tunu �zerinden birle�tirerek,
--t�m sipari� ba�l�klar�n� ve varsa bu sipari�lere ait detay bilgilerini listeleyin.
--Detay bilgisi olmayan sipari�lerde detay s�tunlar� bo� (NULL) g�r�ns�n

--select SD.SalesOrderID, SD.ProductID, SD.OrderQty, SH.OrderDate
--from Sales.SalesOrderDetail SD
--right join Sales.SalesOrderHeader SH
--on SD.SalesOrderID = SH.SalesOrderID

--FULL JOIN Kombinasyonlar�

--1.Production.Product ve Sales.SalesOrderDetail tablolar�n� ProductID s�tunu �zerinden birle�tirerek,
--hem �r�n bilgilerini hem de sat�� bilgilerini listeleyin.
--Sat�lmam�� �r�nler ile sat��ta olmayan �r�n bilgileri de g�r�ns�n.

--select PP.ProductID, PP.Name, PP.ProductNumber, SD.OrderQty, SD.LineTotal from Production.Product PP full join Sales.SalesOrderDetail SD
--on PP.ProductID = SD.ProductID 
 
-- Cross Join kartezyen �arp�m yapar sol tabloyu sa� tablo ile �arpar

------------------------------------------------------------------------------------
-----------------------------�RNEK SORULAR------------------------------------------
 
--1.Orders ve Customers tablolar�n� birle�tirerek
--her sipari�in OrderID, m��terinin ContactName ve CompanyName bilgilerini listeleyin.
--select O.OrderID, C.ContactName, C.CompanyName from Orders O join Customers C
--on C.CustomerID = O.CustomerID

--2.Products ve Categories tablolar�n� birle�tirerek 
--t�m �r�nleri listeleyin. Kategorisi olmayan �r�nleri de dahil edin.
--select P.ProductID, P.ProductName,C.CategoryName from Products P left join Categories C
--on P.CategoryID = C.CategoryID

--3.Products ve Suppliers tablolar�n� birle�tirerek, her tedarik�inin sa�lad��� �r�nleri listeleyin. 
--Hi� �r�n� olmayan tedarik�ileri de dahil edin.
--select S.CompanyName, P.ProductName from Suppliers S left join Products P
--on P.SupplierID = S.SupplierID

--***4.Orders, Order Details ve Products tablolar�n� birle�tirerek, 1998 y�l�nda verilen sipari�lerde en fazla sipari� edilen (Quantity) 3 �r�n� listeleyin.
--select top 3 P.ProductName as '�r�n ad�', sum(OD.Quantity) as 'Toplam sipari�'from Products P 
--join OrderDetails OD on P.ProductID = OD.ProductID 
--join Orders O on O.OrderID = OD.OrderID where year(O.OrderDate)=1998 group by P.ProductName order by sum(OD.Quantity) desc

--5.Products ve Categories tablolar�n� birle�tirerek, kategori baz�nda toplam �r�n say�s�n� listeleyin.
--Sadece 10'dan fazla �r�n i�eren kategorileri g�sterin.

--select C.CategoryName, count(ProductName) as 'Toplam �r�n say�s�' from Products P join Categories C on C.CategoryID = P.CategoryID
--group by C.CategoryName having count(ProductName)>=10 order by [Toplam �r�n say�s�]

--6.Orders, Order Details ve Products tablolar�n� birle�tirerek her sipari� i�in �u bilgileri listeleyin:
--Sipari� ID (OrderID),
--�r�n ad� (ProductName),
--Sat�� fiyat� (UnitPrice),
--Sipari� edilen miktar (Quantity),
--Toplam tutar (UnitPrice * Quantity).
--select OD.OrderID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.UnitPrice*OD.Quantity as 'toplam tutar' from Products P 
--join OrderDetails OD on P.ProductID = OD.ProductID 
--join Orders O on O.OrderID = OD.OrderID

--7.Orders ve Customers tablolar�n� birle�tirerek, her m��terinin verdi�i sipari�lerin 
--toplam say�s�n� listeleyin. Sonu�lar� m��terinin ad�na g�re s�ralay�n.
--select C.ContactName as 'M��teri Ad�', count(O.CustomerID) as 'Toplam Sipari� Say�s�' from Customers C 
--join Orders O on O.CustomerID = C.CustomerID group by C.ContactName order by C.ContactName

--8.Products ve Suppliers tablolar�n� birle�tirerek, UnitPrice de�eri 50'nin �zerinde olan �r�nlerin ProductName, UnitPrice ve tedarik�i ad� (CompanyName) bilgilerini listeleyin.
--select P.ProductName, P.UnitPrice, S.CompanyName from Products P join Suppliers S on S.SupplierID = P.SupplierID 
--where P.UnitPrice>50 order by P.UnitPrice

--9.Categories, Order Details ve Products tablolar�n� birle�tirerek, toplam tutar� (UnitPrice * Quantity) kategori baz�nda grupland�r�n 
--ve her kategori i�in toplam tutar� listeleyin. Sonu�lar� azalan s�rada s�ralay�n.

--select C.CategoryName, sum(OD.UnitPrice*OD.Quantity) as 'Toplam Tutar' from Categories C
--join Products P on C.CategoryID = P.CategoryID 
--join OrderDetails OD on OD.ProductID = P.ProductID group by C.CategoryName order by sum(OD.UnitPrice*OD.Quantity) desc

--10.Products ve Categories tablolar�n� birle�tirerek, kategori ba��na stokta olmayan (UnitsInStock = 0) �r�n say�s�n� listeleyin. 
--select C.CategoryName, COUNT(P.ProductID) as '�r�n say�s�' from Categories C 
--join Products P on C.CategoryID = P.CategoryID where P.UnitsInStock = 0 group by C.CategoryName

--11.Orders ve Customers tablolar�n� birle�tirerek, 1997 y�l�nda sipari� vermi� m��terilerin �ehirlerini listeleyin. 
--Her �ehir yaln�zca bir kez g�r�nmeli.

--12.Employees, Orders ve Order Details tablolar�n� birle�tirerek, her �al��an�n i�ledi�i sipari�lerde toplam sat�lan �r�n miktar�n� (SUM(Quantity)) hesaplay�n. 
--Sonu�lar� �al��an�n ad�na g�re s�ralay�n.

--13.Products ve Suppliers tablolar�n� birle�tirerek, her tedarik�inin sa�lad��� �r�nlerin ortalama fiyat�n� (AVG(UnitPrice)) hesaplay�n. 
--Ortalamaya g�re s�ralay�n ve ilk 5 tedarik�iyi listeleyin.

--14.Categories ve Products tablolar�n� birle�tirerek, kategori baz�nda toplam stok de�erini (SUM(UnitPrice * UnitsInStock)) hesaplay�n. 
--Toplam stok de�eri 10.000'i a�an kategorileri listeleyin.

--15.Customers ve Orders tablolar�n� birle�tirerek, her m��terinin sipari�lerinin toplam tutar�n� hesaplay�n ve en fazla sipari� veren 5 m��teriyi listeleyin.

--16.Orders, Order Details ve Employees tablolar�n� birle�tirerek, her �al��an�n toplam sipari� de�erini (SUM(UnitPrice * Quantity)) hesaplay�n 
--ve toplam de�erine g�re en �ok sat�� yapan ilk 3 �al��an� listeleyin

--17.Products, Categories ve Suppliers tablolar�n� birle�tirerek, kategori baz�nda her tedarik�inin sa�lad��� toplam �r�n say�s�n� (COUNT(ProductID)) listeleyin.

--18.Orders ve Order Details tablolar�n� birle�tirerek, sipari� verilen �r�nlerin ortalama fiyat�n� (AVG(UnitPrice)) hesaplay�n 
--ve sadece ortalaman�n �zerinde fiyatl� �r�nleri i�eren sipari�leri listeleyin.

--19.Products ve Categories tablolar�n� birle�tirerek, her kategorideki �r�nlerin maksimum fiyat�n� (MAX(UnitPrice)) ve minimum fiyat�n� (MIN(UnitPrice)) listeleyin. 
--Maksimum ve minimum fiyat aras�ndaki fark� da sonu�lara ekleyin.

--20.Orders, Order Details, Products ve Categories tablolar�n� birle�tirerek, kategori ba��na en �ok sipari� edilen �r�nleri (SUM(Quantity)) bulun ve 
--her kategori i�in en �ok sipari� edilen 1 �r�n� listeleyin.

--21.Fiyat� 40'�n �zerinde olan �r�nleri satan ve 1997�de bu �r�nlerden sipari� alan �irketleri bulun.










SELECT DISTINCT S.SupplierID, S.CompanyName 
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
JOIN Orders O ON O.OrderID = OD.OrderID
WHERE P.UnitPrice > 40 AND YEAR(O.OrderDate) = 1997
