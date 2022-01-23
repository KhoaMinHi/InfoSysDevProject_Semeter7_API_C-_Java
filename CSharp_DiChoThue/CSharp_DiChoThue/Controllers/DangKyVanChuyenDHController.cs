using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CSharp_DiChoThue.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSharp_DiChoThue.Controllers
{
    [Route("api/dangkyvanchuyendh")]
    [ApiController]
    public class DangKyVanChuyenDHController : ControllerBase
    {
        private readonly DiChoThueContext _context;
        public DangKyVanChuyenDHController(DiChoThueContext context)
        {
            _context = context;
        }

        // GET: api/DangKyVanChuyenDH
        [HttpGet]
        public ActionResult<IEnumerable<DonHang>> Get()
        {
            return _context.DonHang.ToList();
        }

        //Dang ky van chuyen don hang
        // PUT: api/DangKyVanChuyenDH/5
        [HttpPut("{maDonHang}/{maShipper}")]
        public ActionResult<object> Put(int maDonHang, int maShipper)
        {
            try
            {
                if ((_context.Shipper.FindAsync(maShipper)) == null)
                {
                    return NotFound($"Shipper with Id = {maShipper} not found");
                }
                if (_context.DonHang.FindAsync(maDonHang) == null)
                {
                    return NotFound($"Employee with Id = {maDonHang} not found");
                }


                DonHang donhang = new DonHang
                {
                    MaDonHang = maDonHang
                };
                _context.DonHang.Attach(donhang);
                donhang.TrangThaiDonHang = 2;
                return _context.SaveChanges(); //to save data into database
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                "Error updating data");
            }
        }
    }
}
