------------SUBQUERY(ALT SORGULAR)--------------------
--Alt sorgular (subqueries), bir SQL sorgusu içinde baþka bir sorgu çalýþtýrmak için kullanýlýr.

--use Northwinds
--1.Products tablosunda en yüksek fiyatlý ürünün adýný bulun.
--select ProductName from Products where UnitPrice = (select max(UnitPrice) from Products)

--2. Products tablosunda ortalama fiyatýn üzerindeki ürünleri listeleyin.
--select ProductName, UnitPrice from Products where UnitPrice> (select avg(UnitPrice) from Products) order by UnitPrice

--3.En çok sipariþ veren müþteriyi bulun.
--select top 1 CustomerID, Count(CustomerID) as 'sipariþ miktarý'  from Orders group by CustomerID order by Count(CustomerID) desc

--4.Sadece "UK" ülkesinden tedarikçilerden alýnan ürünlerin adlarýný bulun.
--select ProductName from Products where SupplierID in (select SupplierID from Suppliers where Country = 'UK')

--5.Customers tablosunda birden fazla sipariþ verilmiþ müþteri ID'lerini listeleyin.
--select CustomerID from Customers where CustomerID in (select CustomerID from Orders group by CustomerID having count(CustomerID)>1)

--6.Products tablosunda hiç sipariþ edilmemiþ (orderdetails) ürünleri listeleyin.

--7.Tedarikçisi "Exotic Liquids" olan ürünlerin adlarýný listeleyin.

--8.Products tablosunda en düþük fiyatlý ürünün adýný ve fiyatýný bulun.

--9.Kategori adý "Condiments" olan ürünleri listeleyin.

--10.En az 5 farklý kategoriye ürün saðlayan tedarikçileri listeleyin.

--11.Hiç sipariþ verilmemiþ müþteri ID'lerini listeleyin. (customers,orders)

--12.1996 yýlýnda sipariþ verilen ve toplam miktarý 50'den fazla olan ürünleri listeleyin.(products,orderdetails)

--13.Ortalama fiyatýn üzerinde birim fiyatý olan ve stokta en az 50 birim bulunan ürünlerin adlarýný listeleyin. (products

--14.1996 ve 1997 yýllarýnda verilen sipariþlerin toplam maliyetini (Freight) yýllara göre gruplayarak hesaplayýn.

--15.Her kategorideki ürünlerin ortalama fiyatýný hesaplayýn ve kategori adlarýyla birlikte sýralayýn.

--16.Her tedarikçinin saðladýðý toplam ürün sayýsýný listeleyin ve bu listeyi saðladýðý ürün sayýsýna göre azalan sýrayla gösterin.

--17.En az 10 farklý ürünü saðlayan tedarikçilerin adlarýný ve saðladýklarý toplam ürün sayýsýný listeleyin.

--18.Fiyatý ortalamanýn üzerinde olan ürünlerin kategori adýný, ürün adýný ve fiyatýný listeleyin.

--use AdventureWorks2017
--19.Her departmanda çalýþan toplam kiþi sayýsýný listeleyin ve çalýþan sayýsýna göre azalan sýrayla sýralayýn.
--HumanResources.Employee
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--20.En fazla sipariþ verilen ilk 5 ürünün adlarýný ve toplam satýþ miktarlarýný bulun.
--Sales.SalesOrderDetail
--Production.Product

--21.En az bir yýl süreyle bir departmanda çalýþmýþ olan çalýþanlarýn adlarýný ve çalýþtýklarý departmanlarý listeleyin.
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department
--Person.Person

--22.Sipariþ tarihi 2013 yýlý olan sipariþlerin toplam maliyetini listeleyin.(Sales.SalesOrderHeader)

--23.2012 yýlýnda verilen sipariþlerde satýlan toplam ürün miktarýný hesaplayýn.
--Sales.SalesOrderHeader
--Sales.SalesOrderDetail

--24.Her çalýþanýn maaþ geçmiþindeki en yüksek maaþýný ve en düþük maaþýný listeleyin. (HumanResources.EmployeePayHistory)

--25.Tüm çalýþanlarýn toplam maaþ miktarýný departmanlara göre gruplandýrýn.
--HumanResources.EmployeePayHistory
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--26.Her departmandaki çalýþanlarýn toplam maaþýný bulun ve toplam maaþý 300.000'in üzerinde olan departmanlarý listeleyin.
--HumanResources.EmployeePayHistory
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--27.Tedarikçilerin saðladýðý ürünlerin toplam sayýsýný bulun ve yalnýzca 50'den fazla ürün saðlayan tedarikçileri listeleyin.
--Purchasing.Vendor
--Purchasing.ProductVendor

--28.Her kategorideki ürünlerin ortalama fiyatýný hesaplayýn ve fiyatý 500'ün üzerinde olan kategorileri listeleyin.
--Production.Product
--Production.ProductSubcategory
--Production.ProductCategory

--29.Hiç sipariþ verilmemiþ ürünlerin adlarýný ve fiyatlarýný listeleyin.
--Production.Product
--Sales.SalesOrderDetail

--30.Her yýl verilen sipariþlerdeki toplam gelirleri hesaplayýn ve yalnýzca 2012 ve 2013 yýllarýný listeleyin. (Sales.SalesOrderHeader)



















