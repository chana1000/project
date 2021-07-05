using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;
using BL;

namespace WebApi.Controllers
{
    [System.Web.Http.Cors.EnableCors("*", "*", "*")]
    public class HMOController : ApiController
    {
        [HttpGet]
        [Route("api/HMO/GetHMO")]
        public List<HmoDTO> GetHMO()
        {
            return BL.ClassesBL.HmoBL.GetHmosBL();
        }

        // GET: api/HMO/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/HMO
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/HMO/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/HMO/5
        public void Delete(int id)
        {
        }
    }
}
