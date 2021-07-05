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
    public class KindController : ApiController
    {
        [HttpGet]
        [Route("api/Kind/GetKind")]
        public List<KindDTO> GetKind()
        {
            return BL.ClassesBL.KindBL.GetKindsBL();
        }

        // GET: api/Kind/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Kind
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Kind/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Kind/5
        public void Delete(int id)
        {
        }
    }
}
