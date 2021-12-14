using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class DanhMuc
    {
        public DanhMuc()
        {
            SanPham = new HashSet<SanPham>();
        }

        public int MaDanhMuc { get; set; }
        public string TenDanhMuc { get; set; }

        public ICollection<SanPham> SanPham { get; set; }
    }
}
