--DDL (CREATE - ALTER - DROP)

--Database ve Tablo i�in
--CREATE = OLU�TUR
--ALTER = G�NCELLE (ALTER-ALTER, ALTER-ADD, ALTER-DROP)
--DROP = S�L (ALTER-DROP, DROP)

--CREATE: Database ve tablo olu�turur.
--ALTER: Tabloda g�ncelleme (s�tun ekleme, s�tun silme, s�tunun veri tipini de�i�tirme, s�tuna k�s�tlama ekleme) yapmak i�in kullan�l�r.
--DROP: Database, tablo ve s�tun siler.

--IDENTITY: SQL'de bir s�tunun otomatik olarak artan bir say� ile doldurulmas�n� sa�lar.
--IDENTITY(ba�lang��_de�eri, art��_miktar�). Tabloda ID s�tunu olu�tururken identity �zelli�i kullan�l�r.

--PRIMARY KEY: Bir tablodaki her sat�r� benzersiz �ekilde tan�mlayan s�tundur. NOT NULL ve UNIQUE
--Ayn� de�erden birden fazla olamaz (UNIQUE olmal�d�r). NULL de�er i�eremez.
--FOREIGN KEY: Bir tablonun ba�ka bir tablodaki birincil anahtar�na (Primary Key) ba�lanmas�n� sa�lar.

--UNIQUE: bir s�tunda her de�erin yaln�zca bir kez bulunmas�n� sa�lar. 
--Yani, UNIQUE k�s�tlamas�, s�tundaki her de�erin benzersiz (tekrars�z) olmas�n� zorunlu k�lar.
--------------------------------------------------------------------------------------------------------------------
--create database OgrenciBilgileri

--use OgrenciBilgileri

-- create table OgrenciTablosu(
--    ogrno int primary key,
--    ogrsoyadi varchar(20), 
--    ogradres varchar(50) check (ogradres in('�stanbul', 'Ankara', 'Antalya')), -- sadece bu �� �ehirden birini girebilir.
--    ogrsinif varchar(2),
--    ogrilce varchar(20) default 'seyhan', --varsay�lan de�er 'seyhan'. De�er girilmezse il�eye seyhan olarak atayacak.
--    ogrsinav1 tinyint check (ogrsinav1 > 0), -- S�nav notu 0'dan b�y�k olmal�.
--    ogrsinav2 int, -- S�nav 2
--    constraint chks check (ogrsinav2 >= 0 and ogrsinav2 <= 100)) -- S�nav2 de�eri 0-100 aral���nda olmal�.
--	  Di�er checkten farkl� olarak k�s�tlamaya ad vermi�. sonras�nda �zerinde de�i�iklik yapabilsin diye.

--alter table OgrenciTablosu 
--add matNotu tinyint --s�tun ekleme

--alter table OgreniTablosu 
--add check (ogrSinif<=12) -- tabloya bir k�s�tlama ekledi.

--alter table OgrenciTablosu 
--alter column matNotu smallint -- matNotu s�tunun veri tipini de�i�tirdi.

--alter table OgrenciTablosu 
--drop column OgrSinifi -- OgrTablosu'ndaki ogrSinifi s�tununu sildi.

--alter table Customers 
--add constraint PK_Customers PRIMARY KEY (CustomerID) -- s�tuna primary key ekleme

--alter table Orders 
--add constraint FK_Orders_Customers FOREIGN KEY (CustomerID) 
--references Customers(CustomerID)

--ALTER TABLE Products
--DROP CONSTRAINT DF_Products_UnitPrice -- k�s�tlama kald�rmak i�in

--drop database ornek1 -- database'i siler.
--drop table OgrenciBilgileri -- tabloyu siler
--alter table OgrenciTablosu drop column OgrSinifi -- OgrTablosu'ndaki ogrSinifi s�tununu sildi.

--�RNEK SORULAR

--SORU1. Customers tablosundaki CustomerIDyi PRIMARY KEY yap.
--alter table Customers
--add constraint PK_Customers PRIMARY KEY(CustomerID)

