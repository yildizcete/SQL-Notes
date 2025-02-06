-- IF ELSE YAPISI

--IF (ko�ul)
--BEGIN
--    -- Ko�ul do�ruysa yap�lacak i�lemler
--END
--ELSE
--BEGIN
--    -- Ko�ul yanl��sa yap�lacak i�lemler
--END
--------------------------------------------------------------------
--declare @maas int
--set @maas =4000

-- k�sayolu declare @maas int = 3000

--if @maas>3000
--begin
--	print 'Maa�a zam yapamay�z'
--end 

--else 
--begin
--	print 'Maa��n�za 1000 bila zam yap�lm��t�r'
--end
--------------------------------------------------

--IF (SELECT AVG(Quantity) FROM OrderDetails) > 20
--BEGIN
--    PRINT 'Sipari� say�m�z gayet iyi'
--END
--ELSE
--BEGIN
--    PRINT 'Sipari� say�m�z �ok k�t�'
--END
----------------------------------------------------
--IF EXISTS (SELECT 1 FROM Orders WHERE CustomerID = 'ALFKI')
--BEGIN
--    PRINT 'ALFKI m��terisi sipari� vermi�.'
--END
--ELSE
--BEGIN
--    PRINT 'ALFKI m��terisinin sipari�i yok.'
--END
--------------------------------------------------------
--1.Orders tablosunda belirli bir sipari�in durumu kontrol ediliyor. 
--E�er sipari�in durumu "Shipped" (g�nderildi) ise, kullan�c�ya sipari�in g�nderildi�i bilgisini veriyor.

--DECLARE @OrderID INT = 10248;  -- Sipari� numaras�n� belirliyoruz

--IF EXISTS (SELECT 1 FROM Orders WHERE OrderID = @OrderID)
--BEGIN
--    PRINT 'Sipari� g�nderildi.';
--END
--ELSE
--BEGIN
--    PRINT 'Sipari� hen�z g�nderilmedi.';
--END
-----------------------------------------------------------------------------------------------------------------
--use AdventureWorks2017
--1.Production.Product tablosunda ID'si = 326 olan �r�n�n sto�u 1000'den b�y�kse "�r�n�n sto�u y�ksek" yazd�r�lacak. 
--E�er sto�u 500 ile 999 aras�ndaysa "�r�n�n sto�u ideal seviyede" yazd�r�lacak. 
--E�er her iki ko�ul da sa�lanm�yorsa, "�r�n�n sto�u yetersiz" yazd�r�lacak.

--declare @urunID int = 326
--declare @stok int

--select @stok = SafetyStockLevel from Production.Product where ProductID = @urunID

--if @stok>=1000
--begin
--	print '�r�n sto�u y�ksek'
--end
--else if @stok>=500 and @stok<1000
--begin
--	print '�r�n sto�u normal'
--end
--else
--begin
--	print '�r�n sto�u yetersiz'
--end
---------------------------------------------------
--if exists(select 1 from Production.Product where ProductID = 326 and  SafetyStockLevel>=1000)
--begin
--	print '<�r�n sto�u y�ksek'
--end
--else
--begin 
--	print '�r�n sto�u y�ksek de�il'
--end

--2.HumanResources.Employee tablosundaki bir departman ID'sine g�re, departmanda �al��an say�s�n�n 10'dan fazla olup olmad��� kontrol edilecek.
--declare @calisanSayi int
--select @calisanSayi = Count(DepartmentID ) from HumanResources.EmployeeDepartmentHistory where DepartmentID=7

--if (@calisanSayi > 10)
--begin
--	print 'Departmanda �al��an say�s� 10dan fazla'
--end
--else
--begin
--	print 'Departmanda �al��an say�s� 10dan az'
--end

