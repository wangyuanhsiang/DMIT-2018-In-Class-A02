<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SpecailEventManagement.aspx.cs" Inherits="Admin_SpecailEventManagement" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-md-12">
        <h1>Manage Special Events <span class="glyphicon glyphicon-glass"></span></h1>
    </div>
    <div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SpecialEventDataSource" InsertItemPosition="LastItem" DataKeyNames="EventCode">
            <EditItemTemplate>
                <div>

                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    &nbsp;&nbsp;
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    &nbsp;&nbsp;&nbsp;
                     <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />

                    <asp:TextBox ID="EventCodeTextBox" runat="server" Text='<%# Bind("EventCode") %>' />
                    &mdash;
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                </div>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <div>

                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert">Insert &nbsp; <span class="glyphicon glyphicon-plus"></span> </asp:LinkButton>
                    &nbsp;&nbsp;
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel">Clear &nbsp; <span class="glyphicon glyphicon-refresh"></spa></asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                     <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                    &mdash;
                        <asp:TextBox ID="EventCodeTextBox" runat="server" Text='<%# Bind("EventCode") %>' />
                    &mdash;
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
                <div>
                   
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" >Delete &nbsp; <span class="glyphicon glyphicon-trash"> </asp:LinkButton>
                    &nbsp;&nbsp;
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" >Edit &nbsp; <span class="glyphicon glyphicon-pencil"></asp:LinkButton>
                   &nbsp;&nbsp;&nbsp;
                    
                        <asp:Label ID="EventCodeLabel" runat="server" Text='<%# Eval("EventCode") %>' />
                     &mdash;
                    
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                     &mdash;
                        <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                    

                </div>
            </ItemTemplate>
            <LayoutTemplate>
              <fieldset runat="server" >
                   <div runat="server" id="itemPlaceholder" />
              </fieldset>
            </LayoutTemplate>
        </asp:ListView>

        <my:MessageUserControl runat="server" ID="MessageUserControl" />
        <asp:ObjectDataSource ID="SpecialEventDataSource" runat="server" DataObjectTypeName="eRestaurant.Framework.Entities.SpecialEvent" DeleteMethod="DeleteSpecialEvent" InsertMethod="AddSpecialEvent" OldValuesParameterFormatString="original_{0}" SelectMethod="ListSpecialEvent" TypeName="eRestaurant.Framework.BLL.TempController" UpdateMethod="UpdateSpecialEvent" OnDeleted="HandleCRUDErrors" OnInserted="HandleCRUDErrors" OnUpdated="HandleCRUDErrors"></asp:ObjectDataSource>
    </div>

</asp:Content>

