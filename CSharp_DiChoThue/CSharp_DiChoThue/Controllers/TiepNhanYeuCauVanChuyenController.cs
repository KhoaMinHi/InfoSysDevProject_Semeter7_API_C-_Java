using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CSharp_DiChoThue.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CSharp_DiChoThue.Controllers
{
    [Route("api/tiepnhandonhang/")]
    [ApiController]
    public class TiepNhanYeuCauVanChuyenController : ControllerBase
    {
        private readonly DiChoThueContext _context;
        public TiepNhanYeuCauVanChuyenController(DiChoThueContext context)
        {
            _context = context;
        }

       
        // GET: api/TiepNhanYeuCauVanChuyen/5
        [HttpGet("{idShipper}", Name = "tiepnhandonhang")]
        public IEnumerable<Object> Get(int idShipper)
        {
            var temp = (from s in _context.Shipper
                        join dh in _context.DonHang on s.MaShipper equals dh.MaShipper
                        join ct in _context.ChiTietDonHang on dh.MaDonHang equals ct.MaDonHang
                        join sp in _context.SanPham on ct.MaSanPham equals sp.MaSanPham
                        join dt in _context.DoiTacBanHang on sp.MaDoiTacBanHang equals dt.MaDoiTacBanHang
                        join dcdt in _context.DiaChiDoitac on dt.MaDoiTacBanHang equals dcdt.MaDoiTacBanHang
                        join dckh in _context.DiaChiKhachHang on dh.MaDiaChi equals dckh.MaDiaChi
                        join kh in _context.KhachHang on dh.MaKhachHang equals kh.MaKhachHang
                        where s.MaShipper == idShipper //&& dh.TrangThaiDonHang == 1
                        select new
                        {
                            s.MaShipper,
                            dh.NgayDatHang, dh.TrangThaiDonHang, dh.MaDonHang,
                            dcdt.DiaChi,
                            dt.SdtdoiTacBh,
                            dckh.DiaChiGiaoHang, dckh.Sdt,
                            kh.TenKhachHang,
                        }).Distinct().ToList();

            return temp;
        }


    }
}
