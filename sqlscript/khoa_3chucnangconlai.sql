use DiChoThue;


--
select * from KhachHang;

--Chuc năng: Quản lý đơn hàng
select * 
from DoiTacBanHang dt join SanPham sp on dt.MaDoiTacBanHang=sp.MaDoiTacBanHang
	join ChiTietDonHang ct on ct.MaSanPham = sp.MaSanPham
	join DonHang dh on dh.MaDonHang = ct.MaDonHang
	join Shipper sh on sh.MaShipper = dh.MaShipper
	join KhachHang kh on kh.MaKhachHang = dh.MaKhachHang;
go

--dang ky van chuyen don hang
update DonHang set MaShipper = ? where MaDonHang = ?;

select * from Shipper;
select * from KhachHang;
select * from SanPham;
select * from DonHang;

select *
from Shipper s join DonHang dh on s.MaShipper = dh.MaShipper
     join ChiTietDonHang ct on dh.MaDonHang = ct.MaDonHang
     join SanPham sp on ct.MaSanPham = sp.MaSanPham
      join DoiTacBanHang dt on sp.MaDoiTacBanHang = dt.MaDoiTacBanHang
     join DiaChiDoitac dcdt on dt.MaDoiTacBanHang = dcdt.MaDoiTacBanHang
	 join KhachHang kh on dh.MaKhachHang = kh.MaKhachHang
     join DiaChiKhachHang dckh on dh.MaDiaChi = dckh.MaDiaChi
     
where s.MaShipper = '4181' --&& dh.TrangThaiDonHang == 1