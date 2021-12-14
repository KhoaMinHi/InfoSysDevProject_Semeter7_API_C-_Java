using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DonHang
    {
        public DonHang()
        {
            ChiTietDonHang = new HashSet<ChiTietDonHang>();
        }

        public int MaDonHang { get; set; }
        public DateTime? NgayDatHang { get; set; }
        public int? MaKhachHang { get; set; }
        public int? MaDiaChi { get; set; }
        public double? TongDon { get; set; }
        public double? TyLeGiamGia { get; set; }
        public int? MaShipper { get; set; }
        public int? MaNhanVienQuanLy { get; set; }
        public int? TrangThaiDonHang { get; set; }

        public DiaChiKhachHang MaDiaChiNavigation { get; set; }
        public KhachHang MaKhachHangNavigation { get; set; }
        public NhanVien MaNhanVienQuanLyNavigation { get; set; }
        public Shipper MaShipperNavigation { get; set; }
        public TrangThaiDonHang TrangThaiDonHangNavigation { get; set; }
        public ICollection<ChiTietDonHang> ChiTietDonHang { get; set; }
    }
}
