--DDL (CREATE - ALTER - DROP)

--Database ve Tablo için
--CREATE = OLUŞTUR
--ALTER = GÜNCELLE (ALTER-ALTER, ALTER-ADD, ALTER-DROP)
--DROP = SİL (ALTER-DROP, DROP)

--CREATE: Database ve tablo oluşturur.
--ALTER: Tabloda güncelleme (sütun ekleme, sütun silme, sütunun veri tipini değiştirme, sütuna kısıtlama ekleme) yapmak için kullanılır.
--DROP: Database, tablo ve sütun siler.

--IDENTITY: SQL'de bir sütunun otomatik olarak artan bir sayı ile doldurulmasını sağlar.
--IDENTITY(başlangıç_değeri, artış_miktarı). Tabloda ID sütunu oluştururken identity özelliği kullanılır.

--PRIMARY KEY: Bir tablodaki her satırı benzersiz şekilde tanımlayan sütundur. NOT NULL ve UNIQUE
--Aynı değerden birden fazla olamaz (UNIQUE olmalıdır). NULL değer içeremez.
--FOREIGN KEY: Bir tablonun başka bir tablodaki birincil anahtarına (Primary Key) bağlanmasını sağlar.

--UNIQUE: bir sütunda her değerin yalnızca bir kez bulunmasını sağlar. 
--Yani, UNIQUE kısıtlaması, sütundaki her değerin benzersiz (tekrarsız) olmasını zorunlu kılar.
--------------------------------------------------------------------------------------------------------------------
--create database OgrenciBilgileri

--use OgrenciBilgileri

-- create table OgrenciTablosu(
--    ogrno int primary key,
--    ogrsoyadi varchar(20), 
--    ogradres varchar(50) check (ogradres in('İstanbul', 'Ankara', 'Antalya')), -- sadece bu üç şehirden birini girebilir.
--    ogrsinif varchar(2),
--    ogrilce varchar(20) default 'seyhan', --varsayılan değer 'seyhan'. Değer girilmezse ilçeye seyhan olarak atayacak.
--    ogrsinav1 tinyint check (ogrsinav1 > 0), -- Sınav notu 0'dan büyük olmalı.
--    ogrsinav2 int, -- Sınav 2
--    constraint chks check (ogrsinav2 >= 0 and ogrsinav2 <= 100)) -- Sınav2 değeri 0-100 aralığında olmalı.
--	  Diğer checkten farklı olarak kısıtlamaya ad vermiş. sonrasında üzerinde değişiklik yapabilsin diye.

--alter table OgrenciTablosu 
--add matNotu tinyint --sütun ekleme

--alter table OgreniTablosu 
--add check (ogrSinif<=12) -- tabloya bir kısıtlama ekledi.

--alter table OgrenciTablosu 
--alter column matNotu smallint -- matNotu sütunun veri tipini değiştirdi.

--alter table OgrenciTablosu 
--drop column OgrSinifi -- OgrTablosu'ndaki ogrSinifi sütununu sildi.

--alter table Customers 
--add constraint PK_Customers PRIMARY KEY (CustomerID) -- sütuna primary key ekleme

--alter table Orders 
--add constraint FK_Orders_Customers FOREIGN KEY (CustomerID) 
--references Customers(CustomerID)

--ALTER TABLE Products
--DROP CONSTRAINT DF_Products_UnitPrice -- kısıtlama kaldırmak için

--drop database ornek1 -- database'i siler.
--drop table OgrenciBilgileri -- tabloyu siler
--alter table OgrenciTablosu drop column OgrSinifi -- OgrTablosu'ndaki ogrSinifi sütununu sildi.

--ÖRNEK SORULAR

--SORU1. Customers tablosundaki CustomerIDyi PRIMARY KEY yap.
--alter table Customers
--add constraint PK_Customers PRIMARY KEY(CustomerID)

