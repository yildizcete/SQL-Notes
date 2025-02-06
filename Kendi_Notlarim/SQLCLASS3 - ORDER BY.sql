--select distinct CustomerName from Insanlar
--select count(City) from Insanlar --Null olmayan kayýtlarý getirdi
----select count(distinct CustomerName) from Insanlar
--select count(*) from Insanlar -- Null dahil tüm kayýtlarý getirdi.

--select * from Insanlar order by Birthdate asc
--select * from Insanlar order by CustomerName --asc yazmaya gerek yok
--select * from Insanlar order by Birthdate desc
--select * from Insanlar order by City, Birthdate --þehri a'dan z'ye doðru sýraladý. sonra ayný þehirleri de doðum tarihine 
--göre küçükten büyüðe doðru sýraladý. beraber iki sýralama yapýlmýþ oldu.

--select CustomerName as 'Müþteri Ýsimleri' from Insanlar order by CustomerName
--select CustomerName as 'Müþterilerin Ýsimleri', Birthdate as 'Doðum Tarihleri' from Insanlar order by CustomerName
--select CustomerName,CustomerID, CustomerID+1000 as 'GÜNCEL ID', CustomerName from Insanlar

--select * from Insanlar where ID>=1 and ID<=25
--select * from Insanlar where ID between 1 and 25 -- 1 ile 25 de dahil 


--select CustomerID from Customers where CustomerID like 'b%' -- b ile baþlayan kayýtlarý getirir.
--select CustomerID from Customers where CustomerID like '%b' -- b ile biten kayýtlarý getirir.
--select CustomerID from Customers where CustomerID like 'b%a' -- b ile baþlayan a ile biten kayýtlarý getirir.
--select CustomerID from Customers where CustomerID like '[ab]%' -- a veya b ile baþlayan kayýtlarý getirir.
--select CustomerID from Customers where CustomerID like '[a-g]%' -- a'dan g'ye kadar olan kayýtlarý getirir.
--select CustomerID from Customers where CustomerID like '[^a-g]%' -- dýþýnda olanlarý getirir
--select CustomerID from Customers where CustomerID like 'W_L%' - 1. harfi W 3. Harfi L olan kayýtlarý getir.
--select CustomerID from Customers where CustomerID like 'W____%' - 1. harfi W ve 5 harften oluþan kayýtlarý getir. 4 tane _
--alt tire kullanýyoruz.
