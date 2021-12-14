using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class ChiTietDanhSachSanPham
    {
        public int MaDanhSachChuanBi { get; set; }
        public int MaSanPham { get; set; }
        public int? SoLuong { get; set; }
        public double? DonGia { get; set; }

        public DanhSachChuanBiSanPham MaDanhSachChuanBiNavigation { get; set; }
        public SanPham MaSanPhamNavigation { get; set; }
    }
}
