--WHILE DÖNGÜSÜ = Bir koþul doðru olduðu sürece tekrarlý iþlemler yapmak için kullanýlýr.
--declare @sayac int =1
--while @sayac<=5
--begin 
--	print cast(@sayac as varchar(1)) + '- Merhaba Dünya'
--	set @sayac = @sayac+1
--end

--soru1. Tabloda unitprice deðeri null deðilse fiytý %10 arttýr.

--declare @id int = (select min(ProductID) from Products)

--while @id is not null
--begin 
--update Products set UnitPrice = UnitPrice*1.1 where ProductID = @id
--set @id = (select min(ProductID) from Products where ProductID>@id)
--end

--select UnitPrice from Products

--soru2. Products tablosundaki ürünlerin UnitPrice deðerini 20'den küçük olanlar için %10 artýran bir WHILE döngüsü yazýn. 
--Döngü, her güncellemeden sonra bir kontrol yapmalý ve tüm fiyatlar 20'nin üzerine çýktýðýnda durmalýdýr.

--declare @fiyat decimal(10,2) = (select min(UnitPrice) from Products where UnitPrice<20)
--while @fiyat is not null
--begin
--	update Products set UnitPrice = UnitPrice*1.1 where UnitPrice = @fiyat
--	set @fiyat = (select min(UnitPrice) from Products where UnitPrice<20 )
--end
--select UnitPrice from Products

--soru3. Products tablosundaki ürünlerin UnitsInStock deðerini döngüyle kontrol edin. 
--Eðer stok deðeri 5'ten küçükse, bu ürünler için "Stok yetersiz" mesajý yazdýrýn.

--soru4. Orders tablosundaki OrderDate bilgisi 1997 yýlýndan önce olan tüm sipariþleri döngüyle kontrol edin. 
--Eðer ShippedDate boþ ise, "Sipariþ kargolanmamýþ" mesajý yazdýrýn.

--soru5. Products tablosundaki her ürün için UnitPrice ve UnitsInStock deðerlerini kullanarak ürünün toplam stok deðerini (UnitPrice * UnitsInStock) hesaplayan ve sonucu döngüyle yazdýran bir sorgu yazýn.

--use AdventureWorks2017
--soru6. Production.ProductInventory tablosunda LocationID = 1 olan ürünlerin Quantity deðerini döngüyle kontrol edin. 
--Eðer miktar 100'den küçükse, bu ürünlerin miktarýný %10 artýrýn. 
--Her güncellemede, artýrýlan ürünün ProductID ve yeni miktarýný yazdýrýn.

--soru7. Sales.SalesOrderHeader tablosunda, 2013 yýlýnda yapýlan sipariþleri döngüyle kontrol edin. 
--Her sipariþ için SalesOrderID ve TotalDue bilgilerini yazdýrýn. Döngü, tüm sipariþler iþlenene kadar devam etsin.

--soru8. HumanResources.EmployeePayHistory tablosunda, her çalýþanýn maaþýný (Rate) döngüyle kontrol edin. 
--Eðer maaþ 20'nin altýnda ise, çalýþan ID'sini ve maaþýný yazdýrýn.

--soru9. HumanResources.Employee tablosunda, WHILE döngüsüyle çalýþanlarýn BusinessEntityID deðerine göre sýrasýyla HireDate bilgilerini yazdýran bir sorgu yazýn.

--soru10. HumanResources.EmployeePayHistory tablosunda yer alan her çalýþanýn maaþýný ve maaþlarýnýn yýllýk artýþ oranýný (Rate) kontrol edin. 
--Her çalýþanýn maaþýný 2010 yýlý ile 2015 yýlý arasýndaki her yýl için döngüyle kontrol edin ve maaþ artýþý %5'in altýnda ise, bu çalýþan için "Düþük Artýþ" mesajý yazdýrýn. 
--Ayrýca her çalýþanýn BusinessEntityID ve maaþ artýþýný yazdýrýn.

--soru11. Sales.SalesOrderHeader tablosundaki sipariþlerin OrderDate ve ShipDate bilgilerini kullanarak, 
--gönderilme tarihi OrderDate'den 10 günden fazla geciken sipariþleri kontrol eden bir WHILE döngüsü yazýn. 
--Gecikmiþ sipariþler için SalesOrderID ve gecikme süresini yazdýrýn.

--soru12. HumanResources.Employee tablosundaki tüm çalýþanlarýn HireDate bilgilerini döngüyle kontrol edin. 
--Eðer bir çalýþanýn iþe giriþ tarihi 2005 yýlýndan önceyse, o çalýþanýn EmployeeID ve HireDate bilgilerini yazdýrýn. 
--Ayrýca, çalýþanlar arasýndaki 5 yýldan eski iþe giriþ tarihi olanlarý "Deneyimli Çalýþan" olarak iþaretleyin ve bilgilerini yazdýrýn.

----------------------------------------------------------------------------------------------------------------------------------
--CONTINUE VE GOTO ÝFADESÝ 
--CONTINUE = Bir koþul gerçekleþtiðinde o döngünün geri kalan kýsmýný atlar ve bir sonraki adýma geçer.
--Döngüyü tamamen sonlandýrmaz, sadece mevcut adýmý atlar.
--CONTINUE KULLANIM YAPISI; Bir WHILE döngüsü yazarsýn. Ýçinde bir IF koþulu kullanýrsýn.
--Eðer bu IF koþulu saðlanýrsa, CONTINUE çalýþýr ve döngünün kalan kodlarýný atlar. Döngü bir sonraki adýmdan devam eder.

--Soru1. Tek Sayýlarý Atlayarak çift sayýlarý yazdýr.
--declare @sayi int=0

--while @sayi<=100
--begin 
--	set @sayi = @sayi + 1

--	if @sayi % 2 = 1
--		continue
--	print @sayi
--end

--soru2. Tüm ürünlerin isimlerini yazdýr, ancak stokta olmayanlarý (UnitsInStock = 0) atla.
--select ProductName, UnitsInStock from Products where UnitsInStock>0 order by UnitsInStock

--soru3. Fiyatý 50’den büyük olan ürünleri atla ve diðer ürünlerin adlarýný yazdýr. (Products.Price)
--select ProductName, UnitPrice from Products where UnitPrice<50 order by UnitPrice

--soru4. Tüm müþteri bilgilerini (Customers) listele, ancak bölge bilgisi olmayan müþterileri atla.
select * from Customers where Region is null

--soru5. Sipariþ listesini döndür, ancak 1996 yýlýndaki sipariþleri atla . (Orders.OrderDate)
--select * from Orders where year(OrderDate)!= 1996

--soru6. Sadece indirimde olan (Discount > 0) ürünleri yazdýr ve diðerlerini atla. (OrderDetails.Discount)
--select P.ProductName,OD.Discount from OrderDetails OD join Products P on P.ProductID = OD.ProductID where Discount>0
------------------------------------------------------------------------------------------------------------------------
--GOTO =  kýsaca þu kod buloðuna git demek. bir etiket (label) tanýmlayarak belirli bir kod bloðuna atlama yapýlmasýný saðlar.
--Döngü içinde ya da dýþýnda kullanýlarak kontrol akýþýný istediðiniz yere yönlendirebilirsiniz.

--soru1. Bir döngüde 1’den 10’a kadar sayýlarý yazdýr. Ancak, sayý 7’ye gelince döngüyü sonlandýr.

--declare @sayi int =1

--while @sayi<=25
--begin 
--if @sayi = 23
--goto sonlandir

--print @sayi
--set @sayi+=1
--end

--sonlandir:
--print 'döngü burada bitti...'

--soru2. 