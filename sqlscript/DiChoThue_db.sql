create database DiChoThue
go
use DiChoThue
go

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Shipper]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].Shipper
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhuVucHoatDong]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].KhuVucHoatDong
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhuVuc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].KhuVuc
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[TinhTrangSucKhoe]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].TinhTrangSucKhoe
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DoiTacBanHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DoiTacBanHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DiaChiDoitac]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DiaChiDoitac
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DanhSachChuanBiSanPham]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DanhSachChuanBiSanPham
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ChiTietDanhSachSanPham]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].ChiTietDanhSachSanPham
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SanPham]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].SanPham
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DanhMuc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DanhMuc
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhachHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].KhachHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DiaChiKhachHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DiaChiKhachHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DonHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].DonHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[TrangThaiDonHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].TrangThaiDonHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ChiTietDonHang]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].ChiTietDonHang
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ThongTinThanhToan]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].ThongTinThanhToan
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[LichSuThanhToan]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].LichSuThanhToan
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[NhanVien]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].NhanVien
GO


create table Shipper(
	MaShipper int identity(1,1) primary key,
	HoTen nvarchar(50),
	NgaySinh date,
	SoDienThoai nvarchar(10),
	CMND nvarchar(10),
	TinhTrangSucKhoe int
)

create table KhuVucHoatDong(
	MaKhuVucHoatDong int identity(1,1) primary key,
	MaShipper int,
	KhuVuc int
)



create table KhuVuc(
	MaKhuVuc int identity(1,1) primary key,
	Quan_Huyen nvarchar(50),
	ThanhPho nvarchar(50),
	LoaiKhuVuc nvarchar(50)
)

create table TinhTrangSucKhoe(
	MaTTSK int identity(0,1) primary key,
	TenTTSK nvarchar(50),
	SoMuiDaTiem tinyint
)

create table DoiTacBanHang(
	MaDoiTacBanHang int identity(1,1) primary key,
	TenDoiTacBH nvarchar(50),
	SDTDoiTacBH nvarchar(10),
	emailDoiTacBH nvarchar(50),
	ngayBatDauBan date,
	MaSoThue nvarchar(50)
)


create table DiaChiDoitac(
	MaDiaChi int identity(1,1) primary key,
	DiaChi nvarchar(50),
	MaDoiTacBanHang int,
	KhuVuc int
)

create table DanhSachChuanBiSanPham(
	MaDanhSachChuanBi int identity(1,1) primary key,
	MaDoitac int,
	NgayBan date,
	NgayLap date
)



create table ChiTietDanhSachSanPham(
	MaDanhSachChuanBi int,
	MaSanPham int,
	SoLuong int,
	DonGia float
	CONSTRAINT ChiTietDanhSachSanPham_pk PRIMARY KEY (MaDanhSachChuanBi, MaSanPham)
)


create table SanPham(
	MaSanPham int identity(1,1) primary key,
	TenSanPham nvarchar(50),
	DonGia float,
	MaDoiTacBanHang int,
	MaDanhMuc int
)


create table DanhMuc(
	MaDanhMuc  int identity(1,1) primary key,
	TenDanhMuc nvarchar(50)
)

create table KhachHang(
	MaKhachHang int identity(1,1) primary key,
	TenKhachHang nvarchar(50),
	SDT nvarchar(10),
	CMND nvarchar(10),
	Email nvarchar(50)
)

create table DiaChiKhachHang(
	MaDiaChi int identity(1,1) primary key,
	MaKhachHang int ,
	DiaChiGiaoHang nvarchar(50),
	SDT nvarchar(10),
	MaKhuVuc int
)



create table DonHang(
	MaDonHang int identity(1,1) primary key,
	NgayDatHang date,
	MaKhachHang int,
	MaDiaChi int,
	TongDon float,
	TyLeGiamGia float,
	MaShipper int,
	MaNhanVienQuanLy int,
	TrangThaiDonHang int
)

create table TrangThaiDonHang(
	MaTrangThai int identity(1,1) primary key,
	TenTrangThai nvarchar(50)
)


