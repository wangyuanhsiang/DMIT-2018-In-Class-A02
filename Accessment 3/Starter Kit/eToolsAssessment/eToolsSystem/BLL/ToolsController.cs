using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using eToolsSystem.Entities;
using eToolsSystem.Entities.POCOs;
using eToolsSystem.DAL;
#endregion

namespace eToolsSystem.BLL
{
    [DataObject]
    public class ToolsController
    {
        #region Position List
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Position> Positions_List()
        {
            using (ToolsContext context = new ToolsContext())
            {
                return context.Positions.ToList();
            }
        }


        #endregion

        #region Assessment Report Linq

       //Setup Linq query for report
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ReportEmployee> Employee_byPositionReport(int positionid)
        {
            using(var context = new ToolsContext())
            {
                if (positionid != 0)
                {
                    var result = from Employee in context.Employees
                                 where Employee.Positions.PositionID == positionid
                                 orderby Employee.Positions.Description ascending
                                 select new ReportEmployee

                                 {
                                     Position = Employee.Positions.Description,
                                     Name = Employee.LastName + ", " + Employee.FirstName,
                                     Hired = Employee.DateHired,
                                     Release = Employee.DateReleased
                                 };
                    return result.ToList();
                }
                else
                {
                    var result2 = from Employee in context.Employees
                                 orderby Employee.Positions.Description ascending
                                 select new ReportEmployee
                                 {
                                     Position = Employee.Positions.Description,
                                     Name = Employee.LastName + ", " + Employee.FirstName,
                                     Hired = Employee.DateHired,
                                     Release = Employee.DateReleased
                                 };
                   

                    return result2.ToList();
                }
               

            }


        }



     
        #endregion


    }
}
