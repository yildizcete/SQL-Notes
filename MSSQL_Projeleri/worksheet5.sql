USE AdventureWorks2017

		AR�TMET�K OPERAT�RLER

select 15+8 -- ekrana sonucu yazd�r�r
select 15+8 as toplama-- toplama isimli s�tununda sonucu g�sterir
select 15+8 as 'toplama' --�sttekiyle fark� yok
select 15-8 as cikarma 
--yanyana tablolar �eklinde yazd�rmak i�in;
select 15+8 as topla, 15-8 as cikart
select 15+8 as topla, 15-8 as cikart, 15*8 as carp, 15/8 as bol
--sonucu tam say� olarak yazd�r�yor. ondal�k k�sm� tabloya yazd�rm�yor


use AdventureWorks2017
select * from production.product
select ProductID, Name, ReorderPoint, ReorderPoint+100 as NewPoint from production.Product
--production.product tablosundan ProductID, Name, ReorderPoint ve ReorderPointe 3 ekleyip yeni s�tuna NewPoint diyerek ekrana yazd�r.

select * from person.person
select Firstname +' ' + Lastname as name_surname from person.person
select 'sevgi her �eyin ilac�d�r' +  ' ' +'bu sevgiyi farkl� �eylerden alabiliriz'+ ' ' +'Y�ld�z �ete' as Dogrubilgi

select top 5 * from person.person -- 5 tane veriyi (sat�r�) g�sterir
--TOP fonksiyonu ile herhangi bir sorgu sonucu d�necek verilerin istedi�imiz kadar�n� ya da istedi�imiz �ekilde limitlenerek g�sterilmesini sa�layabiliriz.

select p.name, p.productnumber from Production.Product as p
-- p nin i�levini anlamad�m


/*
		UNION - UNION ALL KOMUTLARI
Union iki veya daha fazla sorgunun sonu�lar�n� birle�tirmek i�in kullan�l�r. Bu sorgu sonucu olu�an de�erler tek bir tablo �zerinde alt alta g�sterilir.
Yeni tablonun kolon ismi �stte yazd���m�z tablonun kolon isimlerinden olu�ur
Union tekrarl� kay�tlar� getirmez. her de�erden bir tane gelir 
tablo s�ralamas� ��yle yap�l�r. �stte yaz�lan tablonun verileri �nce yaz�l�r alta da altta yazd���m�z verileri yazar
union'da farkl� iki tabloyu birle�tirirken iki tabloda da ayn� olan s�tunlar� birle�tirir. t�m s�tunlar� birle�tirmek istedi�imide hata verir
veri tipleri de ayn� olmal�d�r.
Union all komutu iki select i�lemindeki t�m verileri g�sterir. uniondan fark� tekrarlanan verileri de g�sterir
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
select top 5 [BusinessEntityID], [SalesQuota], [ModifiedDate] from sales.SalesPerson where SalesQuota>0 -- [] olmasa da olur ama ho� duruyor
union
select  top 5 BusinessEntityID, SalesQuota, ModifiedDate from sales.SalesPersonQuotaHistory where 275<BusinessEntityID and BusinessEntityID<300


select top 5 [BusinessEntityID], [SalesQuota], [ModifiedDate] from sales.SalesPerson where SalesQuota>0 -- [] olmasa da olur ama ho� duruyor
union all
select  top 5 BusinessEntityID, SalesQuota, ModifiedDate from sales.SalesPersonQuotaHistory where 275<BusinessEntityID and BusinessEntityID<300

/*
		CAST VE CONVERT
ikisi de t�r d�n���mleri i�in kullan�l�r
CAST i�levi daha h�zl� ve kolay performans sunar veya bunun tersi de ge�erlidir. 
CONVERT i�levi, tarih ve saat de�erlerini, kesirli say�lar� ve parasal g�stergeleri d�n��t�rmeye �al���rken daha iyidir.
CAST i�levi ANSI standard�na sahiptir ve CONVERT i�levine k�yasla daha ta��nabilirdir 
CAST, ondal�k say�lar�n ve say�sal de�erlerin d�n��t�r�lmesi s�z konusu oldu�unda da daha zordur, ��nk� i�lev, ondal�k say�lar�n� orijinal ifadelerden uzak tutabilir.

*/
SELECT CAST(5.95 AS INT) result
select * from production.Product
select '�r�n Kodu: ' + cast (ProductID as varchar) + ' - ' + '�r�n Ad�: ' + name from production.Product

SELECT CONVERT(int, 25.65) as results

SELECT CONVERT(datetime, '2017-08-25') as datatime

SELECT CONVERT(varchar, '2017-08-25', 101) as datetimeformat

SELECT CONVERT(varchar, PostTime, 101) as datetimeformat,*
FROM DatabaseLog 

select '07/26/1999' as 'The Date'
select cast('07/26/1999' as datetime) as 'The Date' -- tarih ve saati g�steren veri tipine d�n��t�rd�
select cast('1250' as decimal(10,3)) as 'A Number' --ondal�k say�ya �evirdi
select cast (cast('6/8/1992' as datetime) - cast('10/3/1989' as datetime) as int) --iki tarihi birbirinden ��kart�p int veri tipinde sonucunu yazd�rd