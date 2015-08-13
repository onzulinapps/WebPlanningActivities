using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Net.Http;
using System.Web.Http;
using System.Web;
using System.Threading.Tasks;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;
//using RestAPIPlanningActivities.Filtros;
using RestAPIPlanningActivities.Models;
using Newtonsoft.Json.Serialization;

namespace RestAPIPlanningActivities.Controllers
{
    //[Route]
    //[IdentityBasicAuthentication] // Enable Basic authentication for this controller.
    //[Authorize] // Require authenticated requests.
    public class LoginController : ApiController
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        private MyDbContext db = new MyDbContext();
        //contructor sin parametros
        public LoginController()
        {

        }

        public LoginController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
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
        // GET: api/Login

        //hay que asegurar el metodo que sea necesario ser administrador para poder llamarlo 
        //esto tiene sentido mientras este en desarrollo de la API cuando termine dejare de usarlo este metodo
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
        // GET: api/Login/5
        public string Get(int id)
        {
            return "value";
        }
        */
        // POST: api/Login
        public async Task<HttpResponseMessage> Post(LoginViewModel model)
        {
            //manda la clave por json y luego verificar en el server si es correcta la clave 
            db.Database.Connection.Open();

            // Require the user to have a confirmed email before they can log on.
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user != null)
            {
                if (!await UserManager.IsEmailConfirmedAsync(user.Id))
                {
                    //string callbackUrl = await SendEmailConfirmationTokenAsync(user.Id, "Confirm your account-Resend");
                    string callbackUrl = await SendEmailConfirmationTokenAsync(user.Id, "Confirma su cuenta reenviandola");
                    var respuestaEmail = Request.CreateResponse(HttpStatusCode.OK);
                    respuestaEmail.Content = new StringContent("Please confirm your account", Encoding.UTF8, "application/json");
                    return respuestaEmail;
                }
            }


            // No cuenta los errores de inicio de sesión para el bloqueo de la cuenta
            // Para permitir que los errores de contraseña desencadenen el bloqueo de la cuenta, cambie a shouldLockout: true
            var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    var respuesta = Request.CreateResponse(HttpStatusCode.OK);
                    respuesta.Content = new StringContent("access enabled", Encoding.UTF8, "application/json");
                    return respuesta;
                case SignInStatus.LockedOut:
                    var respuesta2 = Request.CreateResponse(HttpStatusCode.Unauthorized);
                    respuesta2.Content = new StringContent("This account has been blocked", Encoding.UTF8, "application/json");
                    return respuesta2;
                case SignInStatus.RequiresVerification:
                    //return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
                    var respuesta3 = Request.CreateResponse(HttpStatusCode.Unauthorized);
                    respuesta3.Content = new StringContent("Requires verification email", Encoding.UTF8, "application/json");
                    return respuesta3;
                case SignInStatus.Failure:
                default:
                    //ModelState.AddModelError("", "Intento de inicio de sesión no válido.");
                    var respuesta4 = Request.CreateResponse(HttpStatusCode.Unauthorized);
                    respuesta4.Content = new StringContent("Login attempt invalid", Encoding.UTF8, "application/json");
                    return respuesta4;
            }

        }
        public async Task<string> SendEmailConfirmationTokenAsync(string userID, string subject)
        {


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
        /*
        // PUT: api/Login/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Login/5
        public void Delete(int id)
        {
        }
        */
    }
}
