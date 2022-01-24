use Final_DiChoThue
go

--dang ky shipper
create procedure DangKiShipper
(@HoTen nvarchar(50), @NgaySinh date, @SoDienThoai nvarchar(10), @CMND nvarchar(10), @TinhTrangSucKhoe int, @Quan_Huyen nvarchar(50), @ThanhPho nvarchar(50))
as
	declare @makv int 
	declare @MaShipper int 

	  
	select @makv= makhuvuc from KhuVuc where Quan_Huyen = @Quan_Huyen and ThanhPho = @ThanhPho

	insert into  Shipper  (HoTen, NgaySinh, SoDienThoai, CMND, TinhTrangSucKhoe)
	values (@HoTen, @NgaySinh, @SoDienThoai, @CMND, @TinhTrangSucKhoe)

	 select @MaShipper = max(MaShipper) from Shipper 

	insert into KhuVucHoatDong(MaShipper, KhuVuc)
	values (cast(@MaShipper as int), cast(@makv as int))

go

---xoa shipper 
create procedure XoaShipper (@MaShipper nvarchar(50))
as
	delete KhuVucHoatDong where MaShipper = @MaShipper
	delete Shipper where MaShipper = @MaShipper

go

--cap nhat thong tin shipper
create procedure CapNhapShipper (@MaShipper nvarchar(50), @HoTen nvarchar(50), @NgaySinh date, @SoDienThoai nvarchar(10), @CMND nvarchar(10), @TinhTrangSucKhoe int, @Quan_Huyen nvarchar(50), @ThanhPho nvarchar(50))
as
	update Shipper  
           set HoTen = @HoTen, 
			NgaySinh = @NgaySinh, 
            SoDienThoai = @SoDienThoai, 
            CMND = @CMND, 
            TinhTrangSucKhoe = @TinhTrangSucKhoe
             where MaShipper = @MaShipper

	declare @makv int
	select @makv= makhuvuc from KhuVuc where Quan_Huyen = @Quan_Huyen and ThanhPho = @ThanhPho
	update KhuVucHoatDong
	set KhuVuc = @makv
	where MaShipper = @MaShipper

go

-- shipper tiep nhan don hang
create procedure sp_NhanDonHang(@mashipper int, @madonhang int)
as
	update DonHang
	set mashipper = @mashipper,
		trangthaidonhang = 2
	where MaDonHang = @madonhang