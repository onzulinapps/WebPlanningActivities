using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using System.Web.Http;
using System.Web;
using System.Web.Http.Routing;
using System.Web.Http.Description;
using RestAPIPlanningActivities.Models;


namespace RestAPIPlanningActivities.Controllers
{
    public class UsuariosRestController : ApiController
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        #region atributos
        private MyDbContext db = new MyDbContext();
        

        #endregion
        #region constructores
        public UsuariosRestController()
        {
        }

        public UsuariosRestController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                //aqui en GetUserManager 
                return _userManager ?? HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.Current.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        #endregion

        //hay que asegurar el metodo que sea necesario ser administrador para poder llamarlo 
        public IQueryable<UsuariosDTO> Get()
        {
            //db.Database.Connection.Open();
            //return db.Usuarios;
            db.Database.Connection.Open();

            var usuarios = from u in db.AspNetUsers
                           select new UsuariosDTO()
                           {
                               id = u.Id,
                               email = u.Email,
                               emailConfirmed = u.EmailConfirmed,
                               nombre = u.Nombre,
                               apellidos = u.Apellidos,
                           };

            return usuarios;

        }
        /*
        public IQueryable<UsuariosDTO> Get(string email)
        {
            db.Database.Connection.Open();

            AspNetUsers usuario = db.AspNetUsers.Find(email);
            if (usuario == null)
            {
                return NotFound();
            }
        }
        */
        
        // GET: api/UsuariosRest/5
        //public IEnumerable<Product> GetProductById(int id) { }
        //[Route("api/usuariosrest/{email}")]
        /*
        [HttpGet]
        public IEnumerable<AspNetUsers> get(string id)
        {
            db.Database.Connection.Open();
            

            //AspNetUsers usuario = db.AspNetUsers.Find(id);
            IEnumerable<AspNetUsers> usuarios = db.AspNetUsers.ToList(); 
            IEnumerable<AspNetUsers> usuario = usuarios.Where<AspNetUsers>(mail => mail.Email == id);

            return usuario;
            
        }
        */
        //probaremos a escribir este metodo de esta manera a ver si me funciona y me devuelve el usuario que es lo que me interesa 
        [HttpGet]
        public AspNetUsers Get(string id)
        {

            AspNetUsers usuario = db.AspNetUsers.FirstOrDefault(u => u.Email == id);

            return usuario;

        }

        /*
        [ResponseType(typeof(AspNetUsers))]
        public async Task<IHttpActionResult> Get(string id)
        {
            db.Database.Connection.Open();
            AspNetUsers usuarios = new AspNetUsers();
            
            //sacar el listado de la tabla con todos los usuarios con su email y todos los campos y luego buscar por la cadena
            //List<AspNetUsers> Users = db.AspNetUsers.ToList();
            //IEnumerable<AspNetUsers> User = Users.Where(user => user.Email == id);
            usuarios = await db.AspNetUsers.FindAsync(id);
            //AspNetUsers usuario = User.First();
            if (usuarios == null)
            {
                return NotFound();

            }

            return Ok(usuarios.Id);

        }
        */
        // PUT: api/UsuariosRest/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutUsuarios(string id)
        {
            db.Database.Connection.Open();
            AspNetUsers usuarios = new AspNetUsers();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuarios.Id)
            {
                return BadRequest();
            }

            db.Entry(usuarios).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuariosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);

        }

        // POST: api/UsuariosRest

        [ResponseType(typeof(AspNetUsers))]
        public async Task<HttpResponseMessage> PostUsuarios(RegisterViewModel model)
        {
            db.Database.Connection.Open();

            IdentityUser user = new IdentityUser
            {
                UserName = model.Nombre,
                Email = model.Email
            };
            //creamos este objeto aqui y luego ya lo usamos segun necesitemos mandar el ok al telefono o que no se ha procesado la solicitud
            HttpResponseMessage response = new HttpResponseMessage();
            //llamar al objeto UserManager
            var User = new ApplicationUser { UserName = model.Email, Email = model.Email };
            var result = await UserManager.CreateAsync(User, model.Password);
            if (result.Succeeded)
            {
                //UrlHelper urlHelper = new UrlHelper(HttpContext.Current.Request.RequestContext, RouteTable.Routes);
                string callbackUrl = await SendEmailConfirmationTokenAsync(User.Id, "Confirm your account");
                response.StatusCode = HttpStatusCode.OK;
                return response;
            }
            else
            {
                response.StatusCode = HttpStatusCode.BadRequest;
                return response;
            }


        }

        // DELETE: api/UsuariosRest/5
        [ResponseType(typeof(AspNetUsers))]
        public async Task<IHttpActionResult> DeleteUsuarios(string id)
        {
            db.Database.Connection.Open();
            AspNetUsers usuarios = await db.AspNetUsers.FindAsync(id);
            if (usuarios == null)
            {
                return NotFound();
            }

            db.AspNetUsers.Remove(usuarios);
            await db.SaveChangesAsync();

            return Ok(usuarios);

        }

        protected override void Dispose(bool disposing)
        {

            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);

        }

        private bool UsuariosExists(string id)
        {
            db.Database.Connection.Open();
            return db.AspNetUsers.Count(e => e.Id == id) > 0;

        }

        //envio token de confirmacion 

        private async Task<string> SendEmailConfirmationTokenAsync(string userID, string subject)
        {

            //db.Database.Connection.Open();

            //var callbackUrl1 = string.Format("Account/ConfirmEmail?userId={0}&code={1}", userID, code);
            //var backUrl = Url.Content("http://192.168.1.4:2604");
            //var callbackUrl = backUrl + callbackUrl1;
            //var callbackUrl = Url.Action("ConfirmEmail", "Account",
            //   new { userId = userID, code = code }, protocol: Request.Url.Scheme);
            //var callBackUrl = ("ConfirmEmail", new AccountController = "AccountController",) 
            //string routeValue = "ConfirmEmail?userid=" + userID + "&code=" + code;
            //aqui voy a generar una ruta viendo como se hace con otro codigo 
            string code = await UserManager.GenerateEmailConfirmationTokenAsync(userID);
            string callBackUrl = this.Url.Link("DefaultApi", new { userId = userID, code = code });
            await UserManager.SendEmailAsync(userID, subject,
               "Please confirm your account by clicking <a href=\"" + callBackUrl + "\">here</a>");

            //return callbackUrl;

            return callBackUrl;

        }

        // GET: Api/UsuariosRest/ConfirmEmail
        [AllowAnonymous]
        [ActionName("ConfirmEmail"), HttpGet]
        public async Task<HttpResponseMessage> ConfirmEmail(string userId, string code)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            if (userId == null || code == null)
            {
                response.StatusCode = HttpStatusCode.BadRequest;
                return response;
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            response.StatusCode = HttpStatusCode.OK;
            return response;


        }

    }
}