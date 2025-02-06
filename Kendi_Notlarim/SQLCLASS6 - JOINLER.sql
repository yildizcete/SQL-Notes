-- JOÝN ÝÞLEMLERÝ 
hiçbir ortak bir þeye baðlamadan yazma.
select Employees.FirstName,Employees.LastName, Customers.Phone from Employees, Customers order by Employees.FirstName desc



-- Where ile join kombinasyonlarý

--1.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolarýný, SalesOrderID sütunu üzerinden birleþtirerek,
--her satýþ sipariþi için SalesOrderID, OrderDate ve satýlan ürünlerin ProductID bilgilerini listeleyin.

--select SalesOrderHeader.SalesOrderID, Sales.SalesOrderHeader.OrderDate,SalesOrderDetail.OrderQty 
--from Sales.SalesOrderHeader,Sales.SalesOrderDetail 
--where  Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID

--takma ad kullandým.
--select SH.SalesOrderID,SH.OrderDate,SD.OrderQty 
--from Sales.SalesOrderHeader SH,Sales.SalesOrderDetail SD
--where  SH.SalesOrderID = SD.SalesOrderID

--2.Person.Person ve Sales.SalesPerson tablolarýný kullanarak
--müþteri bilgilerini ve her müþterinin bonus puanlarýný listeleyin.

--select PP.FirstName, PP.Lastname, SSP.Bonus
--from Person.Person PP, Sales.SalesPerson SSP
--where PP.BusinessEntityID = SSP.BusinessEntityID

-- INNER JOIN ile birleþtirme kombinasyonlarý
--where ile yapýlan join iþlemeri inner joinle kolaylýkla yapýlýr. where biraz eski usul.

--1.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolarýný, SalesOrderID sütunu üzerinden birleþtirerek, 
--her sipariþin ID'si, sipariþ tarihi ve satýlan ürünlerin adet bilgilerini listeleyin.

--select SH.SalesOrderID, SH.OrderDate, SD.OrderQty 
--from Sales.SalesOrderHeader SH
--inner join Sales.SalesOrderDetail SD
--on SH.SalesOrderID = SD.SalesOrderID

--2.Person.Person ve Sales.SalesPersonQuotaHistory tablolarýndan
--müþteri isimlerini ve her müþterinin satýþ kotasýný listeleyin.

--select PP.FirstName, PP.LastName, SH.SalesQuota
--from Person.Person PP inner join Sales.SalesPersonQuotaHistory SH
--on PP.BusinessEntityID = SH.BusinessEntityID

-- LEFT ve RIGHT JOIN ile birleþtirme kombinasyonlarý

--1.Person.Person ve Sales.SalesPerson tablolarýný BusinessEntityID sütunu üzerinden birleþtirerek,
--tüm çalýþanlarý ve her çalýþanýn satýþ performansýný listeleyin.
--Satýþ performansý olmayan çalýþanlar için satýþ bilgisi boþ görünsün.

--select PP.BusinessEntityID, PP.FirstName, PP.LastName, SSp.SalesQuota 
--from Person.Person PP left join Sales.SalesPerson SSP 
--on PP.BusinessEntityID = SSP.BusinessEntityID

--2.Production.Product ve Sales.SalesOrderDetail tablolarýný ProductID sütunu üzerinden birleþtirerek,
--tüm ürünlerin satýþ bilgilerini listeleyin. 
--Satýþý olmayan ürünlerde satýþ bilgileri boþ görünsün.

--select PP.*, SD.OrderQty, SD.LineTotal from Production.Product PP
--left join Sales.SalesOrderDetail SD
--on PP.ProductID = SD.ProductID

--3.Sales.SalesOrderHeader ve Sales.SalesOrderDetail tablolarýný SalesOrderID sütunu üzerinden birleþtirerek,
--tüm sipariþ baþlýklarýný ve varsa bu sipariþlere ait detay bilgilerini listeleyin.
--Detay bilgisi olmayan sipariþlerde detay sütunlarý boþ (NULL) görünsün

--select SD.SalesOrderID, SD.ProductID, SD.OrderQty, SH.OrderDate
--from Sales.SalesOrderDetail SD
--right join Sales.SalesOrderHeader SH
--on SD.SalesOrderID = SH.SalesOrderID

