using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.Data.Entity;
using eToolsSystem.Entities;

#endregion


namespace eToolsSystem.DAL
{
    internal class ToolsContext:DbContext
    {
        //set up your context method
        public ToolsContext() : base("name=ToolsDB") { }

        //set up your DBSets

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Position> Positions { get; set; }
    }
}
