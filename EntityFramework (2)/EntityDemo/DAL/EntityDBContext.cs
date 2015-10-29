using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using EntityDemo.Entities;
using System.Data.Entity;

namespace EntityDemo.DAL
{
    public class EntityDBContext : DbContext
    {
        public EntityDBContext() : base("name=D") { }

        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }

    }
}
