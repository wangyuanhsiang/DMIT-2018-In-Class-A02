<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrontDesk.aspx.cs" Inherits="Staff_FrontDesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class ="well">        
        <div class="pull-right col-md-5" >
                <small>Last Billed Date/Time</small>
                <div>
                <asp:Repeater ID="TempBillDateRepeater" runat="server" DataSourceID="TempBillDateDataSource" ItemType="System.DateTime">
                    <ItemTemplate>
                        <%# Item.ToShortDateString() %>
                        &ndash;
                        <%# Item.ToShortTimeString() %>>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
            <asp:ObjectDataSource ID="TempBillDateDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getLastBillDateTime" TypeName="eRestaurant.Framework.BLL.TempController"></asp:ObjectDataSource>
        </div>
    </div>
    <h4>Mock Date/Time </h4>
    <asp:LinkButton ID="MockDateTime" runat="server" CssClass="btn btn-primary" >Post-back new date/time:</asp:LinkButton>
    <asp:LinkButton ID="MockLastBillingDateTime" runat="server" CssClass="btn btn-default" OnClick="MockLastBillingDateTime_Click"> Set to Last-Billed date/time:</asp:LinkButton>
     &nbsp;
    <asp:TextBox ID="SearchDate" runat="server"  TextMode="Date" Text="2014-10-16" ></asp:TextBox>
    <asp:TextBox ID="SearchTime" runat="server" TextMode="Time" Text="13:00" CssClass="clockpicker" ></asp:TextBox>
</asp:Content>

