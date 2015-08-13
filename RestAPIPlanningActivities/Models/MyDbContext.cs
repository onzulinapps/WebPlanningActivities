using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
//using System.Data.Entity.ModelConfiguration.Conventions; 
namespace RestAPIPlanningActivities.Models
{
    public class MyDbContext : DbContext
    {
        public MyDbContext()
            : base("MyDbContext")
        { //en el contructor no hago nada

            //inicializar la base de datos lo hare mediante MyDbInitializer en el web.config

            
            /* esto de momento no lo voy a utilizar utilizare otra estrategia
             * de inicializacion de la base de datos. 
            try
             * 
            {
                this.Database.Initialize(false);
            }
            catch (Exception ex)
            {
                
            }*/
            
        }

        public DbSet<AspNetUsers> AspNetUsers { get; set; }
        public DbSet<Actividades> Actividades { get; set; }
        public DbSet<ActividadesAmigos> ActividadesAmigos { get; set; }
        public DbSet<Amigos> Amigos { get; set; }
        public DbSet<AspNetRoles> AspNetRoles { get; set; }
        public DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public DbSet<AspNetUserRoles> AspNetUserRoles { get; set; }
        public DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        //public System.Data.Entity.DbSet<Npgsql_EF6.Models.ActorViewModels> ActorViewModels { get; set; }
        #region metodos
        /*
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //modelBuilder.Entity<ActividadesAmigos>().HasKey(a => new { a.idactividad, a.idamigo });
            
            modelBuilder.Entity().ToTable("AspNetUsers", "pubic");
            modelBuilder.Entity().ToTable("Album", "public");
            modelBuilder.Entity().ToTable("Cart", "public");
            modelBuilder.Entity().ToTable("Order", "public");
            modelBuilder.Entity().ToTable("OrderDetail", "public");
            modelBuilder.Entity().ToTable("Genre", "public");
            
        }
        */
        #endregion
    }
}