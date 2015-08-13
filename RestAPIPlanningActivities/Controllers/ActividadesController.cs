using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RestAPIPlanningActivities.Controllers
{
    public class ActividadesController : ApiController
    {
        // GET: api/Actividades
        //esto de aqui seguramente ni lo use en la version final 
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Actividades/5
        //aqui en vez poner el 
        public string Get(string email)
        {
            
            return email;
        }

        // POST: api/Actividades
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Actividades/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Actividades/5
        public void Delete(int id)
        {
        }
    }
}
