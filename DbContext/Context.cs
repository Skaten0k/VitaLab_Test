using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Model;
using System.Reflection.Emit;

namespace VitaLab_Test
{
    public class AppContext : DbContext
    {
        public DbSet<Income> Incomes { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Payment> Payments { get; set; }

        public AppContext()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("data source=DESKTOP-VJ6CIKB\\SQLEXPRESS;initial catalog=VitaLab_Test_Kharaman;trusted_connection=true");
            optionsBuilder.LogTo(s => System.Diagnostics.Debug.WriteLine(s));
        }

        protected override void ConfigureConventions(ModelConfigurationBuilder builder)
        {
            builder.Properties<DateOnly>().HaveConversion<DateOnlyConverter>().HaveColumnType("date");

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Income>()
                .ToTable("Income")
                .HasKey("Number");


            builder.Entity<Order>()
                .ToTable("Order"
                ).HasKey("Number");


            builder.Entity<Payment>()
                .ToTable("Payment")
                .HasKey(k => new {k.OrderNumber, k.IncomeNumber});
        }
    }
    public class DateOnlyConverter : ValueConverter<DateOnly, DateTime> 
    { 
        public DateOnlyConverter() : base(
            d => d.ToDateTime(TimeOnly.MinValue),
            d => DateOnly.FromDateTime(d)) { } 
    }
}
