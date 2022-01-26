--use Final_DiChoThue;
--go

--Tinh trang suc khoe
insert into TinhTrangSucKhoe(TenTTSK, SoMuiDaTiem)
values ('Do', 0), ('Vang', 1), ('Xanh', 2)
go

--Khu Vuc
insert into KhuVuc(Quan_Huyen, ThanhPho, LoaiKhuVuc)
values ('quan 1', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 3', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 4', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 7', 'Ho Chi Minh', 'cap đo 1')
go

--Shipper
--thêm một vài shipper
SET IDENTITY_INSERT Shipper On;
insert into  Shipper  (MaShipper ,HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai, Latitude, Longtitude)
values (4181, N'Phạm Nhật Ân', '1999-08-19', '2938474345', '290384839', '2', N'Đường Bến Nghé, Tân Thuận Đông, Quận 7', 10.766251, 106.738991);
insert into  Shipper  (MaShipper ,HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe, ViTriHienTai, Latitude, Longtitude)
values (4182, N'Nguyễn Hà Nhân', '1995-03-04', '3638474345', '360384839', '2', N'Hẻm 145 Nguyễn Thiện Thuật, Phường 1, Quận 3', 10.766811, 106.678892);
go
SET IDENTITY_INSERT Shipper OFF;
go

--DoiTacBanHang
SET IDENTITY_INSERT DoiTacBanHang ON;
insert DoiTacBanHang(MaDoiTacBanHang, emailDoiTacBH, MaSoThue, ngayBatDauBan, SDTDoiTacBH, TenDoiTacBH) 
values(4181234, N'khoaminhi@gmail.com', N'ABCD', '2020-1-1', N'0143424234', N'khoaminhi'),
	(4181235, N'minhkhoa@gmail.com', N'ABCDF', '2019-8-14', N'0336069400', N'minhkhoa');
insert DoiTacBanHang(MaDoiTacBanHang, emailDoiTacBH, MaSoThue, ngayBatDauBan, SDTDoiTacBH, TenDoiTacBH) 
values(4181236, N'hoang@gmail.com', N'ABCD', '2020-1-1', N'0143424234', N'hoang'),
	(4181237, N'trung@gmail.com', N'ABCDF', '2018-1-1', N'933424236', N'trung'),
	(4181238, N'khanh@gmail.com', N'ABCD', '2010-1-1', N'0336069400', N'khanh'),
	(4181239, N'quang@gmail.com', N'ABCDF', '2021-1-1', N'0143424236', N'quang'),
	(41812341, N'hai@gmail.com', N'ABCD', '2021-9-1', N'5273424234', N'hai'),
	(41812352, N'banhminamcan@gmail.com', N'ABCDF', '2019-4-8', N'0143424236', N'banh mi nam can'),
	(41812343, N'hong@gmail.com', N'ABCD', '2020-1-1', N'0143424234', N'hong'),
	(41812354, N'khai@gmail.com', N'ABCDF', '2020-8-22', N'0143424236', N'khai')
	;
go
SET IDENTITY_INSERT DoiTacBanHang OFF;

--DiaChiDoiTac
SET IDENTITY_INSERT DiaChiDoitac ON;
insert DiaChiDoitac(MaDiaChi, MaDoiTacBanHang, DiaChi, KhuVuc, Latitude, Longtitude)
values(418234, 4181234, N'135 Đ. Trần Hưng Đạo, Phường Cầu Ông Lãnh', 1, 10.767316263803535, 106.69488933045372),
	(418235, 4181235, N'18 Điện Biên Phủ, Đa Kao', 1, 10.791934059695496, 106.69875468229652);
go
insert DiaChiDoitac(MaDiaChi, MaDoiTacBanHang, DiaChi, KhuVuc, Latitude, Longtitude)
values(4182369, 4181236, N'193B Lý Chính Thắng, Võ Thị Sáu', 2, 10.781468010802454, 106.68316603077669),
	(418236, 4181237,    N'Nam Kỳ Khởi Nghĩa, Phường 8', 2, 10.790011, 106.683655),
	(4182361, 4181238,   N'610 Nguyễn Đình Chiểu, Phường 3', 2, 10.769227, 106.681291),
	(4182362, 4181239,   N'Khánh Hội, Phường 4', 3,  10.754222, 106.702049),
	(4182363, 41812341,  N'492 Nguyễn Tất Thành, Phường 18', 3,  10.757101, 106.717795),
	(4182364, 41812352,  N'phường 9', 3,  10.763271, 106.703866),
	(4182365, 41812343,  N'Phạm Thị Ba, Phú Thuận', 4, 10.738088, 106.731995 ),
	(4182366, 41812354,  N'39603-39559 Huỳnh Tấn Phát, Phú Mỹ', 4, 10.706105, 106.737586
 )
go
SET IDENTITY_INSERT DiaChiDoitac OFF;

--DanhMuc (SanPham)
insert into DanhMuc(TenDanhMuc)
values ('Rau Cu'), ('Thit')

--SanPham
SET IDENTITY_INSERT SanPham ON;
insert SanPham(MaSanPham, MaDanhMuc, TenSanPham, DonGia, MaDoiTacBanHang)
values(418591, 1, N'Củ khoai hạng 1', 100000, 4181235),
	(418592, 1, N'Củ Chuối', 35000, 4181235);
go
SET IDENTITY_INSERT SanPham OFF;
SET IDENTITY_INSERT SanPham ON;
insert SanPham(MaSanPham, MaDanhMuc, TenSanPham, DonGia, MaDoiTacBanHang)
values(418345, 1, N'Củ khoai', 30000, 4181234),
	(418346, 1, N'Củ bị', 35000, 4181234);
go
SET IDENTITY_INSERT SanPham OFF;

--KhachHang
SET IDENTITY_INSERT KhachHang On;
insert into KhachHang(MaKhachHang, TenKhachHang, SDT, Email, CMND )
 values (41851, N'Khoa Quang Ngai', N'0336069400', N'khoaquangngai@gmail.com', N'212881957');
insert into KhachHang(MaKhachHang, TenKhachHang, SDT, Email, CMND )
values (41852, N'Khoa Xuan An', N'0336069400', N'minhkhoa@gmail.com', N'212881957');
 go
  SET IDENTITY_INSERT KhachHang OFF;
go

--DiaChiKhachHang
SET IDENTITY_INSERT DiaChiKhachHang On;
insert into DiaChiKhachHang(MaDiaChi, DiaChiGiaoHang, SDT, MaKhachHang, MaKhuVuc)
 values (41851, N'Quan 1', N'0336069400', 41851, 1);
insert into DIaChiKhachHang(MaDiaChi, DiaChiGiaoHang, SDT, MaKhachHang, MaKhuVuc)
 values (41852, N'Quan 1', N'0336069400', 41852, 1);
 go
  SET IDENTITY_INSERT DiaChiKhachHang OFF;
go
--TrangThaiDonHang
insert into TrangThaiDonHang(TenTrangThai)
values ('Dat hang thanh cong, dang tim Shipper'),
	('Shipper da nhan don hang'),
	('Shipper dang mua hang'),
	('Mua hang thanh cong, dang giao hang'),
	('Don hang giao thanh cong'),
	('Don hang bi huy')
go


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

--update password
--Shipper
update Shipper set Mail='an@gmail.com', MatKhau = '1234', TrangThai = 1 where MaShipper =4181;
update Shipper set Mail='nhan@gmail.com', MatKhau = '1234', TrangThai = 1 where MaShipper =4182;

--KhachHang
update KhachHang set Email='quangngai@gmail.com', MatKhau = '1234', TrangThai = 1, TenKhachHang = 'quangngai' where MaKhachHang =41851;
update KhachHang set Email='khoa@gmail.com', MatKhau = '1234', TrangThai = 1, TenKhachHang = 'khoa'  where MaKhachHang =41852;







