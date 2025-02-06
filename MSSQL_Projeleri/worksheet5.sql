USE AdventureWorks2017

		ARÝTMETÝK OPERATÖRLER

select 15+8 -- ekrana sonucu yazdýrýr
select 15+8 as toplama-- toplama isimli sütununda sonucu gösterir
select 15+8 as 'toplama' --üsttekiyle farký yok
select 15-8 as cikarma 
--yanyana tablolar þeklinde yazdýrmak için;
select 15+8 as topla, 15-8 as cikart
select 15+8 as topla, 15-8 as cikart, 15*8 as carp, 15/8 as bol
--sonucu tam sayý olarak yazdýrýyor. ondalýk kýsmý tabloya yazdýrmýyor


use AdventureWorks2017
select * from production.product
select ProductID, Name, ReorderPoint, ReorderPoint+100 as NewPoint from production.Product
--production.product tablosundan ProductID, Name, ReorderPoint ve ReorderPointe 3 ekleyip yeni sütuna NewPoint diyerek ekrana yazdýr.

select * from person.person
select Firstname +' ' + Lastname as name_surname from person.person
select 'sevgi her þeyin ilacýdýr' +  ' ' +'bu sevgiyi farklý þeylerden alabiliriz'+ ' ' +'Yýldýz Çete' as Dogrubilgi

select top 5 * from person.person -- 5 tane veriyi (satýrý) gösterir
--TOP fonksiyonu ile herhangi bir sorgu sonucu dönecek verilerin istediðimiz kadarýný ya da istediðimiz þekilde limitlenerek gösterilmesini saðlayabiliriz.

select p.name, p.productnumber from Production.Product as p
-- p nin iþlevini anlamadým


/*
		UNION - UNION ALL KOMUTLARI
Union iki veya daha fazla sorgunun sonuçlarýný birleþtirmek için kullanýlýr. Bu sorgu sonucu oluþan deðerler tek bir tablo üzerinde alt alta gösterilir.
Yeni tablonun kolon ismi üstte yazdýðýmýz tablonun kolon isimlerinden oluþur
Union tekrarlý kayýtlarý getirmez. her deðerden bir tane gelir 
tablo sýralamasý þöyle yapýlýr. üstte yazýlan tablonun verileri önce yazýlýr alta da altta yazdýðýmýz verileri yazar
union'da farklý iki tabloyu birleþtirirken iki tabloda da ayný olan sütunlarý birleþtirir. tüm sütunlarý birleþtirmek istediðimide hata verir
veri tipleri de ayný olmalýdýr.
Union all komutu iki select iþlemindeki tüm verileri gösterir. uniondan farký tekrarlanan verileri de gösterir
*/
use CustomerDB
create table TableA (
Sayilar int )
go
insert into TableA (Sayilar)
values ('1')
insert into TableA (Sayilar)
values ('2')
insert into TableA (Sayilar)
values ('3')
insert into TableA (Sayilar)
values ('4')
select * from TableA
  
create table TableB (
Rakamlar int )
go
insert into TableB (Rakamlar)
values ('1')
insert into TableB (Rakamlar)
values ('7')
insert into TableB (Rakamlar)
values ('9')
insert into TableB (Rakamlar)
values ('9')
go
select * from TableB

select * from TableA
union
select * from TableB

select * from TableA
union all
select * from TableB

use AdventureWorks2017

select * from sales.SalesPerson
select * from sales.SalesPersonQuotaHistory
select top 5 [BusinessEntityID], [SalesQuota], [ModifiedDate] from sales.SalesPerson where SalesQuota>0 -- [] olmasa da olur ama hoþ duruyor
union
select  top 5 BusinessEntityID, SalesQuota, ModifiedDate from sales.SalesPersonQuotaHistory where 275<BusinessEntityID and BusinessEntityID<300


select top 5 [BusinessEntityID], [SalesQuota], [ModifiedDate] from sales.SalesPerson where SalesQuota>0 -- [] olmasa da olur ama hoþ duruyor
union all
select  top 5 BusinessEntityID, SalesQuota, ModifiedDate from sales.SalesPersonQuotaHistory where 275<BusinessEntityID and BusinessEntityID<300

/*
		CAST VE CONVERT
ikisi de tür dönüþümleri için kullanýlýr
CAST iþlevi daha hýzlý ve kolay performans sunar veya bunun tersi de geçerlidir. 
CONVERT iþlevi, tarih ve saat deðerlerini, kesirli sayýlarý ve parasal göstergeleri dönüþtürmeye çalýþýrken daha iyidir.
CAST iþlevi ANSI standardýna sahiptir ve CONVERT iþlevine kýyasla daha taþýnabilirdir 
CAST, ondalýk sayýlarýn ve sayýsal deðerlerin dönüþtürülmesi söz konusu olduðunda da daha zordur, çünkü iþlev, ondalýk sayýlarýný orijinal ifadelerden uzak tutabilir.

*/
SELECT CAST(5.95 AS INT) result
select * from production.Product
select 'Ürün Kodu: ' + cast (ProductID as varchar) + ' - ' + 'Ürün Adý: ' + name from production.Product

SELECT CONVERT(int, 25.65) as results

SELECT CONVERT(datetime, '2017-08-25') as datatime

SELECT CONVERT(varchar, '2017-08-25', 101) as datetimeformat

SELECT CONVERT(varchar, PostTime, 101) as datetimeformat,*
FROM DatabaseLog 

select '07/26/1999' as 'The Date'
select cast('07/26/1999' as datetime) as 'The Date' -- tarih ve saati gösteren veri tipine dönüþtürdü
select cast('1250' as decimal(10,3)) as 'A Number' --ondalýk sayýya çevirdi
select cast (cast('6/8/1992' as datetime) - cast('10/3/1989' as datetime) as int) --iki tarihi birbirinden çýkartýp int veri tipinde sonucunu yazdýrdý