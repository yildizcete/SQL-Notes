-- IS NULL - IS NOT NULL - NULLIF KULLANIMI

--null = herhangi bir veri veya değer girilmediğini gösterir.
--is null = null olan kayıtları getirirken kullanırız
-- is not null = null olmayan kayıtları getirir
use AdventureWorks2017

select * from person.person

select * from person.person where MiddleName is null

select MiddleName from person.person where MiddleName is null

select productID, name, size, color, isnull(Color, 'Renk Yok') as Renk from production.product where size is null
-- color sütununda null olanlara renk yok yazısı atadı

--select MiddleName from person.person where MiddleName is not null

select 'yıldız' + ' '+ 'çete' --✔
select 'yıldız' + null + 'çete' --✔
select 'yıldız' + space(1) + 'çete' --✔
select 'yıldız' + space(10) + 'çete' --✔
select 5 + space(1) + 5 --✔
select 5 + space(1) + 'çete' --error
select 'yıldız' + space(1) + 5 --error

--SPACE() işlevi, belirtilen sayıda boşluk karakteri içeren bir dize döndürür.


-- COALESCE KULLANIMI = is null ile aynı işlevde çalışıyor farkını anlayamadım
select productID, name, size, color, coalesce(Color, 'Renk Yok') as Renk from production.product where size is null

/*
NULLIF KULLANIMI
--NULLIF() işlevi, iki ifade eşitse NULL, aksi takdirde ilk ifadeyi döndürür
EXP1;
SELECT NULLIF('Hello', 'Hello’); 				return 1
EXP2SELECT NULLIF('Hello', 'world’); 			return ‘Hello’

*/
select makeFlag, finishedGoodsFlag, nullif(makeflag, finishedgoodsflag) as 'if equal return null' from Production.Product
where ProductID<10

--makeflag ve finishedgoodsflagları aynı olanları getirdi
-- if equal return null'= eşitse null döndür



/*
					JOINLER 
inner join, multiple inner join, left join, right join, full join
joinler tabloları birleştirmek için kullanılır.
inner join= her iki tabloda da değerleri aynı olana göre birleştirir. mesela müşterİD aynı olanların olduğu verileri getirir.

*/
select top 10 * from person.person
select top 10 * from person.personphone

select p.businessentityid, p.firstname, p.lastname, ph.phonenumber from person.person p 
inner join person.personphone ph on p.businessentityid=ph.businessentityid
-- idleri eşit olanları alıp tabloları birleştirdi


/* 
left join= ilk (sol) tablodaki tüm satırları ve koşul ile belirtilen ikinci (sağ) tablodaki satırları seçmek/birleştirmek için kullanılır.
İlk (sol) tablodaki değer ile ikinci (sağ) tablodaki eşleşmeyen değer olursa ikinci (sağ) tablodaki değerler NULL değerini alır.

*/
select * from person.StateProvince as s left join sales.SalesTaxRate as t on s.StateProvinceID=t.StateProvinceID

/*
right join=  ikinci (sağ) tablodaki tüm satırları ve koşul ile belirtilen ilk (sol) tablodaki satırları seçmek/birleştirmek için kullanılır.
İkinci (sağ) tablodaki değer ile ilk (sol) tablodaki eşleşmeyen değer olursa ilk (sol) tablodaki değerler NULL değerini alır.

full join= iki tablodaki tüm kayıtları getirir.
