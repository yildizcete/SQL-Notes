-- IF ELSE YAPISI

--IF (koþul)
--BEGIN
--    -- Koþul doðruysa yapýlacak iþlemler
--END
--ELSE
--BEGIN
--    -- Koþul yanlýþsa yapýlacak iþlemler
--END
--------------------------------------------------------------------
--declare @maas int
--set @maas =4000

-- kýsayolu declare @maas int = 3000

--if @maas>3000
--begin
--	print 'Maaþa zam yapamayýz'
--end 

--else 
--begin
--	print 'Maaþýnýza 1000 bila zam yapýlmýþtýr'
--end
--------------------------------------------------

--IF (SELECT AVG(Quantity) FROM OrderDetails) > 20
--BEGIN
--    PRINT 'Sipariþ sayýmýz gayet iyi'
--END
--ELSE
--BEGIN
--    PRINT 'Sipariþ sayýmýz çok kötü'
--END
----------------------------------------------------
--IF EXISTS (SELECT 1 FROM Orders WHERE CustomerID = 'ALFKI')
--BEGIN
--    PRINT 'ALFKI müþterisi sipariþ vermiþ.'
--END
--ELSE
--BEGIN
--    PRINT 'ALFKI müþterisinin sipariþi yok.'
--END
--------------------------------------------------------
--1.Orders tablosunda belirli bir sipariþin durumu kontrol ediliyor. 
--Eðer sipariþin durumu "Shipped" (gönderildi) ise, kullanýcýya sipariþin gönderildiði bilgisini veriyor.

--DECLARE @OrderID INT = 10248;  -- Sipariþ numarasýný belirliyoruz

--IF EXISTS (SELECT 1 FROM Orders WHERE OrderID = @OrderID)
--BEGIN
--    PRINT 'Sipariþ gönderildi.';
--END
--ELSE
--BEGIN
--    PRINT 'Sipariþ henüz gönderilmedi.';
--END
-----------------------------------------------------------------------------------------------------------------
--use AdventureWorks2017
--1.Production.Product tablosunda ID'si = 326 olan ürünün stoðu 1000'den büyükse "Ürünün stoðu yüksek" yazdýrýlacak. 
--Eðer stoðu 500 ile 999 arasýndaysa "Ürünün stoðu ideal seviyede" yazdýrýlacak. 
--Eðer her iki koþul da saðlanmýyorsa, "Ürünün stoðu yetersiz" yazdýrýlacak.

--declare @urunID int = 326
--declare @stok int

--select @stok = SafetyStockLevel from Production.Product where ProductID = @urunID

--if @stok>=1000
--begin
--	print 'Ürün stoðu yüksek'
--end
--else if @stok>=500 and @stok<1000
--begin
--	print 'Ürün stoðu normal'
--end
--else
--begin
--	print 'Ürün stoðu yetersiz'
--end
---------------------------------------------------
--if exists(select 1 from Production.Product where ProductID = 326 and  SafetyStockLevel>=1000)
--begin
--	print '<ürün stoðu yüksek'
--end
--else
--begin 
--	print 'Ürün stoðu yüksek deðil'
--end

--2.HumanResources.Employee tablosundaki bir departman ID'sine göre, departmanda çalýþan sayýsýnýn 10'dan fazla olup olmadýðý kontrol edilecek.
--declare @calisanSayi int
--select @calisanSayi = Count(DepartmentID ) from HumanResources.EmployeeDepartmentHistory where DepartmentID=7

--if (@calisanSayi > 10)
--begin
--	print 'Departmanda çalýþan sayýsý 10dan fazla'
--end
--else
--begin
--	print 'Departmanda çalýþan sayýsý 10dan az'
--end

--3.Production.Product tablosunda bir ürün ID'sine göre, ürünün stok durumu kontrol edilecek:
--Eðer stok 0 ise "Stok tükenmiþ" yazdýrýlacak.
--Eðer stok 1-10 arasýnda ise "Stok az" yazdýrýlacak.
--Stok 10'dan fazla ise "Stok yeterli" yazdýrýlacak.

