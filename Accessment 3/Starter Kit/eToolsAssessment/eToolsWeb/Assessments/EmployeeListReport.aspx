<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmployeeListReport.aspx.cs" Inherits="Assessments_EmployeeListReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <center><h1>Assessment: Report</h1></center>
    Select the position:&nbsp;&nbsp;
    <asp:DropDownList ID="PositionList" runat="server" DataSourceID="PositionListDataSource" DataTextField="Description" DataValueField="PositionID" AppendDataBoundItems="True">
        <asp:ListItem Value="-1">Position ??</asp:ListItem>
        <asp:ListItem Value="0">All</asp:ListItem>
    </asp:DropDownList>
     &nbsp;&nbsp;Press the report refresh button.
    <br/>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Reports\ReportEmployee.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ODSPositions" Name="ReportEmployeeDS" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    <br />   
    <my:MessageUserControl runat="server" ID="MessageUserControl" />
     <asp:ObjectDataSource ID="ODSPositions" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Employee_byPositionReport" 
        TypeName="eToolsSystem.BLL.ToolsController" >
         <SelectParameters>
             <asp:ControlParameter ControlID="PositionList" Name="positionid" PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PositionListDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Positions_List" TypeName="eToolsSystem.BLL.ToolsController"></asp:ObjectDataSource>
    </asp:Content>

