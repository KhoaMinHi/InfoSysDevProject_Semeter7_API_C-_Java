using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class Shipper
    {
        public Shipper()
        {
            DonHang = new HashSet<DonHang>();
            KhuVucHoatDong = new HashSet<KhuVucHoatDong>();
        }

        public int MaShipper { get; set; }
        public string HoTen { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string SoDienThoai { get; set; }
        public string Cmnd { get; set; }
        public int? TinhTrangSucKhoe { get; set; }
        public string ViTriHienTai { get; set; }
        public double? Latitude { get; set; }
        public double? Longtitude { get; set; }

        public TinhTrangSucKhoe TinhTrangSucKhoeNavigation { get; set; }
        public ICollection<DonHang> DonHang { get; set; }
        public ICollection<KhuVucHoatDong> KhuVucHoatDong { get; set; }
    }
}
