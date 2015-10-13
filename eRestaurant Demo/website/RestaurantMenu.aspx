﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RestaurantMenu.aspx.cs" Inherits="RestaurantMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row col-md-12" >
        <h1>Our Menu Items</h1>
        <asp:Repeater ID="MenuItemRepeater" runat="server" DataSourceID="MenuItemDataSource">
            <ItemTemplate>
                 <div>
                <%# ((decimal)Eval("CurrentPrice")).ToString() %>
                <%# Eval("Description") %>
                <%# Eval("Calories") %>
                 </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="MenuItemDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListMenuItem" TypeName="eRestaurant.Framework.BLL.MenuController"></asp:ObjectDataSource>
    </div>
</asp:Content>

