--select distinct CustomerName from Insanlar
--select count(City) from Insanlar --Null olmayan kay�tlar� getirdi
----select count(distinct CustomerName) from Insanlar
--select count(*) from Insanlar -- Null dahil t�m kay�tlar� getirdi.

--select * from Insanlar order by Birthdate asc
--select * from Insanlar order by CustomerName --asc yazmaya gerek yok
--select * from Insanlar order by Birthdate desc
--select * from Insanlar order by City, Birthdate --�ehri a'dan z'ye do�ru s�ralad�. sonra ayn� �ehirleri de do�um tarihine 
--g�re k���kten b�y��e do�ru s�ralad�. beraber iki s�ralama yap�lm�� oldu.

--select CustomerName as 'M��teri �simleri' from Insanlar order by CustomerName
--select CustomerName as 'M��terilerin �simleri', Birthdate as 'Do�um Tarihleri' from Insanlar order by CustomerName
--select CustomerName,CustomerID, CustomerID+1000 as 'G�NCEL ID', CustomerName from Insanlar

--select * from Insanlar where ID>=1 and ID<=25
--select * from Insanlar where ID between 1 and 25 -- 1 ile 25 de dahil 


--select CustomerID from Customers where CustomerID like 'b%' -- b ile ba�layan kay�tlar� getirir.
--select CustomerID from Customers where CustomerID like '%b' -- b ile biten kay�tlar� getirir.
--select CustomerID from Customers where CustomerID like 'b%a' -- b ile ba�layan a ile biten kay�tlar� getirir.
--select CustomerID from Customers where CustomerID like '[ab]%' -- a veya b ile ba�layan kay�tlar� getirir.
--select CustomerID from Customers where CustomerID like '[a-g]%' -- a'dan g'ye kadar olan kay�tlar� getirir.
--select CustomerID from Customers where CustomerID like '[^a-g]%' -- d���nda olanlar� getirir
--select CustomerID from Customers where CustomerID like 'W_L%' - 1. harfi W 3. Harfi L olan kay�tlar� getir.
--select CustomerID from Customers where CustomerID like 'W____%' - 1. harfi W ve 5 harften olu�an kay�tlar� getir. 4 tane _
--alt tire kullan�yoruz.
