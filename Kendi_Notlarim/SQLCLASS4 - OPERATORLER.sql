-- use Northwinds

--select 20+4 as 'toplama'
--select 20-4 as '��kartma' -- iki sorguyu farkl� tablolarda sonucu bast�r�r.
-- ayn� tabloda istersek;
--select 20+4 as 'toplama', 20-4 as '��kartma', 20*4 as '�arpma', 20/4 as 'b�lme' -- ondal�kl� ��karsa tam sonucu bast�r�r.

--select ContactTitle + ' - ' + ContactName as 'Position' from Customers -- iki s�tunu birle�tirdi.

--select SUBSTRING(CompanyName,1,6) as '�irketlerin �lk 6 Harfi' from Customers
--select SUBSTRING('Merhaba Y�ld�z', 9,14) as '�smim ehehe'
--select left(CompanyName,5) as '�lk 5 Harf' from Customers -- soldan ilk n karakteri al�r.
--select right(CompanyName,8) as 'Son 8 Harf' from Customers -- sa�dandan son n karakteri al�r.

--select UPPER(ContactTitle) as 'B�y�k Harf', LOWER(CompanyName) as 'K���k Harf' from Customers 
--select UPPER(ContactTitle) as 'B�y�k Harf', LOWER(CompanyName) as 'K���k Harf',* from Customers -- t�m tabloyu da yazd�rd�m.

--select LEN('Merhaba Y�ld�z') as 'Uzunluk' -- LEN ka� karakterli bir say� oldu�unu s�yler.
--select ContactTitle, LEN(ContactTitle) as 'Karakter Say�s�' from Customers -- Bo�lu�u da say�yor
--select ContactTitle, LEN(ContactTitle) as 'Karakter Say�s�' from Customers where LEN(ContactTitle)>=10 order by ContactTitle

--select REPLACE('Merhaba D�nya', 'D�nya', 'Evren') AS 'Yeni Metin'
--select REPLACE(ContactName, 'Maria Anders', 'Maria Can�m') as 'Yeni �sim' from Customers -- update yapm�yor sadece sorguda �yle g�steriyor.

--select abs(-10) as 'mutlak de�er'
--select abs(SinavNeti) as 'S�nav Notlar� mutlak de�erli' from SinavBilgileri

--use AdventureWorks2017

--select ceiling(12.01) as 'yuvarla' - Ondal�k say�lar� bir �ste yuvarlar
--select ceiling(LineTotal) as 'Tam k�s�mlar' from Sales.SalesOrderDetail order by LineTotal

--select floor(4.3) as 'sadece tam say�' -- pozitifse sadecde tam k�sm� yazar.
--select floor(-4.3) as 'sadece tam say�' -- negatifse bir eksi�ine yuvarlar.

--select ceiling(LineTotal) as 'Ceiling Sonucu', LineTotal, floor(LineTotal) as 'Floor Sonucu' from Sales.SalesOrderDetail

--select round(10.3,0) as 'yeni de�er' --alta yuvarlad�
--select round(10.5,0) as 'yeni de�er' --�ste yuvarlad�
--select round(10.7,0) as 'yeni de�er' --�ste yuvarlad�

--select round(10.3454,1) as 'yeni de�er' -- 10.3
--select round(10.3554,1) as 'yeni de�er' --10.4
--select round(10.3954,1) as 'yeni de�er' --10.4

--select LineTotal, round(LineTotal,1) as 'En yak�n say�ya yuvarlama' from Sales.SalesOrderDetail
--select LineTotal, round(LineTotal,2) as 'En yak�n say�ya yuvarlama' from Sales.SalesOrderDetail

--select power(2,5) as '�s' -- power �s alma fonk. 2^5 hesapl�yor burada.
--select SQRT(64) as 'karek�k' -- sqrt karek�k�n� al�r
--select SQRT(50) as 'karek�k' -- ondal�kl� say� olarak hesaplar.

--select sum(UnitPrice) as 'Toplam Tutar' from Sales.SalesOrderDetail -- toplam tutar� hesaplamak i�in
--select sum(UnitPrice) as 'Toplam Tutar' from Sales.SalesOrderDetail where UnitPrice<=1000

--select AVG(LineTotal) as 'Ortalama Tutar' from Sales.SalesOrderDetail
--select MAX(LineTotal) as 'MAX Tutar' from Sales.SalesOrderDetail
--select MIN(LineTotal) as 'M�N Tutar' from Sales.SalesOrderDetail

--select count(LineTotal) as 'Toplam Kay�t Say�s�' from Sales.SalesOrderDetail 

--select getdate() -- �u anki tarihi ve saati getirir.
--select datepart(month,'2025-05-08') -- tarihteki ay� verir.
--select datepart(year, getdate()) as 'y�l'
--select datepart(month, getdate()) as 'ay'
--select datepart(week, getdate()) as 'hafta'
--select datepart(day, getdate()) as 'g�n'
--select datepart(quarter, getdate()) as 'y�l�n ka��nc� �eyre�i'

--Datepart ile ayn� i�levde daha k�sa ve kolay hali. Year(OrderDate), Month(OrderDate), Day(OrderDate) 

--select OrderDate, Datepart(year, OrderDate), year(OrderDate) from Orders -- bir fark yok

--select * from Production.ProductListPriceHistory where datepart(year,StartDate)= 2013
--select * from Production.ProductListPriceHistory where year(StartDate)= 2013 -- iki sorgu da ayn�

-- 2013 y�l�ndaki kay�tlar� getirdi.
--DATEDIFF(year/month/day,ba�lang�� tarihi,biti� tarihi)
--select DATEDIFF(month,'2025-01-08','2025-10-20') as 'Ay Fark�' -- ay fark�n� buldu
--select DATEDIFF(day,'2025-01-08','2025-10-20') as 'G�nFark�'
--select DATEDIFF(day,'2024-01-08',GETDATE()) 'ge�en zaman(g�n)' -- getdate kullan�nca bug�ne kadar ge�en tarih fark�n� bulur
--select dateadd(day, 20, getdate()) -- dateadd tarihe ekleme yapar.
--select dateadd(year, 30, '2025-04-05')






























