using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using DTO;
using BL;
using System.Web.Routing;
using Newtonsoft.Json;

namespace WebApi.Controllers
{
    [System.Web.Http.Cors.EnableCors(origins:"*",headers:"*",methods:"*")]
    public class UsersController : ApiController
    {
        [HttpGet]
        [Route("api/Users/GetUsers")]
        public List<UsersDTO> GetUsers()
        {
            return BL.ClassesBL.UsersBL.GetUsersBL();
        }
        [HttpGet]
        [Route("api/Users/getJSON")]
        public string newChildForUser(string tz)
        {
           return  JsonConvert.SerializeObject(BL.ClassesBL.UsersBL.GetUserBl(tz));
         
        }
        [HttpPost]
        [Route("api/Users/PostUser")]
        public void PostUser([FromBody]UsersDTO user)
        {
            BL.ClassesBL.UsersBL.PostUserBL(user);
        }

        // PUT: api/Users/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Users/5
        public void Delete(int id)
        {
        }
    }
}
