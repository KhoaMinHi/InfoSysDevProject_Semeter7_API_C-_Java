using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CSharp_DiChoThue.Models;
using Microsoft.AspNetCore.Mvc;

namespace CSharp_DiChoThue.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly DiChoThueContext _context;
        public ValuesController(DiChoThueContext context)
        {
            _context = context;
        }
        
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<KhachHang>> Get()
        {
            return _context.KhachHang.ToList();
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