--SORU2. CRM veritaban�nda CustomerHistory ad�nda bir tablo olu�turun. Bu tablo a�a��daki s�tunlar� i�ermelidir:
--HistoryID (int, primary key, identity)
--CustomerID (int, foreign key olarak Customers tablosuna ba�lanmal�)
--Action (nvarchar(100))
--ActionDate (datetime, varsay�lan olarak GETDATE() atanmal�)

--create table CustomerHistory(
--HistoryID int identity(1,1) primary key,
--CustomerID int not null,
--CustomerMail varchar(50) UNIQUE, -- ayn� de�eri iki kere girmemizi engelleyecek.
--CustomerAction varchar(50),
--ActionDate datetime default getdate()
--constraint FK_Customers_CustomerHistory foreign key(CustomerID)
--references Customers(CustomerID)
--)

--SORU3. Customers tablosuna CustomerType ad�nda bir VARCHAR(20) veri tipinde yeni bir s�tun ekleyin.
--alter table Customers
--add CustomerType varchar(20)

--SORU4. Customers tablosundaki CustomerType s�tununu silin.
--alter table Customers drop column CustomerType

--SORU5. Customers tablosundaki Phone s�tununun veri tipini VARCHAR(50) olarak de�i�tirin.
--alter table Customers 
--alter column Phone varchar(50)

--SORU6. CRM databaseindeki Customers tablosunun ismini Insanciklar diye de�i�tir.
--EXEC sp_rename 'Customers', 'Insanlar'
--EXEC sp_rename 'CustomerHistory', 'InsanlarinHikayesi'

--SORU7. Insanlar tablosundaki CustomerName s�tununun NOT NULL olmas�n� sa�layan bir k�s�tlama ekleyin.
--alter table Insanlar
--alter column CustomerName varchar(50) not null -- normal veri t�r� neyse onu yazd�m. 

--SORU8. CRM veritaban�ndaki CustomerArchive adl� tabloyu tamamen silin.
--drop table CustomerArchive

--SORU9. Customers tablosundaki t�m verileri silin, ancak tablo yap�s�n� koruyun.
--delete from Customers

--SORU10. Insanlar tablosundaki Mail s�tunu UNIQUE yap.
--alter table Insanlar
--add constraint Unique_Mail UNIQUE(Mail)

--SORU11. Orders tablosundaki OrderDate s�tununa CHECK k�s�tlamas� ekleyin, b�ylece tarih 2020 y�l�na ait olmal�d�r.
--ALTER TABLE Orders 
--add constraint CK_Orders_OrderDate check(year(OrderDate) = 2020)

--SORU12. Products tablosunda, UnitPrice s�tununun veri tipini DECIMAL(10,2) olarak de�i�tirin. 
--Ayn� zamanda, Description s�tununun maksimum uzunlu�unu 500 karakter yap�n.

--alter table Products
--alter column Unitprice decimal(10,2) -- bu s�tunda bu iki k�s�tlama oldu�u i�in veri tipini de�i�tirmedi.
--DF_Products_UnitPrice, CK_Products_UnitPrice. bunlar� kald�r�p veri tipini de�i�tirip tekrar k�s�tlamay� ekleyebiliriz.
--tablodan ise direkt de�i�iyor. problem ��karmad�.

--SORU13. Orders tablosunda TotalAmount s�tununda tan�ml� olan bir CHECK k�s�tlamas�n� kald�r�n.
--alter table Orders
--drop constraint CK_Orders_TotalAmount 

--SORU14. AdventureWorks2017 veritaban�ndaki Employee tablosunu silmeden �nce, tablodaki t�m veriyi ba�ka bir ge�ici tabloya ta��y�n. 
--Ge�ici tabloyu "Employee_Backup" olarak adland�r�n ve ard�ndan Employee tablosunu silin.
--select * into Employees_Backup from Employees
--drop table Employees 

--SORU15. Northwind veritaban�ndaki Customers tablosunda, "City" ve "Country" s�tunlar� �zerinde bir indeks olu�turun.
--create index idx_Customers_City_Country 
--on Customers(City, Country)

