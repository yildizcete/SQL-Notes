--use AdventureWorks2017
-- Group by ve having Kullanýmý

-- Kaç adet meslek grubu olduðunu bulan sorgu
--select JobTitle from HumanResources.Employee group by JobTitle
--select distinct JobTitle from HumanResources.Employee -- iki kodun çýktýsý aynýdýr.

-- Meslek gruplarýna göre toplam tatil süreleri
--select JobTitle as 'Meslek Gruplarý', sum(VacationHours) as 'Toplam Tatil Süreleri' from HumanResources.Employee group by JobTitle

-- Meslek gruplarýna göre ort tatil süresi
--select JobTitle as 'Meslek Gruplarý', avg(VacationHours) as 'Toplam Tatil Süreleri' from HumanResources.Employee group by JobTitle
--select JobTitle as 'Meslek Gruplarý', Max(VacationHours) as 'En Yüksek Tatil Süresi', min(VacationHours) as 'En Düþük Tatil Süresi' from HumanResources.Employee group by JobTitle

--use CRM
--Þehirlere göre kiþi sayýsý
--select CITY, COUNT(CUSTOMERNAME) 'Kiþi Sayýsý' from CUSTOMERS GROUP BY CITY 

-- Þehirlere göre kiþi sayýsý (en azdan kiþi sayýsýndan en çok olana)
--select CITY, COUNT(CUSTOMERNAME) 'Kiþi Sayýsý' from CUSTOMERS GROUP BY CITY order by count(CUSTOMERNAME)

-----------------------------------------------------------------------------------------------------------
--ÖRNEK SORULAR
--Use AdventureWorks2017
--1.HumanResources.Employee tablosundaki çalýþanlarý iþ unvanlarýna göre gruplandýrarak, her bir iþ unvanýnda çalýþan sayýsýný listeleyin.
--select JobTitle, count(JobTitle) as 'Kiþi Sayýsý' from HumanResources.Employee group by JobTitle

--2.Sales.SalesOrderHeader tablosundaki her bir yýl için toplam sipariþ tutarýný ve sipariþ sayýsýný bulun.
--select year(OrderDate) as 'Yýl', sum(TotalDue) as 'Toplam Sipariþ Tutarý', count(SalesOrderID) as 'Toplam Sipariþ Sayýsý' from Sales.SalesOrderHeader group by year(OrderDate) order by year(OrderDate)

--3.Production.Product tablosundaki ürünlerin ortalama fiyatýný ve bu ürünlerden 100 birimden fazla stoðu olanlarýn toplam sayýsýný hesaplayýn.
--select avg(Listprice) as 'ortalama fiyat' from Production.Product
--select count(*) from Production.Product where SafetyStockLevel>100

--4. Person.Address tablosunda her þehirde kaç adet adres bulunduðunu listeleyin.
--select City, count(*) as 'adres' from Person.Address group by City -- count(*) null deðerleri de sayar. count(Addressline1) null deðerleri saymaz

--5.Person.Person tablosundaki kiþilerin adlarýnýn uzunluðunu hesaplayarak yeni bir sütun olarak ekleyin.
--select FirstName + ' ' + isnull(MiddleName, '') + ' ' + LastName as 'Ýsim soyisim', len(FirstName +isnull(MiddleName, '') + LastName) as 'karakter sayýsý' from Person.Person order by FirstName

--6.Sales.SalesOrderDetail tablosundaki her bir ürün için toplam satýþ miktarýný bulun ve bu miktarý azalan sýrayla sýralayýn.
--select SalesOrderID, sum(OrderQty) as 'toplam satýþ miktarý' from Sales.SalesOrderDetail group by SalesOrderID order by sum(OrderQty) desc

--7.Production.Product tablosundaki ürünlerin fiyatlarýný yuvarlayarak (aþaðý, yukarý ve en yakýn) üç ayrý sütunda gösterin.
--select name as 'Ürün Adý',ListPrice as 'Ürün Fiyatý', floor(ListPrice) as 'Aþaðý Yuvarlama', ceiling(ListPrice) as 'Yukarý Yuvarlama', round(ListPrice,2) as 'En yakýn Yuvarlama' from Production.Product where ListPrice>0

--8.Sales.SalesOrderHeader tablosunda, teslim tarihi ile sipariþ tarihi arasýndaki gün farkýný hesaplayýn ve bu farký listeleyin.
--select OrderDate as 'Sipariþ Tarihi', DueDate as 'Teslim Tarihi', datediff(day, OrderDate,DueDate) as 'Gün Farký' from Sales.SalesOrderHeader

--9.Production.Product tablosundaki her bir ürün kategorisi için toplam ürün sayýsýný listeleyin.
--select ProductNumber, count(*) as 'Ürün sayýsý' from Production.Product group by ProductNumber having [Ürün sayýsý]>=1

--10.Person.Address tablosundaki adresleri þehirlerine göre gruplandýrýn ve sadece 50’den fazla adres içeren þehirleri listeleyin.
--select City, count(*) as 'adres sayýsý' from Person.Address group by City having count(*)>50 order by count(*)

--11.Production.Product tablosundaki ürünleri isimlerinde "Mountain" geçen ürünler olarak filtreleyin ve fiyatlarýný listeleyin.
--select Name, Listprice from Production.Product where name like '%mountain%'

