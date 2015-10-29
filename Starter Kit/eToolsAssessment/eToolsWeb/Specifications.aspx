<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Specifications.aspx.cs" Inherits="Specifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<%--div#topicid.bobclass--%>

<%--<div id="topic" class="bob">--%>
   <%-- h1+p+(ul>li*3>lorem)+p*3+figure>figcaption--%>
    <header class="page-header">
        <img src="Images/Logo.PNG" style="float:right; width:300px; height: 135px" />
        <h1>EF Code-First + Simple LINQ</h1>
        <h2>
            <span class="fa-stack fa-lg">
                <i class="fa fa-github fa-stack-1x text-muted"></i>
                <i class="fa fa-ban fa-stack-2x text-danger"></i>
            </span>
            Do <u>NOT</u> Store in a Repository
        </h2>
    </header>
    <table>

    <tr>
        <td>
            Course Weight:
        </td>
        <th>
            10% &nbsp;&nbsp;<a href="MarkingRubik.aspx">Evaluation</a>
        </th>
    </tr>
     <tr>
        <td>
            Assessment Date:
        </td>
        <th>
            <%= DateTime.Today.ToString("MMM dd, yyyy") %>
        </th>
    </tr>
     <tr>
        <td>
            Student Name:
        </td>
        <td>
            
        </td>
    </tr>
    </table>
    <br /><br />
    <p>
        In this assessment you are required to implement simple Linq to Entity queries to obtain employees by position. In this assesment, you will be evaluated on the following:
     </p>   <ul>
        <li>create Entity class defintions</li>
        <li>create the DBContext class</li>
        <li>create controller methods containing Linq to Entity calls</li>
          <li>use the ObjectDatasource control for data-binding controls to controller methods</li>
    </ul>  
  
    <p>
You have been supplied a starting solution for this assessment called eToolsAssessment. You are to place this folder onto your 
        machine’s desktop. The solution folder contains the database in a .bak (backup file) 
        called eTools.bak. The starting solution has certain portions of the assessment pre-coded. This code works and should not be altered.</p>
    <p>
You are to complete each of the activities to create a successful solution to this assessment. You will need to use specified names 
        in portions of the activities to integrate with the existing code. You many need to create local variables to use in your answer (these variables can be 
        called whatever you wish). Use the following activity instructions to complete this assessment.
    </p>
    <h4>Activity 1 Setup</h4>
    <p>Restore the supplied SQL database. The database name is <strong>eTools</strong>. The database contains data for testing your solution.</p>
    <h4>Activity 2 Entities and DAL</h4>
    <p>Complete the class definitions for the Positiion and Employee entities found in <em>eToolsSystem.Entities.Position.cs</em> and <em>eToolsSystem.Entities.Employee.cs</em>. Include the navigation properties for both classes. You may use fully implemented properties to define the class members. Create a &quot;not mapped&quot; property in the Employee class called FullName; this property should only have a get implementation (no setter). FullName will return a concatenation of the employee last name and first name separated by a comma; example Welch, Don.</p>
    <p>Complete the DBContext class found in eToolsSystem.DAL.ToolsContext.The connection string name is eToolsDB. The DbSet names are Positions and Employees.</p>
    <h4>Activity 3 BLL</h4>
    <p>Add the necessary DataObjectMethods to query the Position and Employee entities. The Position query, Postions_List, will return a list of positions. The Employee query, EmployeesbyPosition, will return a list of 
        employees for a given position id. The poisition id will be a supplied parameter. Both queries return all entity memebers.
    </p>
        <h4>Activity 4 WebForm: AssessmentPages/AssessmentSimpleLinq</h4>
    <p>Add the necessary ObjectDataSource controls for the Position and Employee queries. The Position ODS will be used by the dropdownlist EmployeePostionList. 
        The Employee ODS will be used by the gridview EmployeeResultList. The Employee ODS will obtain the position id from the dropdownlist. 
        Enable the Empty Template with an appropriate message for the gridview. Enable paging for the gridview.
        Set the page size to 5. The is no code that is required for this form. The link button control has been supplied to cause the post back.
    </p>
    <br /><br />
    <figure>
        <img src="Images/SampleDisplay.png" class="img-responsive"/>
        <figcaption>Resulting display of the drop down list Associate selection</figcaption>
    </figure>
    <%--</div>--%>
</asp:Content>


