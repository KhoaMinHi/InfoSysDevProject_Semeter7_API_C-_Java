using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DiaChiDoitac
    {
        public int MaDiaChi { get; set; }
        public string DiaChi { get; set; }
        public int? MaDoiTacBanHang { get; set; }
        public int? KhuVuc { get; set; }
        public double? Latitude { get; set; }
        public double? Longtitude { get; set; }

        public KhuVuc KhuVucNavigation { get; set; }
        public DoiTacBanHang MaDoiTacBanHangNavigation { get; set; }
    }
}
