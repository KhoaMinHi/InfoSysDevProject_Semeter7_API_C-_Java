using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class LichSuThanhToan
    {
        public int MaLichSuThanhToan { get; set; }
        public string HinhThucThanhToan { get; set; }
        public int? MaThongTinThanhToan { get; set; }

        public ThongTinThanhToan MaThongTinThanhToanNavigation { get; set; }
    }
}
