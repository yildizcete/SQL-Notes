/*
MATEMAT�KSEL FONKS�YONLAR
+ Max() == en b�y�k de�er
+ Min() == en k���k de�er
+ Count() == adet say�s�
+ Sum() == toplam de�er
+ Avg() == ortalama de�er


MET�NSEL FONKS�YONLAR
+ Upper() = Kolondaki t�m harfleri b�y�k harfe �evirir
+ Lower() = Kolondaki t�m harfleri k���k harfe �evirir
+ Substring() = Kelimenin belli bir par�as�n� al�r
+ Len() == Karakter uzunlu�unu g�sterir. Sondaki bo�lu�u saymaz. Ba�taki ve ortadaki bo�luklar� sayar
+ Ltrim() == Soldaki bo�luklar� siler
+ Rtrim() == Sa�daki bo�luklar� siler
+ Replace() == kelimenin harflerini de�i�tirir
Replace('kelime', 'de�i�ecek harfler', 'yeni harfler')
+ Ceiling() == Ondal�k say�y� en b�y�k �st de�erine yuvarlar
+ Power() == Say�n�n �ss�n� almak i�in kullan�l�r
power(taban,�s)
substring(s�tun ad� ya da de�er, ba�lang��, uzunluk)
+ Dateadd == tarih veya saatte toplama yapmak i�in
+ Datediff == tarih veya saatte ��karma yapmak i�in

*/

select * from Sales.SalesOrderDetail
select max(unitprice) from Sales.SalesOrderDetail
select min(productid) from Sales.SalesOrderDetail
select min(unitprice) as 'En K���k Unitprice', max(unitprice) as 'En B�y�k Unitprice' from Sales.SalesOrderDetail

select sum(unitprice) as ToplamDeger from Sales.SalesOrderDetail

select avg(unitprice) as Ortalama from Sales.SalesOrderDetail

select * from person.person
select count(*) from person.person 
select count(*) as 'Toplam Kay�t Say�s�' from person.person 
select  distinct persontype as 'Personel Tipleri' from person.person 
select count(distinct persontype) as 'Toplam Personl Tiplerinin Say�s�' from person.person 

select * from person.person
select upper(firstname) + ' ' + upper(lastname) as 'ADI SOYADI' from person.person
select lower(persontype) as 'Personel Tipleri' from person.person


select substring(firstname, 1, 5) from person.person where BusinessEntityID =5
select substring('Y�ld�z �ete', 1, 8) -- ortadaki bo�lu�u da say�yor

select len('Y�ld�z �ete') as isim
select len('  Y�ld�z �ete') as isim
select len('Y�ld�z �ete   ') as isim
select len(p.firstname) as '�smin Karakter Uzunlu�u', firstname, lastname from person.person p 
inner join person.personphone pa on p.BusinessEntityID=pa.BusinessEntityID

select�ltrim('             Y�ld�z')�as ad�m
select��rtrim('�ETE��          � ')�as�soyad�m

select replace('Y�ld�z �ete', '�ete', 'Keskin') as 'Yeni Soyisim'
select replace('55533355444666', '3', '0') as �iftsay�larr
select replace(replace('55533355444666', '3', '0'), '4', '1')

select ceiling(25.75) AS 'Tam Say�'  
select ceiling(-13.6) AS 'Tam Say�'
select ceiling(12.4) AS 'Tam Say�'

select power(4,2) as �ssayi


/*
DATEADD VE DATEDIFF KULLANIMI
Dateadd() = tarih veya saate ekleme yapmak i�in kullan�l�r
Datediff() = tarih veya saatten ��karma yapmak i�in kullan�l�r
Getdate() =uan bulundu�umuz tarihi ve saati g�sterir
Year() = Girilen tarih parametresindeki y�l� getirir.
datediff(tarihte de�i�ecek k�s�m, '��karman�n yap�laca�� k���k tarih', '��karman�n yap�laca�� b�y�k tarih')

*/

select dateadd(year, 1, '2017/08/25') as 'Sene Ekleme'
select dateadd(month, -2, '2017/08/25') as 'Ay Ekleme'


select datediff(year, '01/01/2001', '12/06/2024') as 'Ya� Fark�'
select datediff(month,'05/13/1982','12/31/2012') as 'Ay Fark�'
select datediff(day,'05/13/1982','12/31/2012') as 'G�n Fark�'

select getdate()
select year(getdate())

select * from person.person
select firstname + ' ' + lastname as '�sim Soyisim', year(getdate()) - year(modifieddate) as Ya� from person.person

select * from Sales.SalesOrderHeader
select year(orderdate) as 'Sene', sum(totaldue) as 'sipari� miktar�' from sales.salesorderheader group by orderdate order by Sene
