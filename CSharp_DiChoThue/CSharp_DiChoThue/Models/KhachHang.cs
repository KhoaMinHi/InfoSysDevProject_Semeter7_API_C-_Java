using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class KhachHang
    {
        public KhachHang()
        {
            DiaChiKhachHang = new HashSet<DiaChiKhachHang>();
            DonHang = new HashSet<DonHang>();
            ThongTinThanhToan = new HashSet<ThongTinThanhToan>();
        }

        public int MaKhachHang { get; set; }
        public string TenKhachHang { get; set; }
        public string Sdt { get; set; }
        public string Cmnd { get; set; }
        public string Email { get; set; }

        public ICollection<DiaChiKhachHang> DiaChiKhachHang { get; set; }
        public ICollection<DonHang> DonHang { get; set; }
        public ICollection<ThongTinThanhToan> ThongTinThanhToan { get; set; }
    }
}
