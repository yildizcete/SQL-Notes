use workpage
/*
		ALTER KOMUTU 
tablo güncelleþtirmek için iki yöntem var;
1.Design bölümünden silebiliriz
2. alter komutuyla silebiliriz
tablodaki verileri deðil (onu udate ile yapýyoruz) tabloyu güncelleþtirmek istersek tablonun üstüne sað týkla design seçeneðinden yap.
tabloyu güncelleþtirmekten kasýt yeni sütun ekleme veri tipini deðiþtirme gibi...
yeni bir sütun eklediðinde hata vermemesi için allow nulls seçeneðini iþaretle. 
alter nesneyi günceller update veriyi günceller
*/

alter table workpagetable add ogrenci_maili nvarchar(150), 
ogrenci_kayýt datetime not null default getdate()
-- default varsayýlan deðer demek. kullanýcý orayý boþ geçtiði zaman sistem otomatik dolduruyor. üstteki kullaným þeklinde öðrenci tarih girmediði takdirde bugünün tarihini girer.
--getdate() bugünün tarihini ve saatini göstermek için kullanýlýr
alter table workpagetable alter column sayfaSayisi int 
 --sayfaSayisi sütunundaki smallint verisini int olarak deðiþtirdik.


 /*
		DROP KOMUTU
Tablodaki sütunu veya tablonun kendisini silmek için kullanýlýr.
silme iþlemi için iki yöntem vardýr;
1. tabloyu silmek için tabloya sað týklayýp delete basarak silebiliriz. Sütunu silmek için design bölümünden yapýyoruz.
2. drop komutuyla silebiliriz.

*/
drop table table_1 
-- table_1 tablosunu sildi

alter table workpagetable drop column puan 

/* 
		GO KOMUTU
Ýki farklý iþlevi var;
1.Yazdýðýmýz komutlarýn birbirinden baðýmsýz olduðunu sisteme göstermek için kullanýlýr. Aksi taktirde kod hata verir.
2.Komutu istediðin sayýda çalýþtýrabilir.

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

-- önce database oluþturduk sonra oluþturduðumuz database'i seçip tablo ekledik.

insert ornektable                    --tabloyu belirt
select '1', 'e', '7', '8'            -- verileri yaz
go 5                                 -- kaç kere çalýþtýrmak istediðini yaz


/*
		DECLARE KOMUTU (tanýmlamak)

Deðiþken tanýmlamak için kullanýlýr. Deðiþkenin adýnýn baþýna @ getirmek zorunlu
Set ifadesi ile deðer atama yapýlýr.

*/
declare @sehir varchar(20) -- sehir adýnda deðiþken tanýmladýk
declare @ilce varchar(20)
set @sehir = 'Malatya'     -- þehir deðiþkenine malatya ifadesini atadýk
set @ilce = 'Darende'
select @sehir              -- ekrana tablo þeklinde yazdýrdýk
print @sehir               -- ekrana normla bi þekilde ifadeyi yazdýrdýk
print @sehir + ' / ' + @ilce


		--PRÝNT KOMUTU
--Ekrana ifade yazdýrmak için kullanýlýr.

print 'SQL ÖÐREENÝYORUMM'
select 'SQL ÖÐREENÝYORUMM'

declare @degisken varchar(10) = 'yýldýz'
print @degisken


		--NEWID KOMUTU
-- NewID() komut ile veritabanýnda rasgele kayýt çekme iþlemlerimizi gerçekleþtirebiliyoruz. 

-- Makaleler tablosunda bulunan tüm kayýtlarý rastgele listeleyelim.

Select * From Makaleler Order By NewID() 

--Makaleler tablosunda bulunan 10 kaydý rastgele listeleyelim

Select Top 10 * From Makaleler Order By NewID()  

--Makaleler tablosunda bulunan MakaleId'si 10'dan küçük olan kayýtlarýn 5 tanesini rastgele listeleyelim.

Select Top 5 * From Makaleler WHERE MakaleId < 10 Order By NewID()                      



/*
		NORMALÝZE (ÝLÝÞKÝSEL VERÝ TABANLARI) (TABLOLAR ARASI ÝLÝÞÝ)
AVANTAJLARI;
1.Diskten tasarruf ettirir.
2.Sorgularý hýzlandýrýr.
3.Veri tutarlýlýðýný saðlar. örn farklý sütunlarda ayný verileri yazdýðýmýzda syntax hatasý yapabiliriz. bunu önüne geçmiþ oluyor.
4. Güncellemeleri kolaylaþtýrýr.
5.Veri tekrarýný engeller.
