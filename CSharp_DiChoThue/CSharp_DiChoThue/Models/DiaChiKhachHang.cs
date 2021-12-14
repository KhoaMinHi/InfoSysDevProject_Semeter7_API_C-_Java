using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DiaChiKhachHang
    {
        public DiaChiKhachHang()
        {
            DonHang = new HashSet<DonHang>();
        }

        public int MaDiaChi { get; set; }
        public int? MaKhachHang { get; set; }
        public string DiaChiGiaoHang { get; set; }
        public string Sdt { get; set; }
        public int? MaKhuVuc { get; set; }

        public KhachHang MaKhachHangNavigation { get; set; }
        public KhuVuc MaKhuVucNavigation { get; set; }
        public ICollection<DonHang> DonHang { get; set; }
    }
}
