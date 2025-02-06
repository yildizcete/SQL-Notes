/* 
GROUP BY KULLANIMI
Gruplandýrma yaparken kullanýlýr
Genelde count() avg() sum() max() min() gibi metotlarlarla beraber kullanýlýr. Bu metotlara  AGGRAGATE fonksiyonlar denilmektedir.
Hangi kolona göre grupluyorsak o kolonu fromdan önce yazmak zorundayýz yoksa hata verir
*/
use AdventureWorks2017
select * from Production.Product

select color, sum(safetystocklevel) as toplam from Production.product group by color
-- renklerine göre safetystocklevellerinin toplamýný ekrana yazdýrýr
select color, sum(safetystocklevel) as Toplam from Production.product group by color  having color is not null

select safetystocklevel, count(safetystocklevel) as kactane from production.product group by safetystocklevel
select safetystocklevel, count(*) as kactane from production.product group by safetystocklevel
-- ikisi de ayný sonucu verdi


/*
HAVING = WHERE KULLANIMI
WHERE ifadesinden sonra SUM, AVG, COUNT, MIN, MAX fonksiyonlarý kullanýlamaz. Oyüzden where yerine having kullanýyoruz
Bu ifadeleri içeren koþul ifadeleri mutlaka HAVING ifadesinden sonra yazýlýr.
+ Koþul içeren ifadelerde kullanýlýr
+ Genelde group by ile kullanýlýr
+ Where ile having beraber kullanýlabilir. önce where sonra having yazýlýr
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
