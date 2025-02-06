/* 
GROUP BY KULLANIMI
Grupland�rma yaparken kullan�l�r
Genelde count() avg() sum() max() min() gibi metotlarlarla beraber kullan�l�r. Bu metotlara  AGGRAGATE fonksiyonlar denilmektedir.
Hangi kolona g�re grupluyorsak o kolonu fromdan �nce yazmak zorunday�z yoksa hata verir
*/
use AdventureWorks2017
select * from Production.Product

select color, sum(safetystocklevel) as toplam from Production.product group by color
-- renklerine g�re safetystocklevellerinin toplam�n� ekrana yazd�r�r
select color, sum(safetystocklevel) as Toplam from Production.product group by color  having color is not null

select safetystocklevel, count(safetystocklevel) as kactane from production.product group by safetystocklevel
select safetystocklevel, count(*) as kactane from production.product group by safetystocklevel
-- ikisi de ayn� sonucu verdi


/*
HAVING = WHERE KULLANIMI
WHERE ifadesinden sonra SUM, AVG, COUNT, MIN, MAX fonksiyonlar� kullan�lamaz. Oy�zden where yerine having kullan�yoruz
Bu ifadeleri i�eren ko�ul ifadeleri mutlaka�HAVING�ifadesinden sonra yaz�l�r.
+ Ko�ul i�eren ifadelerde kullan�l�r
+ Genelde group by ile kullan�l�r
+ Where ile having beraber kullan�labilir. �nce where sonra having yaz�l�r
*/

select name, count(*) as adet, sum(reorderpoint) as toplam, avg(reorderpoint) ortalama from production.product group by name having name like 'A%'

select name, count(a.contacttypeid) as 'contact num' from person.BusinessEntityContact a 
inner join person.ContactType b on a.contacttypeid=b.ContactTypeID
group by a.contacttypeid, name
having count(a.contacttypeid)>100

select salesorderid, sum(orderqty*unitprice) as orderidcost from sales.SalesOrderDetail
group by salesorderid
having sum(orderqty*unitprice)>100000.00
order by salesorderid
