--CASE YAPISI
--CASE yapısı bir ifadeyi döndürür, bir işlem yapmaz.
--Her CASE bloğu mutlaka END ile bitirilmelidir.
--ELSE kısmı opsiyoneldir, ancak eklenmezse ve hiçbir koşul sağlanmazsa NULL döner.

--soru1. Çalışanın bulunduğu şehre göre bölge adı belirle.

--select FirstName, LastName, City, case City
--when 'Seattle' then 'Batı Bölgesi'
--when 'Tacoma' then 'Doğu Bölgesi'
--when 'London' then 'Avrupa Bölgesi'
--else 'Bilinmeyen Bölge'
--end as 'Bölge İsimleri'
--from Employees

--soru2. Sipariş Miktarına Göre İndirim Seviyesi Belirle.

--select ProductID, Quantity, case
--when Quantity>=50 then 'Yüksek İndirim'
--when Quantity between 20 and 49 then 'Orta İndirim'
--when Quantity<20 then 'Düşük İndirim'
--end as 'İndirim Oranı'
--from OrderDetails

--soru3. Ürün Stok Durumunu Belirle
--select ProductName, UnitsInStock, case 
--when UnitsInStock = 0 then 'Stok yok'
--when UnitsInStock between 1 and 49 then 'Stok kritik seviyede'
--when UnitsInStock>=50 then 'Stok yeterli'
--end as 'Stok Durumu'
--from Products

--soru4. Müşterinin toplam sipariş tutarına göre kategorisini belirle
--select C.CompanyName, sum(OD.UnitPrice*OD.Quantity) as 'Toplam Sipariş Tutarı',
--case
--when sum(OD.UnitPrice*OD.Quantity)>10000 then 'VIP Müşteri'
--when sum(OD.UnitPrice*OD.Quantity) between 5000 and 10000 then 'Sadık Müşteri'
--when sum(OD.UnitPrice*OD.Quantity)>10000 then 'VIP Müşteri'
--else 'Yeni Müşteri'
--end as 'Müşteri Kategorisi'
--from Customers C join Orders O on C.CustomerID = O.CustomerID
--join OrderDetails OD on O.OrderID = OD.OrderID
--group by C.CompanyName order by C.CompanyName

--soru5. Teslim tarihine bakarak siparişin durumunu belirle
--select O.OrderID, C.CompanyName, C.Contactname, O.ShippedDate, case
--when O.ShippedDate < GETDATE() then 'Sipariş Teslim edildi'
--when O.ShippedDate >= GETDATE() then 'Teslim Bekleniyor'
--when O.ShippedDate IS NULL then 'Bilinmiyor'
--end as 'Sipariş Durumu'
--from Orders O join Customers C on O.CustomerID = C.CustomerID

--use Northwinds
--soru6. Her bir siparişin teslim süresine göre durumunu belirleyin:
--Eğer sipariş 7 gün içinde teslim edilmişse → "Hızlı Teslimat"
--Eğer sipariş 8-14 gün arasında teslim edilmişse → "Normal Teslimat"
--Eğer sipariş 14 günü geçmişse → "Geç Teslimat"

--soru7. Çalışanların işe başlama tarihine göre kıdem seviyelerini belirleyin:
--10 yıldan fazla çalışıyorsa → "Kıdemli"
--5-10 yıl arası çalışıyorsa → "Orta Düzey"
--5 yıldan az çalışıyorsa → "Yeni Çalışan"

--soru8. Müşterilerin sipariş sıklığına göre durum belirleyin:
--Eğer müşteri 50'den fazla sipariş verdiyse → "Sadık Müşteri"
--Eğer müşteri 20-50 arasında sipariş verdiyse → "Aktif Müşteri"
--Eğer müşteri 20'den az sipariş verdiyse → "Yeni Müşteri"

--soru9. Şirketlerin teslim ettiği ürün sayısına(Quantity) göre performanslarını şu şekilde değerlendirin: (suppliers, products,orderdetails)
--500'den fazla ürün teslim edenler → "Yüksek Performans"
--100-500 arasında ürün teslim edenler → "Orta Performans"
--100'den az ürün teslim edenler → "Düşük Performans"

--use AdventureWorks2017 
--soru10. Satış elemanlarının gerçekleştirdikleri toplam satışlara(subtotal) göre performansını belirleyin:(Sales.SalesOrderHeader)
--1,000,000'dan fazla satış yaptıysa → "Yüksek Performans"
--500,000 ile 1,000,000 arasında satış yaptıysa → "Orta Performans"
--500,000'den az satış yaptıysa → "Düşük Performans"

--soru11. Tedarikçilerin teslim ettiği ürün sayısına göre performanslarını şu şekilde değerlendirin:
--500'den fazla ürün teslim edenler → "Yüksek Performans"
--100-500 arasında ürün teslim edenler → "Orta Performans"
--100'den az ürün teslim edenler → "Düşük Performans"

--soru12. Ürünlerin toplam satış gelirine(linetotal) göre kar sınıflandırması yapın: (Production.Product, Sales.SalesOrderDetail)
--500,000 USD'den fazla satış yapan ürünler → "Yüksek Kar"
--100,000-500,000 USD arasında satış yapan ürünler → "Orta Kar"
--100,000 USD'den az satış yapan ürünler → "Düşük Kar"