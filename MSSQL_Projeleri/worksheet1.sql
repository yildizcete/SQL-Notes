--CREATE KOMUTU (olu�turmak)
--Database ve tablo olu�turmak i�in kullan�l�r.

create database worksheet

create table worksheet
(kitapID int primary key not null,
kitapAd nvarchar(50) not null,
yazar nvarchar(50) not null,
yay�nEvi nvarchar(50) not null,
fiyat smallmoney not null)

--column name - data type - allow nulls s�ras�na g�re s�tun olu�turuyorsun.

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
on(...) olu�turaca��m�z veri taban�n�n �zelliklerini s�ralarken kullan�r�z
name veritaban�n�n mant�ksal(F�Z�KSEL) ismini belirtir
filename i�letim sistemi �zerinde fiziksel dosya isimlerini belirtir
size ba�lang�� boyutunu g�sterir
filegrowth veritaban� dosyas�n�n bir seferde ne kadar b�y�yece�ini g�sterir. MB cinsinden
log dosyas�n� olu�turmak i�in �zelliklerin ayn�s�n� yaz�yoruz. Uzant�s� de�i�iyor. 
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
Identity, belirledi�imiz kolonun artan �ekilde say� almas�n� sa�lar. De�er atama i�lemi otomatikle�mi� olur. identity( seed, increment)
Seed ba�lang�� de�erini g�sterir.
Increment ka�ar ka�ar artaca��n� g�sterir.


			PRIMARY KEY & FOREIGN KEY
SQL Serverde iki anahtar �e�idi bulunmaktad�r. Primary key ve foreign key.
Primary Key = Bir tablodaki se�ilen de�erleri benzersiz �ekilde tan�mlamaya yarar.
Primary Key TSQL ile ekleme �u �ekilde yap�l�r;
1. Tablo olu�tururken s�tun ad� ve veri tipini yazd�ktan sonra yan�na primary key yaz�yorsun.

2.YOL
1.tabloya sa� t�k design b�l�m�ne gir
2. s�tuna sa� t�k set primary keye bas

3.YOL
1. Databases diagramstan table olu�turup s�tuna sa� t�k set primary key se�erek yap�l�r.

Foreign Key = (Yabanc� anahtar, ikincil anahtar). Bir veri tablosuna girilebilecek de�erleri ba�ka bir veri tablosundaki alanlarla ili�kilendirmeye yarar.
Foreign Key kullanarark iki veya daha fazla tabloyu bir birine ba�lar�z.
TSQL ile eklemeyi anlamad�m.
Foreign key atamak i�in s�rayla �u yollar izlenir.
1. Tabloya sa� t�k yap�p design b�l�m�ne gir.
2. hangi s�tunla ba�da�t�racaksan onun �st�ne sa� t�k yap relationships b�l�m�ne gir.
3. adde bas. tables and columns specificationa bas. hemen yanda �� nokta ��kacak ona bas
4. soldaki kutucuktan table ismini se�. hemen alt�nda s�tun ismini se�. ayn� i�lemi sa� kutucuk i�in de yap.
5. oka bas ve close et.

2.YOL
1. Databases diagramsa sa� t�k new databases diagrams
2. bo� bir sayfa a��lacak. sa� t�k new table
3. tablo olu�turup sonras�nda mouse sol t�k bas�l� tut �igiler ��kacak. bununla foreign key olu�turuyorsun. 
4. g�rsellik a��s�ndan daha akla yatacak �ekilde. kesinlikle kullan.


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

ALTER TABLE tablo ad�
ADD CONSTRAINT foreign key ad�
FOREIGN KEY (bu tablodaki s�tun ad�) 
REFERENCES di�er tablo ad�(di�er tablodaki s�tun ad�)

---------------------------------------------------

ALTER TABLE Orders
ADD CONSTRAINT FK_Customer
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)

Bu komut, "orders" tablosuna "fk_customer" adl� bir yabanc� anahtar k�s�tlamas� ekler
ve "customer_id" s�tununu "customers" tablosundaki "id" s�tunu ile ili�kilendirir.
anlad���m kadar�yla add constraintten sonra yazd���n �eyin �nemi yok. sadece i�levine isi vermi� oluyorsun.

-----------------------------------------------

ALTER TABLE orders
DROP CONSTRAINT fk_customer2;

Yabanc� anahtar k�s�tlamalar� ayn� �ekilde ALTER TABLE komutu kullan�larak g�ncellenebilir veya silinebilir.
�rne�in, yabanc� anahtar k�s�tlamas�n�n ad� "fk_customer2" olan bir k�s�tlama silmek i�in a�a��daki komut kullan�labilir


-------------------------------------------------

ALTER TABLE child_table
ADD CONSTRAINT FK_name
FOREIGN KEY (child_column) 
REFERENCES parent_table(parent_column);

-----------------------------------------------
