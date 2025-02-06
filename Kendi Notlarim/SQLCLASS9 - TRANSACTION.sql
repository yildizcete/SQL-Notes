--Transaction: Birden çok iþlemin bir arada yapýldýðý durumlarda eðer parçayý oluþturan iþlemlerden herhangi birinde
--sorun olursa tüm iþlemleri iptal etmeyi saðlar.
--BEGIN TRANSACTION: Bir transaction baþlatýr.
--COMMIT: Transaction'ý baþarýyla tamamlar ve deðiþiklikleri kalýcý hale getirir.
--ROLLBACK: Transaction'ý iptal eder ve yapýlan deðiþiklikleri geri alýr.

--1.
--begin transaction
--update Stok set Adet = Adet - 10 where UrunID = 1;

---- Kontrol etmek için bir koþul ekleyelim
--if @@ERROR = 0
--    commit;  -- Ýþlem baþarýlýysa kaydet
--else
--    rollback; -- Bir hata varsa geri al

--2. Bir müþteri sipariþ verdiðinde, sipariþ kaydý eklenir ve stok miktarý güncellenir. 
--Eðer herhangi bir adým baþarýsýz olursa, iþlem geri alýnmasý için transation örneði

--begin transaction

---- Sipariþ ekleme
--insert into OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
--values (10248, 1, 18.00, 5, 0); 

---- Stok güncelleme
--update Products set UnitsInStock = UnitsInStock - 5 where ProductID = 1;

---- Kontrol et ve tamamla
--if @@ERROR = 0
--   commit
--else
--   rollback

--3.Bir tedarikçi eklenirken, ayný iþlemde bu tedarikçiye baðlý bir ürün de eklenir. 
--Eðer herhangi bir adým baþarýsýz olursa, iþlem geri alýnýr.

--select CompanyName, ContactName, ContactTitle, Address, City, Country from Suppliers

--BEGIN TRANSACTION;

---- Tedarikçi ekle
--INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Country)
--VALUES ('Yeni Tedarikçi', 'Ali Veli', 'Satýþ Müdürü', 'Adres 123', 'Ankara', 'Turkey');

---- Yeni eklenen tedarikçiden bir ürün ekle
--INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder)
--VALUES ('Yeni Ürün', SCOPE_IDENTITY(), 1, '10 kutu', 25.00, 100, 0);

--rollback
--commit