--SORU16.Northwind veritaban�ndaki Orders tablosuna yeni bir s�tun ekleyin: "ShipDate" (gemiye sevk tarihi).
--Ayr�ca, ShipDate s�tununa bir indeks olu�turun.
--alter table Orders 
--add ShipDate datetime

--create index idx_Orders_ShipDate
--on Orders(ShipDate)

--SORU17. AdventureWorks2017 veritaban�nda yeni bir tablo olu�turun: SalesRegion. Bu tablo, a�a��daki s�tunlar� i�erecek:
--RegionID (int, PRIMARY KEY)
--RegionName (varchar(10))
--ManagerID (int, FOREIGN KEY, EmployeeID tablosuna ba�l�)
--Ayr�ca, SalesRegion tablosunda ManagerID �zerinde bir UNIQUE k�s�tlamas� ekleyin.

--create table SalesRegion(
--RegionID int PRIMARY KEY,
--RegionName varchar(10),
--ManagerID int UNIQUE
--constraint FK_SalesRegion_Employees foreign key(ManagerID) 
--references Employees(EmployeeID)
--)

--SORU18. Northwind veritaban�ndaki Orders tablosunda, OrderDate s�tunu �zerinde bir Check k�s�tlamas� ekleyin. 
--Bu k�s�tlama, OrderDate'in yaln�zca 1990 ile 2025 y�llar� aras�nda bir tarih olmas�na izin verecek. 
--alter table Orders
--add constraint CK_OrderDate check(year(OrderDate)>= 1990 and year(OrderDate)<=2025)

--SORU19. Northwinds veritaban�nda, ProductReview ad�nda yeni bir tablo olu�turun. Bu tablo �u s�tunlar� i�erecek:
--ReviewID (int, PRIMARY KEY)
--ProductID (int, FOREIGN KEY, Product tablosuna ba�l�)
--ReviewDate (datetime) default 'text yok'
--Rating (int, CHECK (Rating BETWEEN 1 AND 5))
--ReviewText (nvarchar(500))
--Tablonun do�ru �ekilde ili�kilendirilmesi i�in, ProductID s�tununa bir FOREIGN KEY k�s�tlamas� ekleyin 
--ve Rating s�tunu �zerinde bir CHECK k�s�tlamas� ekleyin.

--create table ProductReview (
--ReviewID int PRIMARY KEY,
--ProductID int,
--ReviewDate datetime,
--Rating int check(Rating between 1 and 5),
--ReviewText nvarchar(100) default 'Text yok'
--constraint FK_ProductReview_Products foreign key(ProductID)
--references Products(ProductID)
--)
--check k�s�tlamas�n� kolayca s�tunun yan�na yazarak ekledim. checke isim verip yapmak istedi�imde;
--constraint CK_Rating check(Rating between 1 and 5) yazard�m alta

--SORU20. Northwind veritaban�ndaki Orders tablosuna yeni bir s�tun ekleyin: ShippingCost (decimal(10, 2)). Bu s�tun, her sipari�in ta��ma �cretini tutacak. 
--Sonras�nda, t�m mevcut sipari�ler i�in ShippingCost s�tununa 50.00 de�erini atay�n.

--alter table Orders
--add ShippingCost decimal(10,2) 

--update Orders
--set ShippingCost = 50.00

--SORU21. Region s�tununa default varsay�lan b�lgeyi asya olarak ekle. 
--alter table Customers
--add constraint default_region default 'Asya' for Region -- say� olsayd� default 0 �eklinde yazard�n.

-- DEFAULT k�s�tlamas� yaln�zca yeni eklenen veriler i�in ge�erlidir. 
--Yani, mevcut sat�rlarda Region s�tunu NULL ise, bu komut onlar� otomatik olarak 'Asya'ya d�n��t�rmez. 
--Sadece yeni sat�rlarda Region s�tununa bir de�er eklenmedi�i takdirde 'Asya' de�eri atan�r.
--Mevcut NULL de�erleri i�in 'Asya'ya d�n��t�rmek istiyorsan, �nce bir UPDATE sorgusu �al��t�rman gerekir.
--UPDATE Customers
--SET Region = 'Asya'
--WHERE Region IS NULL;
