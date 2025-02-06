/*
MATEMATÝKSEL FONKSÝYONLAR
+ Max() == en büyük deðer
+ Min() == en küçük deðer
+ Count() == adet sayýsý
+ Sum() == toplam deðer
+ Avg() == ortalama deðer


METÝNSEL FONKSÝYONLAR
+ Upper() = Kolondaki tüm harfleri büyük harfe çevirir
+ Lower() = Kolondaki tüm harfleri küçük harfe çevirir
+ Substring() = Kelimenin belli bir parçasýný alýr
+ Len() == Karakter uzunluðunu gösterir. Sondaki boþluðu saymaz. Baþtaki ve ortadaki boþluklarý sayar
+ Ltrim() == Soldaki boþluklarý siler
+ Rtrim() == Saðdaki boþluklarý siler
+ Replace() == kelimenin harflerini deðiþtirir
Replace('kelime', 'deðiþecek harfler', 'yeni harfler')
+ Ceiling() == Ondalýk sayýyý en büyük üst deðerine yuvarlar
+ Power() == Sayýnýn üssünü almak için kullanýlýr
power(taban,üs)
substring(sütun adý ya da deðer, baþlangýç, uzunluk)
+ Dateadd == tarih veya saatte toplama yapmak için
+ Datediff == tarih veya saatte çýkarma yapmak için

*/

select * from Sales.SalesOrderDetail
select max(unitprice) from Sales.SalesOrderDetail
select min(productid) from Sales.SalesOrderDetail
select min(unitprice) as 'En Küçük Unitprice', max(unitprice) as 'En Büyük Unitprice' from Sales.SalesOrderDetail

select sum(unitprice) as ToplamDeger from Sales.SalesOrderDetail

select avg(unitprice) as Ortalama from Sales.SalesOrderDetail

select * from person.person
select count(*) from person.person 
select count(*) as 'Toplam Kayýt Sayýsý' from person.person 
select  distinct persontype as 'Personel Tipleri' from person.person 
select count(distinct persontype) as 'Toplam Personl Tiplerinin Sayýsý' from person.person 

select * from person.person
select upper(firstname) + ' ' + upper(lastname) as 'ADI SOYADI' from person.person
select lower(persontype) as 'Personel Tipleri' from person.person


select substring(firstname, 1, 5) from person.person where BusinessEntityID =5
select substring('Yýldýz Çete', 1, 8) -- ortadaki boþluðu da sayýyor

select len('Yýldýz Çete') as isim
select len('  Yýldýz Çete') as isim
select len('Yýldýz Çete   ') as isim
select len(p.firstname) as 'Ýsmin Karakter Uzunluðu', firstname, lastname from person.person p 
inner join person.personphone pa on p.BusinessEntityID=pa.BusinessEntityID

select ltrim('             Yýldýz') as adým
select  rtrim('ÇETE              ') as soyadým

select replace('Yýldýz Çete', 'Çete', 'Keskin') as 'Yeni Soyisim'
select replace('55533355444666', '3', '0') as çiftsayýlarr
select replace(replace('55533355444666', '3', '0'), '4', '1')

select ceiling(25.75) AS 'Tam Sayý'  
select ceiling(-13.6) AS 'Tam Sayý'
select ceiling(12.4) AS 'Tam Sayý'

select power(4,2) as üssayi


/*
DATEADD VE DATEDIFF KULLANIMI
Dateadd() = tarih veya saate ekleme yapmak için kullanýlýr
Datediff() = tarih veya saatten çýkarma yapmak için kullanýlýr
Getdate() =uan bulunduðumuz tarihi ve saati gösterir
Year() = Girilen tarih parametresindeki yýlý getirir.
datediff(tarihte deðiþecek kýsým, 'çýkarmanýn yapýlacaðý küçük tarih', 'çýkarmanýn yapýlacaðý büyük tarih')

*/

select dateadd(year, 1, '2017/08/25') as 'Sene Ekleme'
select dateadd(month, -2, '2017/08/25') as 'Ay Ekleme'


select datediff(year, '01/01/2001', '12/06/2024') as 'Yaþ Farký'
select datediff(month,'05/13/1982','12/31/2012') as 'Ay Farký'
select datediff(day,'05/13/1982','12/31/2012') as 'Gün Farký'

select getdate()
select year(getdate())

select * from person.person
select firstname + ' ' + lastname as 'Ýsim Soyisim', year(getdate()) - year(modifieddate) as Yaþ from person.person

select * from Sales.SalesOrderHeader
select year(orderdate) as 'Sene', sum(totaldue) as 'sipariþ miktarý' from sales.salesorderheader group by orderdate order by Sene