create table ChiTietDonHang(
	MaDonHang int,
	MaSanPham int,
	SoLuong int,
	DonGia float
	CONSTRAINT ChiTietDonHang_pk PRIMARY KEY (MaDonHang, MaSanPham)
)


create table ThongTinThanhToan(
	MaThongTinThanhToan int identity(1,1) primary key,
	MaKhachHang int,
	SoThe nvarchar(50),
	NgayHetHan date,
	LoaiThe nvarchar(50)
)

create table LichSuThanhToan(
	MaLichSuThanhToan int identity(1,1) primary key,
	HinhThucThanhToan nvarchar(50),
	MaThongTinThanhToan int
)


create table NhanVien(
	MaNhanVien int identity(1,1) primary key,
	HoTen nvarchar(50),
	SDT nvarchar(10),
	email nvarchar(50),
	CMND nvarchar(10)
)



ALTER TABLE Shipper ADD CONSTRAINT fk_shipper_ttsk FOREIGN KEY (TinhTrangSucKhoe)REFERENCES TinhTrangSucKhoe (MaTTSK);
ALTER TABLE DiaChiDoiTac ADD CONSTRAINT fk_dcdt_dt FOREIGN KEY (MaDoiTacBanHang)REFERENCES DoiTacBanHang (MaDoiTacBanHang);
ALTER TABLE DiaChiDoiTac ADD CONSTRAINT fk_dcdt_kv FOREIGN KEY (KhuVuc)REFERENCES KhuVuc (MaKhuVuc);
ALTER TABLE DanhSachChuanBiSanPham ADD CONSTRAINT fk_dscbsp_dtbh FOREIGN KEY (MaDoitac)REFERENCES DoiTacBanHang (MaDoiTacBanHang);
ALTER TABLE ChiTietDanhSachSanPham ADD CONSTRAINT fk_ctdssp_dscb FOREIGN KEY (MaDanhSachChuanBi)REFERENCES DanhSachChuanBiSanPham (MaDanhSachChuanBi);
ALTER TABLE ChiTietDanhSachSanPham ADD CONSTRAINT fk_ctdssp_sp FOREIGN KEY (MaSanPham)REFERENCES SanPham (MaSanPham);
ALTER TABLE SanPham ADD CONSTRAINT fk_sp_dm FOREIGN KEY (MaDanhMuc)REFERENCES DanhMuc (MaDanhMuc);
ALTER TABLE SanPham ADD CONSTRAINT fk_sp_dtbh FOREIGN KEY (MaDoiTacBanHang)REFERENCES DoiTacBanHang (MaDoiTacBanHang);
ALTER TABLE DiaChiKhachHang ADD CONSTRAINT fk_dc_kh FOREIGN KEY (MaKhachHang)REFERENCES KhachHang (MaKhachHang);
ALTER TABLE DonHang ADD CONSTRAINT fk_dh_kh FOREIGN KEY (MaKhachHang)REFERENCES KhachHang (MaKhachHang);
ALTER TABLE DonHang ADD CONSTRAINT fk_dh_shp FOREIGN KEY (MaShipper)REFERENCES Shipper (MaShipper);
ALTER TABLE DonHang ADD CONSTRAINT fk_dh_nv FOREIGN KEY (MaNhanVienQuanLy)REFERENCES NhanVien (MaNhanVien);
ALTER TABLE DonHang ADD CONSTRAINT fk_dh_tt FOREIGN KEY (TrangThaiDonHang)REFERENCES TrangThaiDonHang (MaTrangThai);
ALTER TABLE DonHang ADD CONSTRAINT fk_dh_dc FOREIGN KEY (MaDiaChi)REFERENCES DiaChiKhachHang (MaDiaChi);
ALTER TABLE ChiTietDonHang ADD CONSTRAINT fk_ctdh_dh FOREIGN KEY (MaDonHang)REFERENCES DonHang (MaDonHang);
ALTER TABLE ChiTietDonHang ADD CONSTRAINT fk_ctdh_sp FOREIGN KEY (MaSanPham)REFERENCES SanPham (MaSanPham);
ALTER TABLE ThongTinThanhToan ADD CONSTRAINT fk_ttth_kh FOREIGN KEY (MaKhachHang)REFERENCES KhachHang (MaKhachHang);
ALTER TABLE LichSuThanhToan ADD CONSTRAINT fk_lstt_ttth FOREIGN KEY (MaThongTinThanhToan)REFERENCES ThongTinThanhToan (MaThongTinThanhToan);
ALTER TABLE DiaChiKhachHang ADD CONSTRAINT fk_dckh_kh FOREIGN KEY (MaKhachHang)REFERENCES KhachHang (MaKhachHang);
ALTER TABLE DiaChiKhachHang ADD CONSTRAINT fk_dckh_kv FOREIGN KEY (MaKhuVuc)REFERENCES KhuVuc (MaKhuVuc);
ALTER TABLE KhuVucHoatDong ADD CONSTRAINT fk_kvhd_shp FOREIGN KEY (MaShipper)REFERENCES Shipper (MaShipper);
ALTER TABLE KhuVucHoatDong ADD CONSTRAINT fk_kvhd_kv FOREIGN KEY (KhuVuc)REFERENCES KhuVuc (MaKhuVuc);