--SORU2. CRM veritabanında CustomerHistory adında bir tablo oluşturun. Bu tablo aşağıdaki sütunları içermelidir:
--HistoryID (int, primary key, identity)
--CustomerID (int, foreign key olarak Customers tablosuna bağlanmalı)
--Action (nvarchar(100))
--ActionDate (datetime, varsayılan olarak GETDATE() atanmalı)

--create table CustomerHistory(
--HistoryID int identity(1,1) primary key,
--CustomerID int not null,
--CustomerMail varchar(50) UNIQUE, -- aynı değeri iki kere girmemizi engelleyecek.
--CustomerAction varchar(50),
--ActionDate datetime default getdate()
--constraint FK_Customers_CustomerHistory foreign key(CustomerID)
--references Customers(CustomerID)
--)

--SORU3. Customers tablosuna CustomerType adında bir VARCHAR(20) veri tipinde yeni bir sütun ekleyin.
--alter table Customers
--add CustomerType varchar(20)

--SORU4. Customers tablosundaki CustomerType sütununu silin.
--alter table Customers drop column CustomerType

--SORU5. Customers tablosundaki Phone sütununun veri tipini VARCHAR(50) olarak değiştirin.
--alter table Customers 
--alter column Phone varchar(50)

--SORU6. CRM databaseindeki Customers tablosunun ismini Insanciklar diye değiştir.
--EXEC sp_rename 'Customers', 'Insanlar'
--EXEC sp_rename 'CustomerHistory', 'InsanlarinHikayesi'

--SORU7. Insanlar tablosundaki CustomerName sütununun NOT NULL olmasını sağlayan bir kısıtlama ekleyin.
--alter table Insanlar
--alter column CustomerName varchar(50) not null -- normal veri türü neyse onu yazdım. 

--SORU8. CRM veritabanındaki CustomerArchive adlı tabloyu tamamen silin.
--drop table CustomerArchive

--SORU9. Customers tablosundaki tüm verileri silin, ancak tablo yapısını koruyun.
--delete from Customers

--SORU10. Insanlar tablosundaki Mail sütunu UNIQUE yap.
--alter table Insanlar
--add constraint Unique_Mail UNIQUE(Mail)

--SORU11. Orders tablosundaki OrderDate sütununa CHECK kısıtlaması ekleyin, böylece tarih 2020 yılına ait olmalıdır.
--ALTER TABLE Orders 
--add constraint CK_Orders_OrderDate check(year(OrderDate) = 2020)

--SORU12. Products tablosunda, UnitPrice sütununun veri tipini DECIMAL(10,2) olarak değiştirin. 
--Aynı zamanda, Description sütununun maksimum uzunluğunu 500 karakter yapın.

--alter table Products
--alter column Unitprice decimal(10,2) -- bu sütunda bu iki kısıtlama olduğu için veri tipini değiştirmedi.
--DF_Products_UnitPrice, CK_Products_UnitPrice. bunları kaldırıp veri tipini değiştirip tekrar kısıtlamayı ekleyebiliriz.
--tablodan ise direkt değişiyor. problem çıkarmadı.

--SORU13. Orders tablosunda TotalAmount sütununda tanımlı olan bir CHECK kısıtlamasını kaldırın.
--alter table Orders
--drop constraint CK_Orders_TotalAmount 

--SORU14. AdventureWorks2017 veritabanındaki Employee tablosunu silmeden önce, tablodaki tüm veriyi başka bir geçici tabloya taşıyın. 
--Geçici tabloyu "Employee_Backup" olarak adlandırın ve ardından Employee tablosunu silin.
--select * into Employees_Backup from Employees
--drop table Employees 

--SORU15. Northwind veritabanındaki Customers tablosunda, "City" ve "Country" sütunları üzerinde bir indeks oluşturun.
--create index idx_Customers_City_Country 
--on Customers(City, Country)

