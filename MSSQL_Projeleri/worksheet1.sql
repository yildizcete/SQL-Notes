--CREATE KOMUTU (oluþturmak)
--Database ve tablo oluþturmak için kullanýlýr.

create database worksheet

create table worksheet
(kitapID int primary key not null,
kitapAd nvarchar(50) not null,
yazar nvarchar(50) not null,
yayýnEvi nvarchar(50) not null,
fiyat smallmoney not null)

--column name - data type - allow nulls sýrasýna göre sütun oluþturuyorsun.

create database ornekdatabase
on (
name = 'GG_log',
filename = 'D:\GG.ldf',
size = 5,
maxsize = unlimited,
filegrowth = 3
)

log on (
name = 'GG',
filename = 'D:\GG.mdf',
maxsize = 2048gb,
size = 5,
filegrowth = 3
)

/*
on(...) oluþturacaðýmýz veri tabanýnýn özelliklerini sýralarken kullanýrýz
name veritabanýnýn mantýksal(FÝZÝKSEL) ismini belirtir
filename iþletim sistemi üzerinde fiziksel dosya isimlerini belirtir
size baþlangýç boyutunu gösterir
filegrowth veritabaný dosyasýnýn bir seferde ne kadar büyüyeceðini gösterir. MB cinsinden
log dosyasýný oluþturmak için özelliklerin aynýsýný yazýyoruz. Uzantýsý deðiþiyor. 
*/

use worksheet
go
create table ornek_table (
adresID int primary key identity(1,1),
cadde varchar(50) not null,
sokak varchar(50) not null,
number int not null,
il varchar(50),
ilce varchar(50))

/*
Identity, belirlediðimiz kolonun artan þekilde sayý almasýný saðlar. Deðer atama iþlemi otomatikleþmiþ olur. identity( seed, increment)
Seed baþlangýç deðerini gösterir.
Increment kaçar kaçar artacaðýný gösterir.


			PRIMARY KEY & FOREIGN KEY
SQL Serverde iki anahtar çeþidi bulunmaktadýr. Primary key ve foreign key.
Primary Key = Bir tablodaki seçilen deðerleri benzersiz þekilde tanýmlamaya yarar.
Primary Key TSQL ile ekleme þu þekilde yapýlýr;
1. Tablo oluþtururken sütun adý ve veri tipini yazdýktan sonra yanýna primary key yazýyorsun.

2.YOL
1.tabloya sað týk design bölümüne gir
2. sütuna sað týk set primary keye bas

3.YOL
1. Databases diagramstan table oluþturup sütuna sað týk set primary key seçerek yapýlýr.

Foreign Key = (Yabancý anahtar, ikincil anahtar). Bir veri tablosuna girilebilecek deðerleri baþka bir veri tablosundaki alanlarla iliþkilendirmeye yarar.
Foreign Key kullanarark iki veya daha fazla tabloyu bir birine baðlarýz.
TSQL ile eklemeyi anlamadým.
Foreign key atamak için sýrayla þu yollar izlenir.
1. Tabloya sað týk yapýp design bölümüne gir.
2. hangi sütunla baðdaþtýracaksan onun üstüne sað týk yap relationships bölümüne gir.
3. adde bas. tables and columns specificationa bas. hemen yanda üç nokta çýkacak ona bas
4. soldaki kutucuktan table ismini seç. hemen altýnda sütun ismini seç. ayný iþlemi sað kutucuk için de yap.
5. oka bas ve close et.

2.YOL
1. Databases diagramsa sað týk new databases diagrams
2. boþ bir sayfa açýlacak. sað týk new table
3. tablo oluþturup sonrasýnda mouse sol týk basýlý tut çigiler çýkacak. bununla foreign key oluþturuyorsun. 
4. görsellik açýsýndan daha akla yatacak þekilde. kesinlikle kullan.


-----------------------------------

CREATE TABLE Customers (
   CustomerID INT PRIMARY KEY,
   CustomerName VARCHAR(50),
   ContactName VARCHAR(50),
   Country VARCHAR(50)
)

CREATE TABLE Orders (
   OrderID INT PRIMARY KEY,
   OrderDate DATE,
   CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)
--------------------------------

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
--------------------------------------

ALTER TABLE tablo adý
ADD CONSTRAINT foreign key adý
FOREIGN KEY (bu tablodaki sütun adý) 
REFERENCES diðer tablo adý(diðer tablodaki sütun adý)

---------------------------------------------------

ALTER TABLE Orders
ADD CONSTRAINT FK_Customer
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)

Bu komut, "orders" tablosuna "fk_customer" adlý bir yabancý anahtar kýsýtlamasý ekler
ve "customer_id" sütununu "customers" tablosundaki "id" sütunu ile iliþkilendirir.
anladýðým kadarýyla add constraintten sonra yazdýðýn þeyin önemi yok. sadece iþlevine isi vermiþ oluyorsun.

-----------------------------------------------

ALTER TABLE orders
DROP CONSTRAINT fk_customer2;

Yabancý anahtar kýsýtlamalarý ayný þekilde ALTER TABLE komutu kullanýlarak güncellenebilir veya silinebilir.
Örneðin, yabancý anahtar kýsýtlamasýnýn adý "fk_customer2" olan bir kýsýtlama silmek için aþaðýdaki komut kullanýlabilir


-------------------------------------------------

ALTER TABLE child_table
ADD CONSTRAINT FK_name
FOREIGN KEY (child_column) 
REFERENCES parent_table(parent_column);

-----------------------------------------------
