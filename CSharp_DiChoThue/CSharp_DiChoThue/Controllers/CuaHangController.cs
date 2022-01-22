using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CSharp_DiChoThue.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CSharp_DiChoThue.Controllers
{
    [Route("api/kiemtrathongcuahang")]
    [ApiController]
    public class CuaHangController : ControllerBase
    {
        private readonly DiChoThueContext _context;
        public CuaHangController(DiChoThueContext context)
        {
            _context = context;
        }


        // GET: api/CuaHang
        [HttpGet]
        public ActionResult<IEnumerable<DoiTacBanHang>> Get()
        {
            return _context.DoiTacBanHang.ToList();
        }

        //kiem tra thong tin cua hang
        // GET: api/CuaHang/5
        [HttpGet("{id}", Name = "Get")]
        public IEnumerable<Object> Get(int id)
        {
            var temp = (from dt in _context.DoiTacBanHang
                       join dc in _context.DiaChiDoitac on dt.MaDoiTacBanHang equals dc.MaDoiTacBanHang
                       where dt.MaDoiTacBanHang == id
                       select new
                       {
                           dt.TenDoiTacBh, dt.EmailDoiTacBh ,dt.SdtdoiTacBh, dt.NgayBatDauBan,
                           dt.MaSoThue,
                           dc.DiaChi

                       }).ToList();

            return temp;
        }

        
    }
}
