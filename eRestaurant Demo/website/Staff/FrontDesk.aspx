<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrontDesk.aspx.cs" Inherits="Staff_FrontDesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="well">
        <div class="pull-right col-md-5">
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
    <div>
        <h4>Mock Date/Time </h4>
        <asp:LinkButton ID="MockDateTime" runat="server" CssClass="btn btn-primary">Post-back new date/time:</asp:LinkButton>
        <asp:LinkButton ID="MockLastBillingDateTime" runat="server" CssClass="btn btn-default" OnClick="MockLastBillingDateTime_Click"> Set to Last-Billed date/time:</asp:LinkButton>
        &nbsp;
    <asp:TextBox ID="SearchDate" runat="server" TextMode="Date" Text="2014-10-16"></asp:TextBox>
        <asp:TextBox ID="SearchTime" runat="server" TextMode="Time" Text="13:00" CssClass="clockpicker"></asp:TextBox>
        <!-- Additional scripts/styles here -->
        <script src="../Scripts/clockpicker.js"></script>
        <script>
            $('.clockpicker').clockpicker({ donetext: 'Accept' });
        </script>
        <link  itemprop="ur1" href="../Content/standalone.css" rel="stylesheet" />
        <link itemprop ="ur1" href="../Content/clockpicker.css" rel="stylesheet" />
        <details style="display:inline-block";  vertical-align: top; >
            <summary class="badge" >About ClockPicker &hellip;</summary>
             <h4>Fancy Bootstrap <a href="http://weareoutman.github.io/clockpicker/">ClockPicker</a></h4>
            <p>The time uses the ClockPicker Bootstrap extension</p>
        </details>
    </div>
    <!-- this is the presentation markup code for the
        seating summary display-->
    <div class="col-md-7">
        <details open>
             <summary>Tables</summary>
            <p class="well"> This GridView uses a &lt;asp:TemplateField …&gt; for the 
                table number and the controls to handle walk-in seating. 
                Additionally, the walk-in seating form is in a panel that 
                only shows if the seat is <em>not</em> taken. Handling of 
                the action to <b>seat customers</b> is done in the code-behind, 
                on the GridView's <code>OnSelectedIndexChanging</code> event.</p>
        </details>
        <style type="text/css" >
            .inline-div {
                display:inline;
            }
        </style>
    </div>
    <div class=" pull-right col-md-5">
        <details open>
            <summary>Reservations by Date/Time</summary>
            <h4>Today's Reservations</h4>
            <asp:Repeater ID="ReservationsRepeater" runat="server" DataSourceID="ReservationsDataSource" ItemType="eRestaurant.Framework.Entities.DTOs.ReservationCollection">
                <ItemTemplate>
                    <div>
                        <h4><%# Item.Hour %></h4>
                        <asp:ListView ID="ReservationSummaryListView" runat="server" ItemType="eRestaurant.Framework.Entities.DTOs.ReservationSummary"
                            DataSource="<%# Item.Reservations %>">
                            <LayoutTemplate>
                                <div class="seating">
                                    <span  runat="server" id="itemPlaceholder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div>
                                  Name : ( <%# Item.Name %> )
                                  NumberInParty : ( <%# Item.NumberInParty %> ) 
                                  Status : ( <%# Item.Status %> ) 
                                  Event : ( <%# Item.Event %> )
                                  Contact : ( <%# Item.Contact %> )
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ReservationsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ReservationsByTime" TypeName="eRestaurant.Framework.BLL.SeatingController">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SearchDate" Name="date" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
        </asp:ObjectDataSource>
        </details>
    </div>
</asp:Content>

