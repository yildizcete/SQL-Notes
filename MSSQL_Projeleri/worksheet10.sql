/*
CTE (Common Table Expression – Ortak Tablo Ýfadeleri)
bir sorgunun yürütülmesi anýnda elde edilmiþ geçici sonuçlar bir veya daha fazla kere kullanýlmasýný saðlayan ifadelerdir. 
CTE bir table veya view olmayýp sadece bir sorgu ifadesidir. 
Yani geçici ve kalýcý tablolar gibi herhangi bir veri içermezler.
CTE’lerin en önemli özelliði kendi kendini çaðýrabiliyor olmasý ve ayný sorgu içerisinden birden fazla çalýþtýrýlabiliyor olmasýdýr. 
Bu özelliðiyle CTE’ler daha çok recursive(Öz-yinelemeli) iþlemler için geliþtirilmiþtir
CTE’ler yalnýzca SELECT deðil INSERT, UPDATE ve DELETE yapýlarýnda da kullanýlabilir.

with cte_adi(kolon11.kolon2...)
as(sorgu tanýmý)

*/

WITH cteKat(KategoriId, KategoriAdi)
AS (SELECT KategoriId, KategoriAdi FROM Kategori) 
SELECT * FROM cteKat


with cteproduct (productno, productname, color)
as(select productid, name, color from production.product where productid>400 and color is not null)
select * from cteproduct
update cteproduct set productname='sql server' where productno=461


with enucuz 
as (select top 1 productid, name, listprice from production.product where listprice>0 order by listprice asc),

enpahali
as (select top 1 productid, name, listprice from production.product where listprice>0 order by listprice desc)

select * from enucuz
union
select * from enpahali

-- with yazdýðýmda hata veriyor onun yerine withi silip virgül koyduðumda kabul ediyor. syntx hatasý olarak yan tümcesi olduðu için diyor

WITH Siparisler AS (SELECT SalesOrderID, CustomerID FROM Sales.SalesOrderHeader)
SELECT Musteri.CustomerID, Siparisler.SalesOrderID FROM Sales.Customer AS Musteri
INNER JOIN Siparisler ON Musteri.CustomerID = Siparisler.CustomerID




/*
ROW_NUMBER()
herhangi bir sorgunun sonucunda listelenen verilerin satýrlarýna sýralý olarak numara verilmesini saðlayan fonksiyondur.
'over' ile kullanýlýr
<> iþareti != ile ayný anlama gelir. eþit deðildir demek

*/

select row_number() over(order by salesytd desc) as row, firstname, lastname, salesytd from sales.vsalesperson
where territoryname is not null and salesytd<> 0

with orderedorders 
as ( select salesorderid, orderdate, row_number() over(order by orderdate) as rownumber from sales.salesorderheader)

select salesorderid, orderdate, rownumber from orderedorders where rownumber between 50 and 60

SELECT CustomerID, FirstName + ' ' + LastName AS "Ad Soyad",
ROW_NUMBER() OVER (ORDER BY FirstName, LastName) AS "Satýr"
FROM Sales.Customer AS musteri INNER JOIN Person.Person AS Kisi
ON musteri.PersonID = Kisi.BusinessEntityID

