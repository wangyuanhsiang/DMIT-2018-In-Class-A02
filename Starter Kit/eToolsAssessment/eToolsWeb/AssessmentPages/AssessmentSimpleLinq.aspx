<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssessmentSimpleLinq.aspx.cs" Inherits="AssessmentPages_AssessmentSimpleLinq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table align="center" class="nav-justified">
        <tr>
            <td colspan="2" ><h1>Assessment: Linq to Entitiy Query</h1></td>
            
        </tr>
          <tr>
            <td colspan="2" align="center">
                <asp:Label ID="FormMessage" runat="server" ></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Select a Position"></asp:Label></td>
            <td>
                <asp:DropDownList ID="EmployeePositionList" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Description" DataValueField="PositionID" AppendDataBoundItems="True"> 
                    <asp:ListItem Value="none">[Select Position]</asp:ListItem>
                    <asp:ListItem Value="">[No Event]</asp:ListItem>
                </asp:DropDownList>
                <asp:LinkButton ID="FetchEmployees" runat="server" >Fetch Employees</asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:GridView ID="EmployeesResultList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" >
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="DateHired" HeaderText="DateHired" SortExpression="DateHired" />
                        <asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
                        <asp:BoundField DataField="PositionID" HeaderText="PositionID" SortExpression="PositionID" />
                        <asp:BoundField DataField="LoginID" HeaderText="LoginID" SortExpression="LoginID" />
                        <asp:BoundField DataField="EmployeeUID" HeaderText="EmployeeUID" SortExpression="EmployeeUID" />
                        <asp:BoundField DataField="FullName" HeaderText="FullName" ReadOnly="True" SortExpression="FullName" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                   
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="EmployeePosition" TypeName="eToolsSystem.BLL.ToolsController">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Position_List" TypeName="eToolsSystem.BLL.ToolsController"></asp:ObjectDataSource>
</asp:Content>