--SORU16.Northwind veritabanındaki Orders tablosuna yeni bir sütun ekleyin: "ShipDate" (gemiye sevk tarihi).
--Ayrıca, ShipDate sütununa bir indeks oluşturun.
--alter table Orders 
--add ShipDate datetime

--create index idx_Orders_ShipDate
--on Orders(ShipDate)

--SORU17. AdventureWorks2017 veritabanında yeni bir tablo oluşturun: SalesRegion. Bu tablo, aşağıdaki sütunları içerecek:
--RegionID (int, PRIMARY KEY)
--RegionName (varchar(10))
--ManagerID (int, FOREIGN KEY, EmployeeID tablosuna bağlı)
--Ayrıca, SalesRegion tablosunda ManagerID üzerinde bir UNIQUE kısıtlaması ekleyin.

--create table SalesRegion(
--RegionID int PRIMARY KEY,
--RegionName varchar(10),
--ManagerID int UNIQUE
--constraint FK_SalesRegion_Employees foreign key(ManagerID) 
--references Employees(EmployeeID)
--)

--SORU18. Northwind veritabanındaki Orders tablosunda, OrderDate sütunu üzerinde bir Check kısıtlaması ekleyin. 
--Bu kısıtlama, OrderDate'in yalnızca 1990 ile 2025 yılları arasında bir tarih olmasına izin verecek. 
--alter table Orders
--add constraint CK_OrderDate check(year(OrderDate)>= 1990 and year(OrderDate)<=2025)

--SORU19. Northwinds veritabanında, ProductReview adında yeni bir tablo oluşturun. Bu tablo şu sütunları içerecek:
--ReviewID (int, PRIMARY KEY)
--ProductID (int, FOREIGN KEY, Product tablosuna bağlı)
--ReviewDate (datetime) default 'text yok'
--Rating (int, CHECK (Rating BETWEEN 1 AND 5))
--ReviewText (nvarchar(500))
--Tablonun doğru şekilde ilişkilendirilmesi için, ProductID sütununa bir FOREIGN KEY kısıtlaması ekleyin 
--ve Rating sütunu üzerinde bir CHECK kısıtlaması ekleyin.

--create table ProductReview (
--ReviewID int PRIMARY KEY,
--ProductID int,
--ReviewDate datetime,
--Rating int check(Rating between 1 and 5),
--ReviewText nvarchar(100) default 'Text yok'
--constraint FK_ProductReview_Products foreign key(ProductID)
--references Products(ProductID)
--)
--check kısıtlamasını kolayca sütunun yanına yazarak ekledim. checke isim verip yapmak istediğimde;
--constraint CK_Rating check(Rating between 1 and 5) yazardım alta

--SORU20. Northwind veritabanındaki Orders tablosuna yeni bir sütun ekleyin: ShippingCost (decimal(10, 2)). Bu sütun, her siparişin taşıma ücretini tutacak. 
--Sonrasında, tüm mevcut siparişler için ShippingCost sütununa 50.00 değerini atayın.

--alter table Orders
--add ShippingCost decimal(10,2) 

--update Orders
--set ShippingCost = 50.00

--SORU21. Region sütununa default varsayılan bölgeyi asya olarak ekle. 
--alter table Customers
--add constraint default_region default 'Asya' for Region -- sayı olsaydı default 0 şeklinde yazardın.

-- DEFAULT kısıtlaması yalnızca yeni eklenen veriler için geçerlidir. 
--Yani, mevcut satırlarda Region sütunu NULL ise, bu komut onları otomatik olarak 'Asya'ya dönüştürmez. 
--Sadece yeni satırlarda Region sütununa bir değer eklenmediği takdirde 'Asya' değeri atanır.
--Mevcut NULL değerleri için 'Asya'ya dönüştürmek istiyorsan, önce bir UPDATE sorgusu çalıştırman gerekir.
--UPDATE Customers
--SET Region = 'Asya'
--WHERE Region IS NULL;
