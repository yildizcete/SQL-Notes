use workpage
/*
		ALTER KOMUTU 
tablo g�ncelle�tirmek i�in iki y�ntem var;
1.Design b�l�m�nden silebiliriz
2. alter komutuyla silebiliriz
tablodaki verileri de�il (onu udate ile yap�yoruz) tabloyu g�ncelle�tirmek istersek tablonun �st�ne sa� t�kla design se�ene�inden yap.
tabloyu g�ncelle�tirmekten kas�t yeni s�tun ekleme veri tipini de�i�tirme gibi...
yeni bir s�tun ekledi�inde hata vermemesi i�in allow nulls se�ene�ini i�aretle. 
alter nesneyi g�nceller update veriyi g�nceller
*/

alter table workpagetable add ogrenci_maili nvarchar(150), 
ogrenci_kay�t datetime not null default getdate()
-- default varsay�lan de�er demek. kullan�c� oray� bo� ge�ti�i zaman sistem otomatik dolduruyor. �stteki kullan�m �eklinde ��renci tarih girmedi�i takdirde bug�n�n tarihini girer.
--getdate() bug�n�n tarihini ve saatini g�stermek i�in kullan�l�r
alter table workpagetable alter column sayfaSayisi int 
 --sayfaSayisi s�tunundaki smallint verisini int olarak de�i�tirdik.


 /*
		DROP KOMUTU
Tablodaki s�tunu veya tablonun kendisini silmek i�in kullan�l�r.
silme i�lemi i�in iki y�ntem vard�r;
1. tabloyu silmek i�in tabloya sa� t�klay�p delete basarak silebiliriz. S�tunu silmek i�in design b�l�m�nden yap�yoruz.
2. drop komutuyla silebiliriz.

*/
drop table table_1 
-- table_1 tablosunu sildi

alter table workpagetable drop column puan 

/* 
		GO KOMUTU
�ki farkl� i�levi var;
1.Yazd���m�z komutlar�n birbirinden ba��ms�z oldu�unu sisteme g�stermek i�in kullan�l�r. Aksi taktirde kod hata verir.
2.Komutu istedi�in say�da �al��t�rabilir.

*/

create database ornekdatabase
go
use ornekdatabase
go
create table ornektable (
sayi int,
renk nvarchar(50),
boy smallint,
para smallmoney not null)

-- �nce database olu�turduk sonra olu�turdu�umuz database'i se�ip tablo ekledik.

insert ornektable                    --tabloyu belirt
select '1', 'e', '7', '8'            -- verileri yaz
go 5                                 -- ka� kere �al��t�rmak istedi�ini yaz


/*
		DECLARE KOMUTU (tan�mlamak)

De�i�ken tan�mlamak i�in kullan�l�r. De�i�kenin ad�n�n ba��na @ getirmek zorunlu
Set ifadesi ile de�er atama yap�l�r.

*/
declare @sehir varchar(20) -- sehir ad�nda de�i�ken tan�mlad�k
declare @ilce varchar(20)
set @sehir = 'Malatya'     -- �ehir de�i�kenine malatya ifadesini atad�k
set @ilce = 'Darende'
select @sehir              -- ekrana tablo �eklinde yazd�rd�k
print @sehir               -- ekrana normla bi �ekilde ifadeyi yazd�rd�k
print @sehir + ' / ' + @ilce


		--PR�NT KOMUTU
--Ekrana ifade yazd�rmak i�in kullan�l�r.

print 'SQL ��REEN�YORUMM'
select 'SQL ��REEN�YORUMM'

declare @degisken varchar(10) = 'y�ld�z'
print @degisken


		--NEWID KOMUTU
-- NewID() komut ile veritaban�nda rasgele kay�t �ekme i�lemlerimizi ger�ekle�tirebiliyoruz. 

-- Makaleler tablosunda bulunan t�m kay�tlar� rastgele listeleyelim.

Select * From Makaleler Order By NewID() 

--Makaleler tablosunda bulunan 10 kayd� rastgele listeleyelim

Select Top 10 * From Makaleler Order By NewID()  

--Makaleler tablosunda bulunan MakaleId'si 10'dan k���k olan kay�tlar�n 5 tanesini rastgele listeleyelim.

Select Top 5 * From Makaleler WHERE MakaleId < 10 Order By NewID()                      



/*
		NORMAL�ZE (�L��K�SEL VER� TABANLARI) (TABLOLAR ARASI �L���)
AVANTAJLARI;
1.Diskten tasarruf ettirir.
2.Sorgular� h�zland�r�r.
3.Veri tutarl�l���n� sa�lar. �rn farkl� s�tunlarda ayn� verileri yazd���m�zda syntax hatas� yapabiliriz. bunu �n�ne ge�mi� oluyor.
4. G�ncellemeleri kolayla�t�r�r.
5.Veri tekrar�n� engeller.
