using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using eToolsSystem.Entities;
using eToolsSystem.DAL;
using eToolsSystem.Entities.POCOs;
#endregion

namespace eToolsSystem.BLL
{
    [DataObject]
    public class ToolsController
    {
        #region Assesment 1
        //Place your code here
        //All methods are to be DataObjectMethods

        //Query your Positions table

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Position> Position_List()
        {
            using (var context = new ToolsContext())
            {
                return context.Positions.ToList();
            }
        }

        //[DataObjectMethod(DataObjectMethodType.Select, false)]
        //public List<Employee> EmployeePosition()
        //{
        //    using (var context = new ToolsContext())
        //    { return context.Employees.ToList(); }
        //}

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Employee> EmployeePosition (int positionId)
        {
            using(var context = new ToolsContext())
            {
                var data = from info in context.Employees
                           where info.PositionID == positionId
                           select info;
                return data.ToList();
            }
        }
    

        //Query your Employees table using the PositionID parameter

        #endregion


        #region
        //dropdwonlist doesn't work
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<EmployeesPOCOs> getEmployeesPOCOs(int positionId)
        {
            using(var context = new ToolsContext())
            {
                var result = from Employee in context.Employees
                             where Employee.Position.PositionID == positionId
                             orderby Employee.EmployeeID descending
                             select new EmployeesPOCOs
                             {
                                 ID = Employee.EmployeeID,
                                 Name = Employee.FirstName + " " + Employee.LastName,
                                 DateHired = Employee.DateHired
                             };
                return result.ToList();
            }


        }
        #endregion



    }
}
