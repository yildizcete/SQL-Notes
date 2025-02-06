--WHILE D�NG�S� = Bir ko�ul do�ru oldu�u s�rece tekrarl� i�lemler yapmak i�in kullan�l�r.
--declare @sayac int =1
--while @sayac<=5
--begin 
--	print cast(@sayac as varchar(1)) + '- Merhaba D�nya'
--	set @sayac = @sayac+1
--end

--soru1. Tabloda unitprice de�eri null de�ilse fiyt� %10 artt�r.

--declare @id int = (select min(ProductID) from Products)

--while @id is not null
--begin 
--update Products set UnitPrice = UnitPrice*1.1 where ProductID = @id
--set @id = (select min(ProductID) from Products where ProductID>@id)
--end

--select UnitPrice from Products

--soru2. Products tablosundaki �r�nlerin UnitPrice de�erini 20'den k���k olanlar i�in %10 art�ran bir WHILE d�ng�s� yaz�n. 
--D�ng�, her g�ncellemeden sonra bir kontrol yapmal� ve t�m fiyatlar 20'nin �zerine ��kt���nda durmal�d�r.

--declare @fiyat decimal(10,2) = (select min(UnitPrice) from Products where UnitPrice<20)
--while @fiyat is not null
--begin
--	update Products set UnitPrice = UnitPrice*1.1 where UnitPrice = @fiyat
--	set @fiyat = (select min(UnitPrice) from Products where UnitPrice<20 )
--end
--select UnitPrice from Products

--soru3. Products tablosundaki �r�nlerin UnitsInStock de�erini d�ng�yle kontrol edin. 
--E�er stok de�eri 5'ten k���kse, bu �r�nler i�in "Stok yetersiz" mesaj� yazd�r�n.

--soru4. Orders tablosundaki OrderDate bilgisi 1997 y�l�ndan �nce olan t�m sipari�leri d�ng�yle kontrol edin. 
--E�er ShippedDate bo� ise, "Sipari� kargolanmam��" mesaj� yazd�r�n.

--soru5. Products tablosundaki her �r�n i�in UnitPrice ve UnitsInStock de�erlerini kullanarak �r�n�n toplam stok de�erini (UnitPrice * UnitsInStock) hesaplayan ve sonucu d�ng�yle yazd�ran bir sorgu yaz�n.

--use AdventureWorks2017
--soru6. Production.ProductInventory tablosunda LocationID = 1 olan �r�nlerin Quantity de�erini d�ng�yle kontrol edin. 
--E�er miktar 100'den k���kse, bu �r�nlerin miktar�n� %10 art�r�n. 
--Her g�ncellemede, art�r�lan �r�n�n ProductID ve yeni miktar�n� yazd�r�n.

--soru7. Sales.SalesOrderHeader tablosunda, 2013 y�l�nda yap�lan sipari�leri d�ng�yle kontrol edin. 
--Her sipari� i�in SalesOrderID ve TotalDue bilgilerini yazd�r�n. D�ng�, t�m sipari�ler i�lenene kadar devam etsin.

--soru8. HumanResources.EmployeePayHistory tablosunda, her �al��an�n maa��n� (Rate) d�ng�yle kontrol edin. 
--E�er maa� 20'nin alt�nda ise, �al��an ID'sini ve maa��n� yazd�r�n.

--soru9. HumanResources.Employee tablosunda, WHILE d�ng�s�yle �al��anlar�n BusinessEntityID de�erine g�re s�ras�yla HireDate bilgilerini yazd�ran bir sorgu yaz�n.

--soru10. HumanResources.EmployeePayHistory tablosunda yer alan her �al��an�n maa��n� ve maa�lar�n�n y�ll�k art�� oran�n� (Rate) kontrol edin. 
--Her �al��an�n maa��n� 2010 y�l� ile 2015 y�l� aras�ndaki her y�l i�in d�ng�yle kontrol edin ve maa� art��� %5'in alt�nda ise, bu �al��an i�in "D���k Art��" mesaj� yazd�r�n. 
--Ayr�ca her �al��an�n BusinessEntityID ve maa� art���n� yazd�r�n.