---------------------------
insert into TinhTrangSucKhoe(TenTTSK, SoMuiDaTiem)
values ('Do', 0), ('Vang', 1), ('Xanh', 2)

insert into KhuVuc(Quan_Huyen, ThanhPho, LoaiKhuVuc)
values ('quan 1', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 3', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 4', 'Ho Chi Minh', 'cap đo 2'),
 ('quan 7', 'Ho Chi Minh', 'cap đo 1')


insert into  Shipper  (HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe)
values ('Tran Van An', '1995-03-04', '2938474345', '290384839', '2')

insert into DoiTacBanHang (TenDoiTacBH, emailDoiTacBH, SDTDoiTacBH, ngayBatDauBan, MaSoThue)
values('ABC FOOD', 'abcfood123@gmail.com', '123456', '2021-1-1', '0212732317-018')

insert into DiaChiDoitac (DiaChi, MaDoiTacBanHang, KhuVuc)
values ('12/1 Phường 6', 1 , 1)

insert into KhuVucHoatDong(MaShipper, KhuVuc)
values(1, 1)

insert into KhachHang(TenKhachHang, SDT, CMND, Email)
values('Nguyen Ngoc Ha', '6734824', '3287942', 'nnha@gmail.com')

insert into DanhMuc(TenDanhMuc)
values ('Rau Cu'), ('Thit')

insert into SanPham(TenSanPham, DonGia, MaDoiTacBanHang, MaDanhMuc)
values ('Thit Heo Vai', '85000', '1', '2')

insert into TrangThaiDonHang(TenTrangThai)
values ('Dat hang thanh cong, dang tim Shipper'),
	('Shipper da nhan don hang'),
	('Shipper dang mua hang'),
	('Mua hang thanh cong, dang giao hang'),
	('Don hang giao thanh cong'),
	('Don hang bi huy')

insert into NhanVien(Hoten, SDT, email, CMND)
values ('Phan Van Hien', '420498553', 'pnhien1123@gmail.com', '53897956'),
 ('Nguyen Thi Hien', '3498547323', 'nthien1123@gmail.com', '989184372')

 insert into DiaChiKhachHang(MaKhachHang, DiaChiGiaoHang, SDT, MaKhuVuc)
 values (1, '6732/1 phuong 3','023948785', 2)

 insert into DonHang(NgayDatHang, MaKhachHang, MaDiaChi, TongDon, TyLeGiamGia, MaShipper, MaNhanVienQuanLy, TrangThaiDonHang)
 values (getdate(), 1, 1, '85000', 0, 1, 1, 1)

 insert into ChiTietDonHang(MaDonHang, MaSanPham, SoLuong, DonGia)
 values (1, 1, 1, 85000)
