------------SUBQUERY(ALT SORGULAR)--------------------
--Alt sorgular (subqueries), bir SQL sorgusu i�inde ba�ka bir sorgu �al��t�rmak i�in kullan�l�r.

--use Northwinds
--1.Products tablosunda en y�ksek fiyatl� �r�n�n ad�n� bulun.
--select ProductName from Products where UnitPrice = (select max(UnitPrice) from Products)

--2. Products tablosunda ortalama fiyat�n �zerindeki �r�nleri listeleyin.
--select ProductName, UnitPrice from Products where UnitPrice> (select avg(UnitPrice) from Products) order by UnitPrice

--3.En �ok sipari� veren m��teriyi bulun.
--select top 1 CustomerID, Count(CustomerID) as 'sipari� miktar�'  from Orders group by CustomerID order by Count(CustomerID) desc

--4.Sadece "UK" �lkesinden tedarik�ilerden al�nan �r�nlerin adlar�n� bulun.
--select ProductName from Products where SupplierID in (select SupplierID from Suppliers where Country = 'UK')

--5.Customers tablosunda birden fazla sipari� verilmi� m��teri ID'lerini listeleyin.
--select CustomerID from Customers where CustomerID in (select CustomerID from Orders group by CustomerID having count(CustomerID)>1)

--6.Products tablosunda hi� sipari� edilmemi� (orderdetails) �r�nleri listeleyin.

--7.Tedarik�isi "Exotic Liquids" olan �r�nlerin adlar�n� listeleyin.

--8.Products tablosunda en d���k fiyatl� �r�n�n ad�n� ve fiyat�n� bulun.

--9.Kategori ad� "Condiments" olan �r�nleri listeleyin.

--10.En az 5 farkl� kategoriye �r�n sa�layan tedarik�ileri listeleyin.

--11.Hi� sipari� verilmemi� m��teri ID'lerini listeleyin. (customers,orders)

--12.1996 y�l�nda sipari� verilen ve toplam miktar� 50'den fazla olan �r�nleri listeleyin.(products,orderdetails)

--13.Ortalama fiyat�n �zerinde birim fiyat� olan ve stokta en az 50 birim bulunan �r�nlerin adlar�n� listeleyin. (products

--14.1996 ve 1997 y�llar�nda verilen sipari�lerin toplam maliyetini (Freight) y�llara g�re gruplayarak hesaplay�n.

--15.Her kategorideki �r�nlerin ortalama fiyat�n� hesaplay�n ve kategori adlar�yla birlikte s�ralay�n.

--16.Her tedarik�inin sa�lad��� toplam �r�n say�s�n� listeleyin ve bu listeyi sa�lad��� �r�n say�s�na g�re azalan s�rayla g�sterin.

--17.En az 10 farkl� �r�n� sa�layan tedarik�ilerin adlar�n� ve sa�lad�klar� toplam �r�n say�s�n� listeleyin.

--18.Fiyat� ortalaman�n �zerinde olan �r�nlerin kategori ad�n�, �r�n ad�n� ve fiyat�n� listeleyin.

--use AdventureWorks2017
--19.Her departmanda �al��an toplam ki�i say�s�n� listeleyin ve �al��an say�s�na g�re azalan s�rayla s�ralay�n.
--HumanResources.Employee
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--20.En fazla sipari� verilen ilk 5 �r�n�n adlar�n� ve toplam sat�� miktarlar�n� bulun.
--Sales.SalesOrderDetail
--Production.Product

--21.En az bir y�l s�reyle bir departmanda �al��m�� olan �al��anlar�n adlar�n� ve �al��t�klar� departmanlar� listeleyin.
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department
--Person.Person

--22.Sipari� tarihi 2013 y�l� olan sipari�lerin toplam maliyetini listeleyin.(Sales.SalesOrderHeader)

--23.2012 y�l�nda verilen sipari�lerde sat�lan toplam �r�n miktar�n� hesaplay�n.
--Sales.SalesOrderHeader
--Sales.SalesOrderDetail

--24.Her �al��an�n maa� ge�mi�indeki en y�ksek maa��n� ve en d���k maa��n� listeleyin. (HumanResources.EmployeePayHistory)

--25.T�m �al��anlar�n toplam maa� miktar�n� departmanlara g�re grupland�r�n.
--HumanResources.EmployeePayHistory
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--26.Her departmandaki �al��anlar�n toplam maa��n� bulun ve toplam maa�� 300.000'in �zerinde olan departmanlar� listeleyin.
--HumanResources.EmployeePayHistory
--HumanResources.EmployeeDepartmentHistory
--HumanResources.Department

--27.Tedarik�ilerin sa�lad��� �r�nlerin toplam say�s�n� bulun ve yaln�zca 50'den fazla �r�n sa�layan tedarik�ileri listeleyin.
--Purchasing.Vendor
--Purchasing.ProductVendor

--28.Her kategorideki �r�nlerin ortalama fiyat�n� hesaplay�n ve fiyat� 500'�n �zerinde olan kategorileri listeleyin.
--Production.Product
--Production.ProductSubcategory
--Production.ProductCategory

--29.Hi� sipari� verilmemi� �r�nlerin adlar�n� ve fiyatlar�n� listeleyin.
--Production.Product
--Sales.SalesOrderDetail

--30.Her y�l verilen sipari�lerdeki toplam gelirleri hesaplay�n ve yaln�zca 2012 ve 2013 y�llar�n� listeleyin. (Sales.SalesOrderHeader)



















