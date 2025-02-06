--DECLARE FONKSÝYONU

--DECLARE = Bir deðiþken tanýmlamak için kullanýlýr. 
--Bu ifade, geçici olarak veri saklamak ve sorgular sýrasýnda bu veriyi iþlemek için kullanýlýr. 
--Tanýmlanan deðiþken yalnýzca o batch, stored procedure, veya trigger içinde geçerlidir.
--DECLARE @deðiþkenAdý veriTürü

--1.
--declare @isim Nvarchar(10)
--set @isim = N'Yýldýz' -- Unicode desteði için 'N' öneki eklendi
--print @isim

--DECLARE @isim NVARCHAR(50);  
--SET @isim = N'Yýldýz';  -- Unicode desteði için 'N' öneki eklendi

--PRINT 'Ýsim = ' + @isim;  -- "Ýsim = Yýldýz" þeklinde çýktý verir


--2.
--declare @sayi1 int, @sayi2 int, @toplam int

--set @sayi1 = 5
--set @sayi2 = 12
--set @toplam = @sayi1*@sayi2

--print 'toplam = ' + cast(@toplam as varchar(3)) -- bir metinle int deðer cast olmadan birleþemez.
--Birleþmesi için dönüþtürme fonk olarak cast kullanýlýr. ve int metin ifadesine dönüþür

--3.
--declare @minFiyat money
--set @minFiyat = 50

--select ProductName, UnitPrice from Products where UnitPrice > @minFiyat order by UnitPrice

--4.
--declare @ulke varchar(50);  -- Bir ülke deðiþkeni tanýmlandý
--SET @ulke = 'Germany';      -- Deðiþkene deðer atandý

--select SupplierID, CompanyName, Country from Suppliers where Country = @ulke;       -- Deðiþken sorguda kullanýldý

--declare ile geçici tablo oluþturulabilir. 

--declare @Personel table (
--    PersonelID int,
--    Ad varchar(50),
--    Maaþ money,
--    Tarih datetime
--)

-- Veri ekleniyor
--insert into @Personel (PersonelID, Ad, Maaþ, Tarih)
--values (1, 'Ali', 5000.00, '2025-01-01'),
--       (2, 'Veli', 6000.00, '2025-01-05'),
--       (3, 'Ayþe', 7000.00, '2025-01-10')

-- Verileri sorgulama
--select * from @Personel -- select komutunun çalýþmasý için yukardaki kod satýrlarý (create, veri ekleme) görünür olmalý.