--FULL JOIN Kombinasyonlarý

--1.Production.Product ve Sales.SalesOrderDetail tablolarýný ProductID sütunu üzerinden birleþtirerek,
--hem ürün bilgilerini hem de satýþ bilgilerini listeleyin.
--Satýlmamýþ ürünler ile satýþta olmayan ürün bilgileri de görünsün.

--select PP.ProductID, PP.Name, PP.ProductNumber, SD.OrderQty, SD.LineTotal from Production.Product PP full join Sales.SalesOrderDetail SD
--on PP.ProductID = SD.ProductID 
 
-- Cross Join kartezyen çarpým yapar sol tabloyu sað tablo ile çarpar

------------------------------------------------------------------------------------
-----------------------------ÖRNEK SORULAR------------------------------------------
 
--1.Orders ve Customers tablolarýný birleþtirerek
--her sipariþin OrderID, müþterinin ContactName ve CompanyName bilgilerini listeleyin.
--select O.OrderID, C.ContactName, C.CompanyName from Orders O join Customers C
--on C.CustomerID = O.CustomerID

--2.Products ve Categories tablolarýný birleþtirerek 
--tüm ürünleri listeleyin. Kategorisi olmayan ürünleri de dahil edin.
--select P.ProductID, P.ProductName,C.CategoryName from Products P left join Categories C
--on P.CategoryID = C.CategoryID

--3.Products ve Suppliers tablolarýný birleþtirerek, her tedarikçinin saðladýðý ürünleri listeleyin. 
--Hiç ürünü olmayan tedarikçileri de dahil edin.
--select S.CompanyName, P.ProductName from Suppliers S left join Products P
--on P.SupplierID = S.SupplierID

--***4.Orders, Order Details ve Products tablolarýný birleþtirerek, 1998 yýlýnda verilen sipariþlerde en fazla sipariþ edilen (Quantity) 3 ürünü listeleyin.
--select top 3 P.ProductName as 'Ürün adý', sum(OD.Quantity) as 'Toplam sipariþ'from Products P 
--join OrderDetails OD on P.ProductID = OD.ProductID 
--join Orders O on O.OrderID = OD.OrderID where year(O.OrderDate)=1998 group by P.ProductName order by sum(OD.Quantity) desc

--5.Products ve Categories tablolarýný birleþtirerek, kategori bazýnda toplam ürün sayýsýný listeleyin.
--Sadece 10'dan fazla ürün içeren kategorileri gösterin.

--select C.CategoryName, count(ProductName) as 'Toplam ürün sayýsý' from Products P join Categories C on C.CategoryID = P.CategoryID
--group by C.CategoryName having count(ProductName)>=10 order by [Toplam ürün sayýsý]

--6.Orders, Order Details ve Products tablolarýný birleþtirerek her sipariþ için þu bilgileri listeleyin:
--Sipariþ ID (OrderID),
--Ürün adý (ProductName),
--Satýþ fiyatý (UnitPrice),
--Sipariþ edilen miktar (Quantity),
--Toplam tutar (UnitPrice * Quantity).
--select OD.OrderID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.UnitPrice*OD.Quantity as 'toplam tutar' from Products P 
--join OrderDetails OD on P.ProductID = OD.ProductID 
--join Orders O on O.OrderID = OD.OrderID

--7.Orders ve Customers tablolarýný birleþtirerek, her müþterinin verdiði sipariþlerin 
--toplam sayýsýný listeleyin. Sonuçlarý müþterinin adýna göre sýralayýn.
--select C.ContactName as 'Müþteri Adý', count(O.CustomerID) as 'Toplam Sipariþ Sayýsý' from Customers C 
--join Orders O on O.CustomerID = C.CustomerID group by C.ContactName order by C.ContactName

--8.Products ve Suppliers tablolarýný birleþtirerek, UnitPrice deðeri 50'nin üzerinde olan ürünlerin ProductName, UnitPrice ve tedarikçi adý (CompanyName) bilgilerini listeleyin.
--select P.ProductName, P.UnitPrice, S.CompanyName from Products P join Suppliers S on S.SupplierID = P.SupplierID 
--where P.UnitPrice>50 order by P.UnitPrice

