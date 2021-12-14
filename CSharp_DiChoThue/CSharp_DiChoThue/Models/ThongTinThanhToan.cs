using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class ThongTinThanhToan
    {
        public ThongTinThanhToan()
        {
            LichSuThanhToan = new HashSet<LichSuThanhToan>();
        }

        public int MaThongTinThanhToan { get; set; }
        public int? MaKhachHang { get; set; }
        public string SoThe { get; set; }
        public DateTime? NgayHetHan { get; set; }
        public string LoaiThe { get; set; }

        public KhachHang MaKhachHangNavigation { get; set; }
        public ICollection<LichSuThanhToan> LichSuThanhToan { get; set; }
    }
}
