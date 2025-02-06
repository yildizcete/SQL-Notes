-- use Northwinds

--select 20+4 as 'toplama'
--select 20-4 as 'çýkartma' -- iki sorguyu farklý tablolarda sonucu bastýrýr.
-- ayný tabloda istersek;
--select 20+4 as 'toplama', 20-4 as 'çýkartma', 20*4 as 'çarpma', 20/4 as 'bölme' -- ondalýklý çýkarsa tam sonucu bastýrýr.

--select ContactTitle + ' - ' + ContactName as 'Position' from Customers -- iki sütunu birleþtirdi.

--select SUBSTRING(CompanyName,1,6) as 'Þirketlerin Ýlk 6 Harfi' from Customers
--select SUBSTRING('Merhaba Yýldýz', 9,14) as 'Ýsmim ehehe'
--select left(CompanyName,5) as 'Ýlk 5 Harf' from Customers -- soldan ilk n karakteri alýr.
--select right(CompanyName,8) as 'Son 8 Harf' from Customers -- saðdandan son n karakteri alýr.

--select UPPER(ContactTitle) as 'Büyük Harf', LOWER(CompanyName) as 'Küçük Harf' from Customers 
--select UPPER(ContactTitle) as 'Büyük Harf', LOWER(CompanyName) as 'Küçük Harf',* from Customers -- tüm tabloyu da yazdýrdým.

--select LEN('Merhaba Yýldýz') as 'Uzunluk' -- LEN kaç karakterli bir sayý olduðunu söyler.
--select ContactTitle, LEN(ContactTitle) as 'Karakter Sayýsý' from Customers -- Boþluðu da sayýyor
--select ContactTitle, LEN(ContactTitle) as 'Karakter Sayýsý' from Customers where LEN(ContactTitle)>=10 order by ContactTitle

--select REPLACE('Merhaba Dünya', 'Dünya', 'Evren') AS 'Yeni Metin'
--select REPLACE(ContactName, 'Maria Anders', 'Maria Caným') as 'Yeni Ýsim' from Customers -- update yapmýyor sadece sorguda öyle gösteriyor.

--select abs(-10) as 'mutlak deðer'
--select abs(SinavNeti) as 'Sýnav Notlarý mutlak deðerli' from SinavBilgileri

--use AdventureWorks2017

--select ceiling(12.01) as 'yuvarla' - Ondalýk sayýlarý bir üste yuvarlar
--select ceiling(LineTotal) as 'Tam kýsýmlar' from Sales.SalesOrderDetail order by LineTotal

--select floor(4.3) as 'sadece tam sayý' -- pozitifse sadecde tam kýsmý yazar.
--select floor(-4.3) as 'sadece tam sayý' -- negatifse bir eksiðine yuvarlar.

--select ceiling(LineTotal) as 'Ceiling Sonucu', LineTotal, floor(LineTotal) as 'Floor Sonucu' from Sales.SalesOrderDetail

--select round(10.3,0) as 'yeni deðer' --alta yuvarladý
--select round(10.5,0) as 'yeni deðer' --üste yuvarladý
--select round(10.7,0) as 'yeni deðer' --üste yuvarladý

--select round(10.3454,1) as 'yeni deðer' -- 10.3
--select round(10.3554,1) as 'yeni deðer' --10.4
--select round(10.3954,1) as 'yeni deðer' --10.4

--select LineTotal, round(LineTotal,1) as 'En yakýn sayýya yuvarlama' from Sales.SalesOrderDetail
--select LineTotal, round(LineTotal,2) as 'En yakýn sayýya yuvarlama' from Sales.SalesOrderDetail

--select power(2,5) as 'üs' -- power üs alma fonk. 2^5 hesaplýyor burada.
--select SQRT(64) as 'karekök' -- sqrt karekökünü alýr
--select SQRT(50) as 'karekök' -- ondalýklý sayý olarak hesaplar.

--select sum(UnitPrice) as 'Toplam Tutar' from Sales.SalesOrderDetail -- toplam tutarý hesaplamak için
--select sum(UnitPrice) as 'Toplam Tutar' from Sales.SalesOrderDetail where UnitPrice<=1000

--select AVG(LineTotal) as 'Ortalama Tutar' from Sales.SalesOrderDetail
--select MAX(LineTotal) as 'MAX Tutar' from Sales.SalesOrderDetail
--select MIN(LineTotal) as 'MÝN Tutar' from Sales.SalesOrderDetail

--select count(LineTotal) as 'Toplam Kayýt Sayýsý' from Sales.SalesOrderDetail 

--select getdate() -- þu anki tarihi ve saati getirir.
--select datepart(month,'2025-05-08') -- tarihteki ayý verir.
--select datepart(year, getdate()) as 'yýl'
--select datepart(month, getdate()) as 'ay'
--select datepart(week, getdate()) as 'hafta'
--select datepart(day, getdate()) as 'gün'
--select datepart(quarter, getdate()) as 'yýlýn kaçýncý çeyreði'

--Datepart ile ayný iþlevde daha kýsa ve kolay hali. Year(OrderDate), Month(OrderDate), Day(OrderDate) 

--select OrderDate, Datepart(year, OrderDate), year(OrderDate) from Orders -- bir fark yok

--select * from Production.ProductListPriceHistory where datepart(year,StartDate)= 2013
--select * from Production.ProductListPriceHistory where year(StartDate)= 2013 -- iki sorgu da ayný

-- 2013 yýlýndaki kayýtlarý getirdi.
--DATEDIFF(year/month/day,baþlangýç tarihi,bitiþ tarihi)
--select DATEDIFF(month,'2025-01-08','2025-10-20') as 'Ay Farký' -- ay farkýný buldu
--select DATEDIFF(day,'2025-01-08','2025-10-20') as 'GünFarký'
--select DATEDIFF(day,'2024-01-08',GETDATE()) 'geçen zaman(gün)' -- getdate kullanýnca bugüne kadar geçen tarih farkýný bulur
--select dateadd(day, 20, getdate()) -- dateadd tarihe ekleme yapar.
--select dateadd(year, 30, '2025-04-05')






























