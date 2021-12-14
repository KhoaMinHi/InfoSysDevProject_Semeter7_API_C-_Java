using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class ChiTietDonHang
    {
        public int MaDonHang { get; set; }
        public int MaSanPham { get; set; }
        public int? SoLuong { get; set; }
        public double? DonGia { get; set; }

        public DonHang MaDonHangNavigation { get; set; }
        public SanPham MaSanPhamNavigation { get; set; }
    }
}
