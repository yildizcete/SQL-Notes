--OUTPUT KOMUTU

--OUTPUT = (INSERT, UPDATE, DELETE, MERGE) i�lemleri s�ras�nda yap�lan de�i�ikliklerin sonucunu g�rmek ve bu de�i�iklikleri takip etmek i�in kullan�l�r.
--OUTPUT komutuyla elde edilen verileri, DECLARE komutuyla olu�turdu�unuz tablo de�i�kenine kaydederiz. 
--Bu �ekilde i�lemin sonucu �zerinde daha fazla analiz edebilme olana�� olur.

--1.Bu sorguda, Products tablosuna yeni �r�nler ekleniyor. 
--OUTPUT komutu, eklenen sat�rlar�n ProductID ve ProductName bilgilerini @InsertedRows adl� bir tablo de�i�kenine ekliyor.
--Sonras�nda, @InsertedRows tablosu sorgulanarak eklenen �r�nlerin bilgisi g�steriliyor.

--DECLARE @goruntule TABLE (.
--    ProductID INT,
--    ProductName NVARCHAR(50)
--)

-- Veri ekleme ve eklenen sat�rlar� OUTPUT ile almak
--INSERT INTO Products (ProductName, UnitPrice)
--OUTPUT INSERTED.ProductID, INSERTED.ProductName INTO @goruntule
--VALUES ('Yeni �r�n', 150), ('Ba�ka �r�n', 200);

--SELECT * FROM @goruntule

--DECLARE @goruntule TABLE: Bu sat�rda bir tablo olu�turuluyor. Bu tablo, INSERT i�lemiyle eklenen �r�nlerin bilgilerini saklayacak.
--OUTPUT INSERTED.ProductID, INSERTED.ProductName INTO @goruntule: INSERT komutunun sonucunda eklenen �r�nlerin bilgilerini @goruntule tablosuna kaydediyoruz.
--SELECT * FROM @goruntule: Eklenen sat�rlar� g�rmek i�in bu tabloyu sorguluyoruz.

--2. Bu sorgu, Products tablosundaki fiyatlar� %10 oran�nda art�r�yor. 
--OUTPUT komutu, g�ncellenen sat�rlar�n eski ve yeni fiyatlar�n� @UpdatedRows tablosuna d�k�yor. 
--DELETED alias'� eski veriyi, INSERTED alias'� ise yeni veriyi temsil eder.

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

--3.Bu sorgu, Products tablosundaki belirli bir �r�n ad�n� ('Eski �r�n') silerken, 
--silinen sat�rlar�n bilgilerini @DeletedRows adl� tablo de�i�kenine kaydediyor.
--DELETED alias'�, silinen veriyi temsil eder.


--DECLARE @DeletedRows TABLE (
--    ProductID INT,
--    ProductName NVARCHAR(50)
--)

---- Silme i�lemi ve silinen sat�rlar�n bilgisi
--DELETE FROM Products
--OUTPUT DELETED.ProductID, DELETED.ProductName INTO @DeletedRows
--WHERE ProductName = 'Eski �r�n'

---- OUTPUT tablosunu sorgulama
--SELECT * FROM @DeletedRows

--declare @degisiklikAnalizi table (

--CustomerID varchar(50),
--oldCompanyName varchar(50),
--newCompanyName varchar(50)
--)

--update Customers set CompanyName = 'Y�ld�z�n �eker D�kkan�' 
--output inserted.CustomerID, deleted.CompanyName as 'oldCompanyName ', inserted.CompanyName as 'newCompanyName ' into @degisiklikAnalizi
--where CustomerID= 'Tortu'

--select * from @degisiklikAnalizi