<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MessageUserControl.ascx.cs" Inherits="UserControls_WebUserControl" %>
<asp:Panel ID="MessagePanel" runat="server">
    <div>
        <asp:Label ID="MessageTitleIcon" runat="server"></asp:Label>
        <br />
        <asp:Label ID="MessageTitle" runat="server"></asp:Label>
    </div>
    <div class="plane-body">
        <asp:Label ID="MessageLabel" runat="server"></asp:Label>
        <asp:Repeater ID="MessageDetailsRepeater" runat="server" EnableViewState="False">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
            <ItemTemplate>
                <il><%# Eval("Error") %></il>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Panel>
