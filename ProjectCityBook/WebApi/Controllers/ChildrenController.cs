using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DTO;

namespace WebApi.Controllers
{
    [System.Web.Http.Cors.EnableCors(origins:"*", headers:"*",methods: "*")]
    public class ChildrenController : ApiController
    {
        [HttpGet]
        [Route("api/Children/GetChildren")]
        public List<ChildrenDTO> GetChildren()
        {
            return BL.ClassesBL.ChildrenBL.GetChildrenBL();
        }
        [HttpGet]
        [Route("api/Children/ChildIsNew")]
        public int ChildIsNew(string tzParent,string tzChild)
        {
            return BL.ClassesBL.ChildrenBL.theChildAlreadyExist(tzParent,tzChild);
        }
        [HttpPost]
        [Route("api/Children/PostChild")]
        // POST: api/Children
        public void PostChild([FromBody] ChildrenDTO child)
        {
            BL.ClassesBL.ChildrenBL.PostChildBL(child); 
            
        }

        // PUT: api/Children/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Children/5
        public void Delete(int id)
        {
        }
    }
}
