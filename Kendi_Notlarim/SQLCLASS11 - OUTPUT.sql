--OUTPUT KOMUTU

--OUTPUT = (INSERT, UPDATE, DELETE, MERGE) iþlemleri sýrasýnda yapýlan deðiþikliklerin sonucunu görmek ve bu deðiþiklikleri takip etmek için kullanýlýr.
--OUTPUT komutuyla elde edilen verileri, DECLARE komutuyla oluþturduðunuz tablo deðiþkenine kaydederiz. 
--Bu þekilde iþlemin sonucu üzerinde daha fazla analiz edebilme olanaðý olur.

--1.Bu sorguda, Products tablosuna yeni ürünler ekleniyor. 
--OUTPUT komutu, eklenen satýrlarýn ProductID ve ProductName bilgilerini @InsertedRows adlý bir tablo deðiþkenine ekliyor.
--Sonrasýnda, @InsertedRows tablosu sorgulanarak eklenen ürünlerin bilgisi gösteriliyor.

--DECLARE @goruntule TABLE (.
--    ProductID INT,
--    ProductName NVARCHAR(50)
--)

-- Veri ekleme ve eklenen satýrlarý OUTPUT ile almak
--INSERT INTO Products (ProductName, UnitPrice)
--OUTPUT INSERTED.ProductID, INSERTED.ProductName INTO @goruntule
--VALUES ('Yeni Ürün', 150), ('Baþka Ürün', 200);

--SELECT * FROM @goruntule

--DECLARE @goruntule TABLE: Bu satýrda bir tablo oluþturuluyor. Bu tablo, INSERT iþlemiyle eklenen ürünlerin bilgilerini saklayacak.
--OUTPUT INSERTED.ProductID, INSERTED.ProductName INTO @goruntule: INSERT komutunun sonucunda eklenen ürünlerin bilgilerini @goruntule tablosuna kaydediyoruz.
--SELECT * FROM @goruntule: Eklenen satýrlarý görmek için bu tabloyu sorguluyoruz.

--2. Bu sorgu, Products tablosundaki fiyatlarý %10 oranýnda artýrýyor. 
--OUTPUT komutu, güncellenen satýrlarýn eski ve yeni fiyatlarýný @UpdatedRows tablosuna döküyor. 
--DELETED alias'ý eski veriyi, INSERTED alias'ý ise yeni veriyi temsil eder.

--DECLARE @UpdatedRows TABLE (
--    ProductID INT,
--    OldPrice MONEY,
--    NewPrice MONEY
--)

--UPDATE Products
--SET UnitPrice = UnitPrice * 1.1
--OUTPUT INSERTED.ProductID, DELETED.UnitPrice AS 'OldPrice', INSERTED.UnitPrice AS 'NewPrice' INTO @UpdatedRows
--WHERE UnitPrice < 100

---- OUTPUT tablosunu sorgulama
--SELECT * FROM @UpdatedRows

--3.Bu sorgu, Products tablosundaki belirli bir ürün adýný ('Eski Ürün') silerken, 
--silinen satýrlarýn bilgilerini @DeletedRows adlý tablo deðiþkenine kaydediyor.
--DELETED alias'ý, silinen veriyi temsil eder.


--DECLARE @DeletedRows TABLE (
--    ProductID INT,
--    ProductName NVARCHAR(50)
--)

---- Silme iþlemi ve silinen satýrlarýn bilgisi
--DELETE FROM Products
--OUTPUT DELETED.ProductID, DELETED.ProductName INTO @DeletedRows
--WHERE ProductName = 'Eski Ürün'

---- OUTPUT tablosunu sorgulama
--SELECT * FROM @DeletedRows

--declare @degisiklikAnalizi table (

--CustomerID varchar(50),
--oldCompanyName varchar(50),
--newCompanyName varchar(50)
--)

--update Customers set CompanyName = 'Yýldýzýn Þeker Dükkaný' 
--output inserted.CustomerID, deleted.CompanyName as 'oldCompanyName ', inserted.CompanyName as 'newCompanyName ' into @degisiklikAnalizi
--where CustomerID= 'Tortu'

--select * from @degisiklikAnalizi