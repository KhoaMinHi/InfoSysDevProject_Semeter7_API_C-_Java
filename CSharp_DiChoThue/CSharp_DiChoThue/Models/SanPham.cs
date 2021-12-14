using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class SanPham
    {
        public SanPham()
        {
            ChiTietDanhSachSanPham = new HashSet<ChiTietDanhSachSanPham>();
            ChiTietDonHang = new HashSet<ChiTietDonHang>();
        }

        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public double? DonGia { get; set; }
        public int? MaDoiTacBanHang { get; set; }
        public int? MaDanhMuc { get; set; }

        public DanhMuc MaDanhMucNavigation { get; set; }
        public DoiTacBanHang MaDoiTacBanHangNavigation { get; set; }
        public ICollection<ChiTietDanhSachSanPham> ChiTietDanhSachSanPham { get; set; }
        public ICollection<ChiTietDonHang> ChiTietDonHang { get; set; }
    }
}
