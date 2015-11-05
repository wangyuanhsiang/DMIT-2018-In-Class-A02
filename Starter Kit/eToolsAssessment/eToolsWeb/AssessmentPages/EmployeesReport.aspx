<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmployeesReport.aspx.cs" Inherits="AssessmentPages_EmployeesReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div>
        <asp:DropDownList ID="PositionDropDownList" runat="server" DataSourceID="DropDownList1DataSource" DataTextField="Description" DataValueField="PositionID" AppendDataBoundItems="True">
            <asp:ListItem Value = -1 >  [select a position] </asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:ObjectDataSource ID="DropDownList1DataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Position_List" TypeName="eToolsSystem.BLL.ToolsController"></asp:ObjectDataSource>
    </div>
    <br />
    <hr />
    <div>
        <rsweb:ReportViewer ID="EmployeeReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="Reports\EmployeesPOCOs.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ReportDataSource" Name="EmployeesDS" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    <asp:ObjectDataSource ID="ReportDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getEmployeesPOCOs" TypeName="eToolsSystem.BLL.ToolsController">
        <SelectParameters>
            <asp:ControlParameter ControlID="PositionDropDownList" Name="positionId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