--12.Sales.SalesOrderDetail tablosundaki ürünlerin toplam satýþ miktarlarýný gruplandýrarak hesaplayýn ve toplam miktarý 1000’den fazla olan ürünleri görüntüleyin.
--select ProductID, sum(OrderQty) as 'toplam miktarý' from Sales.SalesOrderDetail group by ProductID having sum(OrderQty)>1000 order by [toplam miktarý]

--13.HumanResources.EmployeePayHistory tablosundaki maaþlarýn toplamýný, en düþük maaþý ve en yüksek maaþý hesaplayýn.
--select count(*) as 'toplam personel sayýsý', sum(Rate) as 'toplam maaþ', min(Rate) 'en düþük maaþ', max(Rate) 'en yüksek maaþ' from HumanResources.EmployeePayHistory

--14.Sales.SalesOrderHeader tablosundaki sipariþlerin toplam tutarlarýný hesaplayýn ve en yüksek 5 sipariþi listeleyin.
--select sum(TotalDue) as 'toplam tutar' from Sales.SalesOrderHeader
--select top 5 * from Sales.SalesOrderHeader order by TotalDue desc

--15.Production.Product tablosundaki ürünlerin fiyatlarýna %10 ekleyerek yeni fiyatlarýný hesaplayýn ve yeni bir sütun olarak ekleyin.
--select ListPrice, ListPrice*11/10 as 'yeni fiyat' from Production.Product where ListPrice>0 order by [yeni fiyat]

--16.Sales.SalesOrderHeader tablosundaki sipariþlerin toplam tutarlarýný (TotalDue) hesaplayýn ve Sipariþ tarihi (OrderDate) bazýnda her yýl için toplam sipariþ tutarýný hesaplayýn. Sonuçlarý yýla göre sýralayýn.
--select sum(TotalDue) as 'toplam tutar' from Sales.SalesOrderHeader 
--select year(OrderDate) as 'yýl', sum(TotalDue) as 'toplam sipariþ tutarý' from Sales.SalesOrderHeader group by year(OrderDate) order by year(OrderDate)

--17.Sales.SalesOrderHeader tablosundaki sipariþ tarihlerini yýl ve aya göre gruplandýrarak, her ay için toplam sipariþ tutarýný bulun.
--select Year(OrderDate) as 'yýl', Month(OrderDate) as 'ay', sum(TotalDue) as 'toplam sipariþ tutarý' from Sales.SalesOrderHeader group by Year(OrderDate), Month(OrderDate) order by Year(OrderDate), Month(OrderDate) 

--18.Production.Product tablosundaki ürünlerin maksimum, minimum ve ortalama fiyatlarýný hesaplayýn.
--select max(ListPrice) as 'max fiyat', min(ListPrice), as 'min fiyat', avg(ListPrice) as 'ortalama fiyat' from Production.Product

--19.Sales.SalesOrderHeader tablosundaki toplam sipariþ tutarý 20.000.000’un üzerinde olan yýllarý listeleyin.
--select year(OrderDate) as 'yýl', sum(TotalDue) as 'toplam sipariþ tutarý' from Sales.SalesOrderHeader group by year(OrderDate) having sum(TotalDue)>20000000 order by year(OrderDate)

--20.HumanResources.Employee tablosundaki her bir iþ unvaný için çalýþanlarýn ortalama maaþlarýný hesaplayýn ve ortalama maaþý 60.000’in üzerinde olan unvanlarý listeleyin.
--select JobTitle, avg(Salary) as 'ortalama maaþ' from HumanResources.Employee group by JobTitle having avg(Salary)>60000 --salary sütunu yok uydurdum. join kullanmayayým diye

--21.Sales.SalesOrderDetail tablosundaki ürünlerin toplam satýþ gelirini hesaplayarak en çok gelir getiren 10 ürünü listeleyin.

--22.Production.Product tablosundaki ürünlerin isimlerinden ilk 10 karakteri çýkararak yeni bir sütun oluþturun ve bu sütunu listeleyin.

--23.Sales.SalesOrderHeader tablosundaki sipariþlerin toplam tutarlarýný gruplandýrarak, toplam tutarý 500.000’in üzerinde olan sipariþleri listeleyin.

--24.Person.StateProvince tablosundaki eyaletlere göre toplam þehir sayýsýný hesaplayýn ve sýralayýn.

--25.Sales.SalesOrderHeader tablosundaki sipariþleri müþterilere göre gruplandýrarak, her müþteri için toplam sipariþ tutarýný ve sipariþ sayýsýný hesaplayýn.

--26.Production.Product tablosundaki ürünleri fiyatlarýna göre artan þekilde sýralayýn ve sadece ilk 10 ürünü listeleyin.

--27.Sales.SalesOrderDetail tablosundaki ürünlerin toplam satýþ gelirlerini hesaplayarak toplam gelir miktarýný görüntüleyin.

--28.HumanResources.Employee tablosundaki çalýþanlarýn iþ unvanlarýna göre gruplandýrýlarak toplam çalýþan sayýlarýný ve toplam maaþlarýný listeleyin.

--29.Production.Product tablosundaki ürünlerin fiyatlarýný 50 ile 200 arasýnda olanlarý listeleyin ve fiyatlarýna göre sýralayýn.

--30.Person.Person tablosundaki kiþilerin adlarýný, soyadlarýný ve bu iki deðeri birleþtirerek oluþturulan tam adlarýný bir sütunda listeleyin.





















