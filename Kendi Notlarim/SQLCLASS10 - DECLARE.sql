--DECLARE FONKS�YONU

--DECLARE = Bir de�i�ken tan�mlamak i�in kullan�l�r. 
--Bu ifade, ge�ici olarak veri saklamak ve sorgular s�ras�nda bu veriyi i�lemek i�in kullan�l�r. 
--Tan�mlanan de�i�ken yaln�zca o batch, stored procedure, veya trigger i�inde ge�erlidir.
--DECLARE @de�i�kenAd� veriT�r�

--1.
--declare @isim Nvarchar(10)
--set @isim = N'Y�ld�z' -- Unicode deste�i i�in 'N' �neki eklendi
--print @isim

--DECLARE @isim NVARCHAR(50);  
--SET @isim = N'Y�ld�z';  -- Unicode deste�i i�in 'N' �neki eklendi

--PRINT '�sim = ' + @isim;  -- "�sim = Y�ld�z" �eklinde ��kt� verir


--2.
--declare @sayi1 int, @sayi2 int, @toplam int

--set @sayi1 = 5
--set @sayi2 = 12
--set @toplam = @sayi1*@sayi2

--print 'toplam = ' + cast(@toplam as varchar(3)) -- bir metinle int de�er cast olmadan birle�emez.
--Birle�mesi i�in d�n��t�rme fonk olarak cast kullan�l�r. ve int metin ifadesine d�n���r

--3.
--declare @minFiyat money
--set @minFiyat = 50

--select ProductName, UnitPrice from Products where UnitPrice > @minFiyat order by UnitPrice

--4.
--declare @ulke varchar(50);  -- Bir �lke de�i�keni tan�mland�
--SET @ulke = 'Germany';      -- De�i�kene de�er atand�

--select SupplierID, CompanyName, Country from Suppliers where Country = @ulke;       -- De�i�ken sorguda kullan�ld�

--declare ile ge�ici tablo olu�turulabilir. 

--declare @Personel table (
--    PersonelID int,
--    Ad varchar(50),
--    Maa� money,
--    Tarih datetime
--)

-- Veri ekleniyor
--insert into @Personel (PersonelID, Ad, Maa�, Tarih)
--values (1, 'Ali', 5000.00, '2025-01-01'),
--       (2, 'Veli', 6000.00, '2025-01-05'),
--       (3, 'Ay�e', 7000.00, '2025-01-10')

-- Verileri sorgulama
--select * from @Personel -- select komutunun �al��mas� i�in yukardaki kod sat�rlar� (create, veri ekleme) g�r�n�r olmal�.
