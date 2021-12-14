using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class TrangThaiDonHang
    {
        public TrangThaiDonHang()
        {
            DonHang = new HashSet<DonHang>();
        }

        public int MaTrangThai { get; set; }
        public string TenTrangThai { get; set; }

        public ICollection<DonHang> DonHang { get; set; }
    }
}
