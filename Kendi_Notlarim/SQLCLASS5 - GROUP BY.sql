--use AdventureWorks2017
-- Group by ve having Kullan�m�

-- Ka� adet meslek grubu oldu�unu bulan sorgu
--select JobTitle from HumanResources.Employee group by JobTitle
--select distinct JobTitle from HumanResources.Employee -- iki kodun ��kt�s� ayn�d�r.

-- Meslek gruplar�na g�re toplam tatil s�releri
--select JobTitle as 'Meslek Gruplar�', sum(VacationHours) as 'Toplam Tatil S�releri' from HumanResources.Employee group by JobTitle

-- Meslek gruplar�na g�re ort tatil s�resi
--select JobTitle as 'Meslek Gruplar�', avg(VacationHours) as 'Toplam Tatil S�releri' from HumanResources.Employee group by JobTitle
--select JobTitle as 'Meslek Gruplar�', Max(VacationHours) as 'En Y�ksek Tatil S�resi', min(VacationHours) as 'En D���k Tatil S�resi' from HumanResources.Employee group by JobTitle

--use CRM
--�ehirlere g�re ki�i say�s�
--select CITY, COUNT(CUSTOMERNAME) 'Ki�i Say�s�' from CUSTOMERS GROUP BY CITY 

-- �ehirlere g�re ki�i say�s� (en azdan ki�i say�s�ndan en �ok olana)
--select CITY, COUNT(CUSTOMERNAME) 'Ki�i Say�s�' from CUSTOMERS GROUP BY CITY order by count(CUSTOMERNAME)

-----------------------------------------------------------------------------------------------------------
--�RNEK SORULAR
--Use AdventureWorks2017
--1.HumanResources.Employee tablosundaki �al��anlar� i� unvanlar�na g�re grupland�rarak, her bir i� unvan�nda �al��an say�s�n� listeleyin.
--select JobTitle, count(JobTitle) as 'Ki�i Say�s�' from HumanResources.Employee group by JobTitle

--2.Sales.SalesOrderHeader tablosundaki her bir y�l i�in toplam sipari� tutar�n� ve sipari� say�s�n� bulun.
--select year(OrderDate) as 'Y�l', sum(TotalDue) as 'Toplam Sipari� Tutar�', count(SalesOrderID) as 'Toplam Sipari� Say�s�' from Sales.SalesOrderHeader group by year(OrderDate) order by year(OrderDate)

--3.Production.Product tablosundaki �r�nlerin ortalama fiyat�n� ve bu �r�nlerden 100 birimden fazla sto�u olanlar�n toplam say�s�n� hesaplay�n.
--select avg(Listprice) as 'ortalama fiyat' from Production.Product
--select count(*) from Production.Product where SafetyStockLevel>100

--4. Person.Address tablosunda her �ehirde ka� adet adres bulundu�unu listeleyin.
--select City, count(*) as 'adres' from Person.Address group by City -- count(*) null de�erleri de sayar. count(Addressline1) null de�erleri saymaz

--5.Person.Person tablosundaki ki�ilerin adlar�n�n uzunlu�unu hesaplayarak yeni bir s�tun olarak ekleyin.
--select FirstName + ' ' + isnull(MiddleName, '') + ' ' + LastName as '�sim soyisim', len(FirstName +isnull(MiddleName, '') + LastName) as 'karakter say�s�' from Person.Person order by FirstName

--6.Sales.SalesOrderDetail tablosundaki her bir �r�n i�in toplam sat�� miktar�n� bulun ve bu miktar� azalan s�rayla s�ralay�n.
--select SalesOrderID, sum(OrderQty) as 'toplam sat�� miktar�' from Sales.SalesOrderDetail group by SalesOrderID order by sum(OrderQty) desc

--7.Production.Product tablosundaki �r�nlerin fiyatlar�n� yuvarlayarak (a�a��, yukar� ve en yak�n) �� ayr� s�tunda g�sterin.
--select name as '�r�n Ad�',ListPrice as '�r�n Fiyat�', floor(ListPrice) as 'A�a�� Yuvarlama', ceiling(ListPrice) as 'Yukar� Yuvarlama', round(ListPrice,2) as 'En yak�n Yuvarlama' from Production.Product where ListPrice>0

--8.Sales.SalesOrderHeader tablosunda, teslim tarihi ile sipari� tarihi aras�ndaki g�n fark�n� hesaplay�n ve bu fark� listeleyin.
--select OrderDate as 'Sipari� Tarihi', DueDate as 'Teslim Tarihi', datediff(day, OrderDate,DueDate) as 'G�n Fark�' from Sales.SalesOrderHeader

--9.Production.Product tablosundaki her bir �r�n kategorisi i�in toplam �r�n say�s�n� listeleyin.
--select ProductNumber, count(*) as '�r�n say�s�' from Production.Product group by ProductNumber having [�r�n say�s�]>=1

--10.Person.Address tablosundaki adresleri �ehirlerine g�re grupland�r�n ve sadece 50�den fazla adres i�eren �ehirleri listeleyin.
--select City, count(*) as 'adres say�s�' from Person.Address group by City having count(*)>50 order by count(*)

--11.Production.Product tablosundaki �r�nleri isimlerinde "Mountain" ge�en �r�nler olarak filtreleyin ve fiyatlar�n� listeleyin.
--select Name, Listprice from Production.Product where name like '%mountain%'

