using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class KhuVucHoatDong
    {
        public int MaKhuVucHoatDong { get; set; }
        public int? MaShipper { get; set; }
        public int? KhuVuc { get; set; }

        public KhuVuc KhuVucNavigation { get; set; }
        public Shipper MaShipperNavigation { get; set; }
    }
}
