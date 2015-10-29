using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel;
using EntityDemo.DAL;
using EntityDemo.Entities;

namespace EntityDemo.BLL
{
    [DataObject]
     public class EntityController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Employee> ListEmployee()
        {
            using (var context = new EntityDBContext())
            { return context.Employees.ToList(); }
        }


        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public void getEmployee(int ID)
        {
            using(var context = new EntityDBContext())
            {
                context.Employees.Find(ID);
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void addEmployee(Employee Entities)
        {
            using(var context = new EntityDBContext())
            { var adding = context.Employees.Add(Entities); context.SaveChanges();}
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void updateEmployee(Employee Entities)
        {
            using(var context = new EntityDBContext())
            {
                var updating = context.Employees.Attach(Entities);
                var matchingWithExistingValues = context.Entry<Employee>(updating);
                matchingWithExistingValues.State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void deleteEmployee(Employee Entities)
        {
            using(var context = new EntityDBContext())
            {
                var existingvalue = context.Employees.Find(Entities.ID);
                context.Employees.Remove(existingvalue);
                context.SaveChanges();
            }
        }




    }
}
