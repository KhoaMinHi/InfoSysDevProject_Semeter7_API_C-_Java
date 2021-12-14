using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DanhSachChuanBiSanPham
    {
        public DanhSachChuanBiSanPham()
        {
            ChiTietDanhSachSanPham = new HashSet<ChiTietDanhSachSanPham>();
        }

        public int MaDanhSachChuanBi { get; set; }
        public int? MaDoitac { get; set; }
        public DateTime? NgayBan { get; set; }
        public DateTime? NgayLap { get; set; }

        public DoiTacBanHang MaDoitacNavigation { get; set; }
        public ICollection<ChiTietDanhSachSanPham> ChiTietDanhSachSanPham { get; set; }
    }
}