--declare @urunID int, @stok int
--set @urunID = 510
--select @stok = SafetyStockLevel from Production.Product where ProductID =  @urunID

--if @stok>=1000
--begin
--	print 'Ürün stoðu yüksek'
--end
--else if @stok>=500 and @stok<1000
--begin
--	print 'Ürün stoðu normal'
--end
--else
--begin
--	print 'Ürün stoðu yetersiz'
--end

--4.Production.Product, Categories
--Bir ürün ID'sine göre, ürünün kategorisi "Beverages" ve stok durumu 0 ise "Beverage ürünü tükenmiþ" yazdýrýlacak.

--5.HumanResources.Employee, HumanResources.EmployeePayHistory
--Bir çalýþan ID'sine göre, çalýþanýn maaþ deðiþim geçmiþine bakarak terfi durumu hakkýnda bir deðerlendirme yapýn.
--Eðer çalýþan son 6 ay içinde maaþýnda %10'dan fazla artýþ yaþamýþsa "Terfi aldý" yazdýrýn.
--Eðer çalýþan son 6 ayda maaþ artýþý olmamýþsa "Terfi almadý" yazdýrýn.
--Eðer maaþ artýþý %5 ile %10 arasýnda ise "Orta düzey terfi" yazdýrýn.

--6.HumanResources.Employee, HumanResources.EmployeePayHistory, Sales.SalesOrderHeader
--Bir çalýþan ID'sine göre, çalýþanýn satýþ verisi ile maaþ geçmiþini karþýlaþtýrarak performansýný deðerlendirin.
--Eðer çalýþanýn son 6 ayda sattýðý ürünlerden elde ettiði gelir 50.000 birimi aþmýþsa ve maaþýnda %10 artýþ olmuþsa "Performans yüksek, terfi bekleniyor" yazdýrýn.
--Eðer satýþlarý 50.000 birimden azsa ama maaþý artmýþsa "Orta performans, terfi" yazdýrýn.
--Eðer satýþlarý azsa ve maaþý deðiþmemiþse "Düþük performans" yazdýrýn.

--use northwinds
--7.Products, Categories
--Bir ürün ID'sine göre eðer ürün kategorisi "Beverages" (Ýçecekler) ve fiyatý 15'ten fazla ise "Pahalý içecek" yazdýrýlacak.
--Eðer fiyat 15 veya daha azsa ve kategori "Beverages" ise "Uygun fiyatlý içecek" yazdýrýlacak.
--Farklý bir kategorideyse "Farklý kategori" yazdýrýlacak.

--8.Products, Categories, OrderDetails
--Bir ürün ID'sine göre, eðer ürün "Beverages" kategorisinde ve sipariþ sayýsý 100'den fazla ise "Popüler içecek" yazdýrýlacak.

--9.Orders, Employees
--Bir çalýþan ID'sine göre, çalýþan "Shipped" durumunda sipariþleri varsa "Sipariþleri göndermiþ" yazdýrýlacak, aksi takdirde "Sipariþ göndermemiþ" yazdýrýlacak.

--10.Orders, OrderDetails
--Bir sipariþ ID'sine göre, sipariþin teslimat durumunu kontrol edin.
--Eðer sipariþin teslimat tarihi, sipariþ tarihinden 7 gün sonra gerçekleþmiþse ve sipariþ "Shipped" durumunda ise "Hýzlý Teslimat" yazdýrýn.
--Eðer teslimat tarihi, sipariþ tarihinden 7 gün sonra gerçekleþmemiþse ve sipariþ "Shipped" durumunda ise "Normal Teslimat" yazdýrýn.
--Eðer sipariþ "Pending" durumundaysa "Teslimat Bekleniyor" yazdýrýn.