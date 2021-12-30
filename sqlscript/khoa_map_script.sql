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

DECLARE @TestVariable AS nVARCHAR(100)= N'Củ cà rốt';
--doi tac ban hang

--
select dt.MaDoiTacBanHang, dt.TenDoiTacBH, dt.SDTDoiTacBH, dc.DiaChi, dc.Latitude, dc.Longtitude
from DoiTacBanHang dt join DiaChiDoitac dc 
	on dt.MaDoiTacBanHang=dc.MaDoiTacBanHang;

--search accoring to product, product category
select d.MaDoiTacBanHang, d.TenDoiTacBH, d.SDTDoiTacBH, d.emailDoiTacBH, d.ngayBatDauBan, dc.DiaChi, 
	dc.Latitude, dc.Longtitude,dc.KhuVuc, s.TenSanPham, dm.TenDanhMuc
from DoiTacBanHang d join DiaChiDoitac dc on d.MaDoiTacBanHang=dc.MaDoiTacBanHang
	join DanhSachChuanBiSanPham ds on ds.MaDoitac = d.MaDoiTacBanHang
	join ChiTietDanhSachSanPham ct on ct.MaDanhSachChuanBi = ds.MaDanhSachChuanBi
	join SanPham s on s.MaSanPham = ct.MaSanPham
	join DanhMuc dm on dm.MaDanhMuc = s.MaDanhMuc
where (s.TenSanPham like @TestVariable and @TestVariable is not null)
;
go

--alter table and insert more data
alter table DiaChiDoiTac add Latitude float;
alter table DiaChiDoiTac add Longtitude float;

--insert
SET IDENTITY_INSERT DoiTacBanHang ON;
insert DoiTacBanHang(MaDoiTacBanHang, emailDoiTacBH, MaSoThue, ngayBatDauBan, SDTDoiTacBH, TenDoiTacBH) 
values(1234, N'khoaminhi@gmail.com', N'ABCD', '2020-1-1', N'0143424234', N'khoaminhi'),
	(1235, N'khoaminhi2@gmail.com', N'ABCDF', '2020-1-1', N'0143424236', N'khoaminhi2');
go
SET IDENTITY_INSERT DoiTacBanHang OFF;

SET IDENTITY_INSERT DiaChiDoitac ON;
insert DiaChiDoitac(MaDiaChi, MaDoiTacBanHang, DiaChi, KhuVuc, Latitude, Longtitude)
values(234, 1234, N'135 Đ. Trần Hưng Đạo, Phường Cầu Ông Lãnh', 1, 10.767316263803535, 106.69488933045372),
	(235, 1235, N'18 Điện Biên Phủ, Đa Kao', 1, 10.791934059695496, 106.69875468229652);
go
SET IDENTITY_INSERT DiaChiDoitac OFF;

SET IDENTITY_INSERT DanhSachChuanBiSanPham ON;
insert DanhSachChuanBiSanPham(MaDanhSachChuanBi, MaDoitac, NgayBan, NgayLap)
values(234, 1234, '2000-2-1', '2000-1-30'),
	(235, 1235, '2000-2-1', '2000-1-30');
go
SET IDENTITY_INSERT DanhSachChuanBiSanPham OFF;

SET IDENTITY_INSERT SanPham ON;
insert SanPham(MaSanPham, MaDanhMuc, TenSanPham, DonGia)
values(345, 1, N'Củ Khoai', 30000),
	(346, 1, N'Củ cà rốt', 35000);
go
SET IDENTITY_INSERT SanPham OFF;


insert ChiTietDanhSachSanPham(MaDanhSachChuanBi, MaSanPham, DonGia, SoLuong)
values(234, 345, 30000, 50),
	(235, 346,35000, 100);
go

--https://stackjava.com/hibernate/code-vi-du-hibernate-pagination-phan-trang-trong-hibernate.html
