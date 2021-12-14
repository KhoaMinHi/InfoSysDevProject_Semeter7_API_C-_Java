using System;
using System.Collections.Generic;

namespace CSharp_DiChoThue.Models
{
    public partial class TinhTrangSucKhoe
    {
        public TinhTrangSucKhoe()
        {
            Shipper = new HashSet<Shipper>();
        }

        public int MaTtsk { get; set; }
        public string TenTtsk { get; set; }
        public byte? SoMuiDaTiem { get; set; }

        public ICollection<Shipper> Shipper { get; set; }
    }
}
