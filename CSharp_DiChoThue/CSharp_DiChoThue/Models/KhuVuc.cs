using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class KhuVuc
    {
        public KhuVuc()
        {
            DiaChiDoitac = new HashSet<DiaChiDoitac>();
            DiaChiKhachHang = new HashSet<DiaChiKhachHang>();
            KhuVucHoatDong = new HashSet<KhuVucHoatDong>();
        }

        public int MaKhuVuc { get; set; }
        public string QuanHuyen { get; set; }
        public string ThanhPho { get; set; }
        public string LoaiKhuVuc { get; set; }

        public ICollection<DiaChiDoitac> DiaChiDoitac { get; set; }
        public ICollection<DiaChiKhachHang> DiaChiKhachHang { get; set; }
        public ICollection<KhuVucHoatDong> KhuVucHoatDong { get; set; }
    }
}
