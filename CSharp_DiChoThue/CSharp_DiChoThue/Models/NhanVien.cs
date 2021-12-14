using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class NhanVien
    {
        public NhanVien()
        {
            DonHang = new HashSet<DonHang>();
        }

        public int MaNhanVien { get; set; }
        public string HoTen { get; set; }
        public string Sdt { get; set; }
        public string Email { get; set; }
        public string Cmnd { get; set; }

        public ICollection<DonHang> DonHang { get; set; }
    }
}
