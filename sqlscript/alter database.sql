
use DiChoThue;
go


--Quan lý đơn hàng
insert into DonHang(NgayDatHang, MaKhachHang, TongDon, MaShipper, TrangThaiDonHang)
 values (getdate(), 1, 1, '85000', 0, 1, 1, 1)


insert into ChiTietDonHang(MaDonHang, MaSanPham, SoLuong, DonGia)
 values (13445, 1, 1, 85000)
 go

SET IDENTITY_INSERT KhachHang On;
 insert into KhachHang(MaKhachHang, TenKhachHang, Email, SDT)
	values(567, N'khoamihi', N'khoaminhi@gmail.com', N'0336069400');
 SET IDENTITY_INSERT KhachHang OFF;
go

 SET IDENTITY_INSERT DonHang On;
insert into DonHang(MaDonHang)
 values (1373)
 go
  SET IDENTITY_INSERT DonHang OFF;
go

--tiep nhan đơn hàng---------------------------------------------------------------------
--shipper
SET IDENTITY_INSERT Shipper On;
insert into  Shipper  (MaShipper ,HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai)
values (4181, 'khoa tiep nhan don hang 1', '1995-03-04', '2938474345', '290384839', '2', N'Tịnh Kỳ, Quang Ngai, Vietnam');
insert into  Shipper  (MaShipper ,HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai)
values (4182, 'khoa tiep nhan don hang 2', '1995-03-04', '3638474345', '360384839', '2', N'Tịnh Khê, Quang Ngai, Vietnam');
go
SET IDENTITY_INSERT Shipper OFF;
go

--KhachHang
SET IDENTITY_INSERT KhachHang On;
insert into KhachHang(MaKhachHang, TenKhachHang, SDT, Email, CMND )
 values (41851, N'Khoa Quang Ngai', N'0336069400', N'khoaquangngai@gmail.com', N'212881957');
insert into KhachHang(MaKhachHang, TenKhachHang, SDT, Email, CMND )
values (41852, N'Khoa Xuan An', N'0336069400', N'minhkhoa@gmail.com', N'212881957');
 go
  SET IDENTITY_INSERT KhachHang OFF;
go

--DIaChiKhachHang
SET IDENTITY_INSERT DiaChiKhachHang On;
insert into DiaChiKhachHang(MaDiaChi, DiaChiGiaoHang, SDT, MaKhachHang, MaKhuVuc)
 values (41851, N'Quan 1', N'0336069400', 41851, 1);
insert into DIaChiKhachHang(MaDiaChi, DiaChiGiaoHang, SDT, MaKhachHang, MaKhuVuc)
 values (41852, N'Quan 1', N'0336069400', 41852, 1);
 go
  SET IDENTITY_INSERT DiaChiKhachHang OFF;
go

--DoiTacBanHang
/*
SET IDENTITY_INSERT DoiTacBanHang ON;
insert DoiTacBanHang(MaDoiTacBanHang, emailDoiTacBH, MaSoThue, ngayBatDauBan, SDTDoiTacBH, TenDoiTacBH) 
values(4181234, N'khoaminhi@gmail.com', N'ABCD', '2020-1-1', N'0143424234', N'khoaminhi'),
	(4181235, N'khoaminhi2@gmail.com', N'ABCDF', '2020-1-1', N'0143424236', N'khoaminhi2');
SET IDENTITY_INSERT DoiTacBanHang OFF;
*/

--DiaChiDoiTacBan
/*
SET IDENTITY_INSERT DiaChiDoitac ON;
insert DiaChiDoitac(MaDiaChi, MaDoiTacBanHang, DiaChi, KhuVuc, Latitude, Longtitude)
values(418234, 4181234, N'135 Đ. Trần Hưng Đạo, Phường Cầu Ông Lãnh', 1, 10.767316263803535, 106.69488933045372),
	(418235, 4181235, N'18 Điện Biên Phủ, Đa Kao', 1, 10.791934059695496, 106.69875468229652);
go
SET IDENTITY_INSERT DiaChiDoitac OFF;
*/

--SanPham
/*
SET IDENTITY_INSERT SanPham ON;
insert SanPham(MaSanPham, MaDanhMuc, TenSanPham, DonGia)
values(418345, 1, N'Củ khoai', 30000),
	(418346, 1, N'Củ bị', 35000);
go
SET IDENTITY_INSERT SanPham OFF;
*/
SET IDENTITY_INSERT SanPham ON;
insert SanPham(MaSanPham, MaDanhMuc, TenSanPham, DonGia, MaDoiTacBanHang)
values(418591, 1, N'Củ khoai hạng 1', 100000, 4181235),
	(418592, 1, N'Củ Chuối', 35000, 4181235);
go
SET IDENTITY_INSERT SanPham OFF;

--DonHang
 SET IDENTITY_INSERT DonHang On;
insert into DonHang(MaDonHang, MaKhachHang, MaDiaChi, MaShipper, NgayDatHang, TrangThaiDonHang)
 values (41851, 41851, 41851, 4181, GETDATE(), 1),
	(41852, 41852, 41852, 4182, GETDATE(), 1)
 go
  SET IDENTITY_INSERT DonHang OFF;
go

--ChiTietDonHang

insert into ChiTietDonHang(MaDonHang, MaSanPham, SoLuong)
 values (41852, 418591, 2),
	(41852, 418592, 1),
	(41851, 418345, 2),
	(41851, 418346, 1),
	(41852, 418346, 3)
go

--test select
select *
from Shipper s join DonHang dh on s.MaShipper=dh.MaShipper
join ChiTietDonHang ctdh on ctdh.MaDonHang=dh.MaDonHang
join SanPham sp on sp.MaSanPham=ctdh.MaSanPham
join DoiTacBanHang dt on dt.MaDoiTacBanHang=sp.MaDoiTacBanHang
join DiaChiDoitac dcdt on dcdt.MaDoiTacBanHang=dt.MaDoiTacBanHang
join DiaChiKhachHang dckh on dckh.MaDiaChi=dh.MaDiaChi
join KhachHang kh on kh.MaKhachHang=dh.MaKhachHang

select * from Shipper s join DonHang dh on s.MaShipper=dh.MaShipper;





