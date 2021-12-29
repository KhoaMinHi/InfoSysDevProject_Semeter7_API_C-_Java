--1. Thêm cột địa chỉ hiện tại của shipper
use DiChoThue;
go
--thêm cột ViTriHienTai để demo tìm shipper gần nhất.
ALTER TABLE Shipper ADD ViTriHienTai nvarchar(200);
--
select * from DiChoThue.dbo.Shipper;

--thêm một vài shipper
insert into  Shipper  (HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai)
values ('khoaminhi', '1995-03-04', '2938474345', '290384839', '2', N'Tịnh Kỳ, Quang Ngai, Vietnam');
insert into  Shipper  (HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai)
values ('khoaminhi', '1995-03-04', '2938474345', '290384839', '2', N'Tịnh Khê, Quang Ngai, Vietnam');

--thêm cột latitude và longtitude
ALTER TABLE Shipper ADD Latitude float;
ALTER TABLE Shipper ADD Longtitude float;

--
select * from Shipper;

update Shipper set Latitude = 15.192965, Longtitude = 108.889596 where ViTriHienTai like N'%Khê%';
update Shipper set Latitude = 15.205642, Longtitude = 108.916006 where ViTriHienTai like N'%Kỳ%';

--native script
select * from Shipper s where s.ViTriHienTai like N'%Khê%' or s.ViTriHienTai like N'%Kỳ%';

--==================================================
--doi tac ban hang
select * from DoiTacBanHang d join DiaChiDoitac dc
	on d.MaDoiTacBanHang=dc.MaDoiTacBanHang;