--3.Production.Product tablosunda bir �r�n ID'sine g�re, �r�n�n stok durumu kontrol edilecek:
--E�er stok 0 ise "Stok t�kenmi�" yazd�r�lacak.
--E�er stok 1-10 aras�nda ise "Stok az" yazd�r�lacak.
--Stok 10'dan fazla ise "Stok yeterli" yazd�r�lacak.

--declare @urunID int, @stok int
--set @urunID = 510
--select @stok = SafetyStockLevel from Production.Product where ProductID =  @urunID

--if @stok>=1000
--begin
--	print '�r�n sto�u y�ksek'
--end
--else if @stok>=500 and @stok<1000
--begin
--	print '�r�n sto�u normal'
--end
--else
--begin
--	print '�r�n sto�u yetersiz'
--end

--4.Production.Product, Categories
--Bir �r�n ID'sine g�re, �r�n�n kategorisi "Beverages" ve stok durumu 0 ise "Beverage �r�n� t�kenmi�" yazd�r�lacak.

--5.HumanResources.Employee, HumanResources.EmployeePayHistory
--Bir �al��an ID'sine g�re, �al��an�n maa� de�i�im ge�mi�ine bakarak terfi durumu hakk�nda bir de�erlendirme yap�n.
--E�er �al��an son 6 ay i�inde maa��nda %10'dan fazla art�� ya�am��sa "Terfi ald�" yazd�r�n.
--E�er �al��an son 6 ayda maa� art��� olmam��sa "Terfi almad�" yazd�r�n.
--E�er maa� art��� %5 ile %10 aras�nda ise "Orta d�zey terfi" yazd�r�n.

--6.HumanResources.Employee, HumanResources.EmployeePayHistory, Sales.SalesOrderHeader
--Bir �al��an ID'sine g�re, �al��an�n sat�� verisi ile maa� ge�mi�ini kar��la�t�rarak performans�n� de�erlendirin.
--E�er �al��an�n son 6 ayda satt��� �r�nlerden elde etti�i gelir 50.000 birimi a�m��sa ve maa��nda %10 art�� olmu�sa "Performans y�ksek, terfi bekleniyor" yazd�r�n.
--E�er sat��lar� 50.000 birimden azsa ama maa�� artm��sa "Orta performans, terfi" yazd�r�n.
--E�er sat��lar� azsa ve maa�� de�i�memi�se "D���k performans" yazd�r�n.

--use northwinds
--7.Products, Categories
--Bir �r�n ID'sine g�re e�er �r�n kategorisi "Beverages" (��ecekler) ve fiyat� 15'ten fazla ise "Pahal� i�ecek" yazd�r�lacak.
--E�er fiyat 15 veya daha azsa ve kategori "Beverages" ise "Uygun fiyatl� i�ecek" yazd�r�lacak.
--Farkl� bir kategorideyse "Farkl� kategori" yazd�r�lacak.

--8.Products, Categories, OrderDetails
--Bir �r�n ID'sine g�re, e�er �r�n "Beverages" kategorisinde ve sipari� say�s� 100'den fazla ise "Pop�ler i�ecek" yazd�r�lacak.

--9.Orders, Employees
--Bir �al��an ID'sine g�re, �al��an "Shipped" durumunda sipari�leri varsa "Sipari�leri g�ndermi�" yazd�r�lacak, aksi takdirde "Sipari� g�ndermemi�" yazd�r�lacak.

--10.Orders, OrderDetails
--Bir sipari� ID'sine g�re, sipari�in teslimat durumunu kontrol edin.
--E�er sipari�in teslimat tarihi, sipari� tarihinden 7 g�n sonra ger�ekle�mi�se ve sipari� "Shipped" durumunda ise "H�zl� Teslimat" yazd�r�n.
--E�er teslimat tarihi, sipari� tarihinden 7 g�n sonra ger�ekle�memi�se ve sipari� "Shipped" durumunda ise "Normal Teslimat" yazd�r�n.
--E�er sipari� "Pending" durumundaysa "Teslimat Bekleniyor" yazd�r�n.