--soru11. Sales.SalesOrderHeader tablosundaki sipari�lerin OrderDate ve ShipDate bilgilerini kullanarak, 
--g�nderilme tarihi OrderDate'den 10 g�nden fazla geciken sipari�leri kontrol eden bir WHILE d�ng�s� yaz�n. 
--Gecikmi� sipari�ler i�in SalesOrderID ve gecikme s�resini yazd�r�n.

--soru12. HumanResources.Employee tablosundaki t�m �al��anlar�n HireDate bilgilerini d�ng�yle kontrol edin. 
--E�er bir �al��an�n i�e giri� tarihi 2005 y�l�ndan �nceyse, o �al��an�n EmployeeID ve HireDate bilgilerini yazd�r�n. 
--Ayr�ca, �al��anlar aras�ndaki 5 y�ldan eski i�e giri� tarihi olanlar� "Deneyimli �al��an" olarak i�aretleyin ve bilgilerini yazd�r�n.

----------------------------------------------------------------------------------------------------------------------------------
--CONTINUE VE GOTO �FADES� 
--CONTINUE = Bir ko�ul ger�ekle�ti�inde o d�ng�n�n geri kalan k�sm�n� atlar ve bir sonraki ad�ma ge�er.
--D�ng�y� tamamen sonland�rmaz, sadece mevcut ad�m� atlar.
--CONTINUE KULLANIM YAPISI; Bir WHILE d�ng�s� yazars�n. ��inde bir IF ko�ulu kullan�rs�n.
--E�er bu IF ko�ulu sa�lan�rsa, CONTINUE �al���r ve d�ng�n�n kalan kodlar�n� atlar. D�ng� bir sonraki ad�mdan devam eder.

--Soru1. Tek Say�lar� Atlayarak �ift say�lar� yazd�r.
--declare @sayi int=0

--while @sayi<=100
--begin 
--	set @sayi = @sayi + 1

--	if @sayi % 2 = 1
--		continue
--	print @sayi
--end

--soru2. T�m �r�nlerin isimlerini yazd�r, ancak stokta olmayanlar� (UnitsInStock = 0) atla.
--select ProductName, UnitsInStock from Products where UnitsInStock>0 order by UnitsInStock

--soru3. Fiyat� 50�den b�y�k olan �r�nleri atla ve di�er �r�nlerin adlar�n� yazd�r. (Products.Price)
--select ProductName, UnitPrice from Products where UnitPrice<50 order by UnitPrice

--soru4. T�m m��teri bilgilerini (Customers) listele, ancak b�lge bilgisi olmayan m��terileri atla.
select * from Customers where Region is null

--soru5. Sipari� listesini d�nd�r, ancak 1996 y�l�ndaki sipari�leri atla . (Orders.OrderDate)
--select * from Orders where year(OrderDate)!= 1996

--soru6. Sadece indirimde olan (Discount > 0) �r�nleri yazd�r ve di�erlerini atla. (OrderDetails.Discount)
--select P.ProductName,OD.Discount from OrderDetails OD join Products P on P.ProductID = OD.ProductID where Discount>0
------------------------------------------------------------------------------------------------------------------------
--GOTO =  k�saca �u kod bulo�una git demek. bir etiket (label) tan�mlayarak belirli bir kod blo�una atlama yap�lmas�n� sa�lar.
--D�ng� i�inde ya da d���nda kullan�larak kontrol ak���n� istedi�iniz yere y�nlendirebilirsiniz.

--soru1. Bir d�ng�de 1�den 10�a kadar say�lar� yazd�r. Ancak, say� 7�ye gelince d�ng�y� sonland�r.

--declare @sayi int =1

--while @sayi<=25
--begin 
--if @sayi = 23
--goto sonlandir

--print @sayi
--set @sayi+=1
--end

--sonlandir:
--print 'd�ng� burada bitti...'

--soru2. 