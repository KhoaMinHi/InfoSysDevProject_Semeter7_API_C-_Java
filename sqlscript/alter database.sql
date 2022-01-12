
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


