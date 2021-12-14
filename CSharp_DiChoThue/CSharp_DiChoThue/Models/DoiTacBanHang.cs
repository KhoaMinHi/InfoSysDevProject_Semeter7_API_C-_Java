using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DoiTacBanHang
    {
        public DoiTacBanHang()
        {
            DanhSachChuanBiSanPham = new HashSet<DanhSachChuanBiSanPham>();
            DiaChiDoitac = new HashSet<DiaChiDoitac>();
            SanPham = new HashSet<SanPham>();
        }

        public int MaDoiTacBanHang { get; set; }
        public string TenDoiTacBh { get; set; }
        public string SdtdoiTacBh { get; set; }
        public string EmailDoiTacBh { get; set; }
        public DateTime? NgayBatDauBan { get; set; }
        public string MaSoThue { get; set; }

        public ICollection<DanhSachChuanBiSanPham> DanhSachChuanBiSanPham { get; set; }
        public ICollection<DiaChiDoitac> DiaChiDoitac { get; set; }
        public ICollection<SanPham> SanPham { get; set; }
    }
}
