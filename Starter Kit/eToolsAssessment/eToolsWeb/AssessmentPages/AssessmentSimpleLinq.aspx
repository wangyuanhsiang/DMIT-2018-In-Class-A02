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
                <asp:DropDownList ID="EmployeePositionList" runat="server" DataSourceID="DropDownListDataSource" DataTextField="Description" DataValueField="PositionID" AppendDataBoundItems="True"> 
                    <asp:ListItem Value= -1>[Select Position]</asp:ListItem>
                    <asp:ListItem Value="">[No Event]</asp:ListItem>
                </asp:DropDownList>
                <asp:LinkButton ID="FetchEmployees" runat="server" >Fetch Employees</asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:GridView ID="EmployeesResultList" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GridViewDataSource" ForeColor="#333333" GridLines="None" AllowPaging="True" >
                    <AlternatingRowStyle BackColor="White" />
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
                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                   
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="DropDownListDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Position_List" TypeName="eToolsSystem.BLL.ToolsController"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="GridViewDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="EmployeePosition" TypeName="eToolsSystem.BLL.ToolsController" >
        <SelectParameters>
            <asp:ControlParameter ControlID="EmployeePositionList" Name="positionId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>

