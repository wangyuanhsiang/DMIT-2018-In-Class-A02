<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReservationByEventCode.aspx.cs" Inherits="Admin_ReservationByEventCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <table class="nav-justified">
        <tr>
            <td>
                <asp:DropDownList ID="SpecialEventDropDownList" runat="server" DataSourceID="SpecialEventDataSource" DataTextField="Description" DataValueField="EventCode" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem value ="none" >[Select a Special Event]</asp:ListItem>
                    <asp:ListItem Value =" ">[No Event]</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
               
            </td>
        </tr>
        <tr>
            <td colspan ="2">
                <asp:GridView ID="GridViewDTO" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ReservationDataSource">
                    <Columns>
                        <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" />
                        <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                        <asp:BoundField DataField="ReservationDate" HeaderText="ReservationDate" SortExpression="ReservationDate" />
                        <asp:BoundField DataField="NumberinParty" HeaderText="NumberinParty" SortExpression="NumberinParty" />
                        <asp:BoundField DataField="ContactPhone" HeaderText="ContactPhone" SortExpression="ContactPhone" />
                        <asp:BoundField DataField="ReservationStatus" HeaderText="ReservationStatus" SortExpression="ReservationStatus" />
                        <asp:BoundField DataField="EventCode" HeaderText="EventCode" SortExpression="EventCode" />
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
    <asp:ObjectDataSource ID="SpecialEventDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListSpecialEvent" TypeName="eRestaurant.Framework.BLL.TempController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ReservationDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getReservationByEventCode" TypeName="eRestaurant.Framework.BLL.TempController">
        <SelectParameters>
            <asp:ControlParameter ControlID="SpecialEventDropDownList" Name="eventCode" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