--9.Categories, Order Details ve Products tablolarýný birleþtirerek, toplam tutarý (UnitPrice * Quantity) kategori bazýnda gruplandýrýn 
--ve her kategori için toplam tutarý listeleyin. Sonuçlarý azalan sýrada sýralayýn.

--select C.CategoryName, sum(OD.UnitPrice*OD.Quantity) as 'Toplam Tutar' from Categories C
--join Products P on C.CategoryID = P.CategoryID 
--join OrderDetails OD on OD.ProductID = P.ProductID group by C.CategoryName order by sum(OD.UnitPrice*OD.Quantity) desc

--10.Products ve Categories tablolarýný birleþtirerek, kategori baþýna stokta olmayan (UnitsInStock = 0) ürün sayýsýný listeleyin. 
--select C.CategoryName, COUNT(P.ProductID) as 'ürün sayýsý' from Categories C 
--join Products P on C.CategoryID = P.CategoryID where P.UnitsInStock = 0 group by C.CategoryName

--11.Orders ve Customers tablolarýný birleþtirerek, 1997 yýlýnda sipariþ vermiþ müþterilerin þehirlerini listeleyin. 
--Her þehir yalnýzca bir kez görünmeli.

--12.Employees, Orders ve Order Details tablolarýný birleþtirerek, her çalýþanýn iþlediði sipariþlerde toplam satýlan ürün miktarýný (SUM(Quantity)) hesaplayýn. 
--Sonuçlarý çalýþanýn adýna göre sýralayýn.

--13.Products ve Suppliers tablolarýný birleþtirerek, her tedarikçinin saðladýðý ürünlerin ortalama fiyatýný (AVG(UnitPrice)) hesaplayýn. 
--Ortalamaya göre sýralayýn ve ilk 5 tedarikçiyi listeleyin.

--14.Categories ve Products tablolarýný birleþtirerek, kategori bazýnda toplam stok deðerini (SUM(UnitPrice * UnitsInStock)) hesaplayýn. 
--Toplam stok deðeri 10.000'i aþan kategorileri listeleyin.

--15.Customers ve Orders tablolarýný birleþtirerek, her müþterinin sipariþlerinin toplam tutarýný hesaplayýn ve en fazla sipariþ veren 5 müþteriyi listeleyin.

--16.Orders, Order Details ve Employees tablolarýný birleþtirerek, her çalýþanýn toplam sipariþ deðerini (SUM(UnitPrice * Quantity)) hesaplayýn 
--ve toplam deðerine göre en çok satýþ yapan ilk 3 çalýþaný listeleyin

--17.Products, Categories ve Suppliers tablolarýný birleþtirerek, kategori bazýnda her tedarikçinin saðladýðý toplam ürün sayýsýný (COUNT(ProductID)) listeleyin.

--18.Orders ve Order Details tablolarýný birleþtirerek, sipariþ verilen ürünlerin ortalama fiyatýný (AVG(UnitPrice)) hesaplayýn 
--ve sadece ortalamanýn üzerinde fiyatlý ürünleri içeren sipariþleri listeleyin.

--19.Products ve Categories tablolarýný birleþtirerek, her kategorideki ürünlerin maksimum fiyatýný (MAX(UnitPrice)) ve minimum fiyatýný (MIN(UnitPrice)) listeleyin. 
--Maksimum ve minimum fiyat arasýndaki farký da sonuçlara ekleyin.

--20.Orders, Order Details, Products ve Categories tablolarýný birleþtirerek, kategori baþýna en çok sipariþ edilen ürünleri (SUM(Quantity)) bulun ve 
--her kategori için en çok sipariþ edilen 1 ürünü listeleyin.

--21.Fiyatý 40'ýn üzerinde olan ürünleri satan ve 1997’de bu ürünlerden sipariþ alan þirketleri bulun.










SELECT DISTINCT S.SupplierID, S.CompanyName 
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
JOIN Orders O ON O.OrderID = OD.OrderID
WHERE P.UnitPrice > 40 AND YEAR(O.OrderDate) = 1997
