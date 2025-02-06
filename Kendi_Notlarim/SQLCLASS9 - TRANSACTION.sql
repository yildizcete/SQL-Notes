--Transaction: Birden �ok i�lemin bir arada yap�ld��� durumlarda e�er par�ay� olu�turan i�lemlerden herhangi birinde
--sorun olursa t�m i�lemleri iptal etmeyi sa�lar.
--BEGIN TRANSACTION: Bir transaction ba�lat�r.
--COMMIT: Transaction'� ba�ar�yla tamamlar ve de�i�iklikleri kal�c� hale getirir.
--ROLLBACK: Transaction'� iptal eder ve yap�lan de�i�iklikleri geri al�r.

--1.
--begin transaction
--update Stok set Adet = Adet - 10 where UrunID = 1;

---- Kontrol etmek i�in bir ko�ul ekleyelim
--if @@ERROR = 0
--    commit;  -- ��lem ba�ar�l�ysa kaydet
--else
--    rollback; -- Bir hata varsa geri al

--2. Bir m��teri sipari� verdi�inde, sipari� kayd� eklenir ve stok miktar� g�ncellenir. 
--E�er herhangi bir ad�m ba�ar�s�z olursa, i�lem geri al�nmas� i�in transation �rne�i

--begin transaction

---- Sipari� ekleme
--insert into OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
--values (10248, 1, 18.00, 5, 0); 

---- Stok g�ncelleme
--update Products set UnitsInStock = UnitsInStock - 5 where ProductID = 1;

---- Kontrol et ve tamamla
--if @@ERROR = 0
--   commit
--else
--   rollback

--3.Bir tedarik�i eklenirken, ayn� i�lemde bu tedarik�iye ba�l� bir �r�n de eklenir. 
--E�er herhangi bir ad�m ba�ar�s�z olursa, i�lem geri al�n�r.

--select CompanyName, ContactName, ContactTitle, Address, City, Country from Suppliers

--BEGIN TRANSACTION;

---- Tedarik�i ekle
--INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Country)
--VALUES ('Yeni Tedarik�i', 'Ali Veli', 'Sat�� M�d�r�', 'Adres 123', 'Ankara', 'Turkey');

---- Yeni eklenen tedarik�iden bir �r�n ekle
--INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder)
--VALUES ('Yeni �r�n', SCOPE_IDENTITY(), 1, '10 kutu', 25.00, 100, 0);

--rollback
--commit