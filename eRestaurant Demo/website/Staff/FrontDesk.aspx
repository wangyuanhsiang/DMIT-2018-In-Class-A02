<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrontDesk.aspx.cs" Inherits="Staff_FrontDesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class ="well">
         <h4>Mock Date/Time </h4>
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
</asp:Content>

