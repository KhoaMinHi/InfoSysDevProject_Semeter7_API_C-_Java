use Final_DiChoThue;
create table PhanHoiKhachHang (
	MaPhanHoiKH int identity(1,1) primary key,
	Rating int,
	NoiDung nvarchar(255),
	MaSanPham int,
	MaKhachHang int,
	FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
	FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

create table PhanHoiKH_Shipper (
	MaPhanHoiKH_Shipper int identity(1,1) primary key,
	Rating int,
	NoiDung nvarchar(255),
	MaShipper int,
	MaKhachHang int,
	FOREIGN KEY (MaShipper) REFERENCES Shipper(MaShipper),
	FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);