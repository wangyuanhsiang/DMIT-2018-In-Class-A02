using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using eRestaurantSystem.Entities;


namespace eRestaurantSystem.DAL
{
    public class RestaurantContext : DbContext
    {
        public RestaurantContext() : base("name=Erestaurant") { }

        public DbSet<Table> Tables { get; set; }
        public DbSet<Reservation> Reservations { get; set; }
        public DbSet<SpecialEvent> SpecialEvents { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Reservation>()
            .HasMany(r => r.Tables)
            .WithMany(t => t.Reservations)
            .Map(mapping =>
            {
                mapping.ToTable("ReservationTables");
                mapping.MapRightKey("TableID");
                mapping.MapLeftKey("ReservationID");
            });
            base.OnModelCreating(modelBuilder);
        }
        
    }
}
