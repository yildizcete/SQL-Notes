/*
CTE (Common Table Expression � Ortak Tablo �fadeleri)
bir sorgunun y�r�t�lmesi an�nda elde edilmi� ge�ici sonu�lar bir veya daha fazla kere kullan�lmas�n� sa�layan ifadelerdir. 
CTE bir table veya view olmay�p sadece bir sorgu ifadesidir. 
Yani ge�ici ve kal�c� tablolar gibi herhangi bir veri i�ermezler.
CTE�lerin en �nemli �zelli�i kendi kendini �a��rabiliyor olmas� ve ayn� sorgu i�erisinden birden fazla �al��t�r�labiliyor olmas�d�r. 
Bu �zelli�iyle CTE�ler daha �ok recursive(�z-yinelemeli) i�lemler i�in geli�tirilmi�tir
CTE�ler yaln�zca SELECT de�il INSERT, UPDATE ve DELETE yap�lar�nda da kullan�labilir.

with cte_adi(kolon11.kolon2...)
as(sorgu tan�m�)

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

-- with yazd���mda hata veriyor onun yerine withi silip virg�l koydu�umda kabul ediyor. syntx hatas� olarak yan t�mcesi oldu�u i�in diyor

WITH Siparisler AS (SELECT SalesOrderID, CustomerID FROM Sales.SalesOrderHeader)
SELECT Musteri.CustomerID, Siparisler.SalesOrderID FROM Sales.Customer AS Musteri
INNER JOIN Siparisler ON Musteri.CustomerID = Siparisler.CustomerID




/*
ROW_NUMBER()
herhangi bir sorgunun sonucunda listelenen verilerin sat�rlar�na s�ral� olarak numara verilmesini sa�layan fonksiyondur.
'over' ile kullan�l�r
<> i�areti != ile ayn� anlama gelir. e�it de�ildir demek

*/

select row_number() over(order by salesytd desc) as row, firstname, lastname, salesytd from sales.vsalesperson
where territoryname is not null and salesytd<> 0

with orderedorders 
as ( select salesorderid, orderdate, row_number() over(order by orderdate) as rownumber from sales.salesorderheader)

select salesorderid, orderdate, rownumber from orderedorders where rownumber between 50 and 60

SELECT CustomerID, FirstName + ' ' + LastName AS "Ad Soyad",
ROW_NUMBER() OVER (ORDER BY FirstName, LastName) AS "Sat�r"
FROM Sales.Customer AS musteri INNER JOIN Person.Person AS Kisi
ON musteri.PersonID = Kisi.BusinessEntityID