--12.Sales.SalesOrderDetail tablosundaki �r�nlerin toplam sat�� miktarlar�n� grupland�rarak hesaplay�n ve toplam miktar� 1000�den fazla olan �r�nleri g�r�nt�leyin.
--select ProductID, sum(OrderQty) as 'toplam miktar�' from Sales.SalesOrderDetail group by ProductID having sum(OrderQty)>1000 order by [toplam miktar�]

--13.HumanResources.EmployeePayHistory tablosundaki maa�lar�n toplam�n�, en d���k maa�� ve en y�ksek maa�� hesaplay�n.
--select count(*) as 'toplam personel say�s�', sum(Rate) as 'toplam maa�', min(Rate) 'en d���k maa�', max(Rate) 'en y�ksek maa�' from HumanResources.EmployeePayHistory

--14.Sales.SalesOrderHeader tablosundaki sipari�lerin toplam tutarlar�n� hesaplay�n ve en y�ksek 5 sipari�i listeleyin.
--select sum(TotalDue) as 'toplam tutar' from Sales.SalesOrderHeader
--select top 5 * from Sales.SalesOrderHeader order by TotalDue desc

--15.Production.Product tablosundaki �r�nlerin fiyatlar�na %10 ekleyerek yeni fiyatlar�n� hesaplay�n ve yeni bir s�tun olarak ekleyin.
--select ListPrice, ListPrice*11/10 as 'yeni fiyat' from Production.Product where ListPrice>0 order by [yeni fiyat]

--16.Sales.SalesOrderHeader tablosundaki sipari�lerin toplam tutarlar�n� (TotalDue) hesaplay�n ve Sipari� tarihi (OrderDate) baz�nda her y�l i�in toplam sipari� tutar�n� hesaplay�n. Sonu�lar� y�la g�re s�ralay�n.
--select sum(TotalDue) as 'toplam tutar' from Sales.SalesOrderHeader 
--select year(OrderDate) as 'y�l', sum(TotalDue) as 'toplam sipari� tutar�' from Sales.SalesOrderHeader group by year(OrderDate) order by year(OrderDate)

--17.Sales.SalesOrderHeader tablosundaki sipari� tarihlerini y�l ve aya g�re grupland�rarak, her ay i�in toplam sipari� tutar�n� bulun.
--select Year(OrderDate) as 'y�l', Month(OrderDate) as 'ay', sum(TotalDue) as 'toplam sipari� tutar�' from Sales.SalesOrderHeader group by Year(OrderDate), Month(OrderDate) order by Year(OrderDate), Month(OrderDate) 

--18.Production.Product tablosundaki �r�nlerin maksimum, minimum ve ortalama fiyatlar�n� hesaplay�n.
--select max(ListPrice) as 'max fiyat', min(ListPrice), as 'min fiyat', avg(ListPrice) as 'ortalama fiyat' from Production.Product

--19.Sales.SalesOrderHeader tablosundaki toplam sipari� tutar� 20.000.000�un �zerinde olan y�llar� listeleyin.
--select year(OrderDate) as 'y�l', sum(TotalDue) as 'toplam sipari� tutar�' from Sales.SalesOrderHeader group by year(OrderDate) having sum(TotalDue)>20000000 order by year(OrderDate)

--20.HumanResources.Employee tablosundaki her bir i� unvan� i�in �al��anlar�n ortalama maa�lar�n� hesaplay�n ve ortalama maa�� 60.000�in �zerinde olan unvanlar� listeleyin.
--select JobTitle, avg(Salary) as 'ortalama maa�' from HumanResources.Employee group by JobTitle having avg(Salary)>60000 --salary s�tunu yok uydurdum. join kullanmayay�m diye

--21.Sales.SalesOrderDetail tablosundaki �r�nlerin toplam sat�� gelirini hesaplayarak en �ok gelir getiren 10 �r�n� listeleyin.

--22.Production.Product tablosundaki �r�nlerin isimlerinden ilk 10 karakteri ��kararak yeni bir s�tun olu�turun ve bu s�tunu listeleyin.

--23.Sales.SalesOrderHeader tablosundaki sipari�lerin toplam tutarlar�n� grupland�rarak, toplam tutar� 500.000�in �zerinde olan sipari�leri listeleyin.

--24.Person.StateProvince tablosundaki eyaletlere g�re toplam �ehir say�s�n� hesaplay�n ve s�ralay�n.

--25.Sales.SalesOrderHeader tablosundaki sipari�leri m��terilere g�re grupland�rarak, her m��teri i�in toplam sipari� tutar�n� ve sipari� say�s�n� hesaplay�n.

--26.Production.Product tablosundaki �r�nleri fiyatlar�na g�re artan �ekilde s�ralay�n ve sadece ilk 10 �r�n� listeleyin.

--27.Sales.SalesOrderDetail tablosundaki �r�nlerin toplam sat�� gelirlerini hesaplayarak toplam gelir miktar�n� g�r�nt�leyin.

--28.HumanResources.Employee tablosundaki �al��anlar�n i� unvanlar�na g�re grupland�r�larak toplam �al��an say�lar�n� ve toplam maa�lar�n� listeleyin.

--29.Production.Product tablosundaki �r�nlerin fiyatlar�n� 50 ile 200 aras�nda olanlar� listeleyin ve fiyatlar�na g�re s�ralay�n.

--30.Person.Person tablosundaki ki�ilerin adlar�n�, soyadlar�n� ve bu iki de�eri birle�tirerek olu�turulan tam adlar�n� bir s�tunda listeleyin.





















