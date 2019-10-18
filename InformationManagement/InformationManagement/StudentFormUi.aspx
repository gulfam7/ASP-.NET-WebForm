<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentFormUi.aspx.cs" Inherits="InformationManagement.StudentFormUi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="student-form">
        <h1>Student Information Form</h1>
    <div class="form-group">
        <label for="inputName">Student Name</label>
        <input type="text" class="form-control" id="inputName" runat="server" placeholder="Enter Name"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inputName" ForeColor="red" Display="Dynamic" ErrorMessage="Name can't be empty"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label for="inputEmail">Email Address</label>
        <input type="email" class="form-control" id="inputEmail" runat="server" placeholder="Enter Email"/>
    </div>
    <div class="form-group">
        <label for="inputRegNo">Reg No</label>
        <input type="text" class="form-control" id="inputRegNo" runat="server" placeholder="Enter RegNo"/>
    </div>
    <div class="form-group">
        <label for="inputMobile">Mobile No</label>
        <input type="text" class="form-control" id="inputMobile" runat="server" placeholder="Enter Mobile No"/>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="red" ControlToValidate="inputMobile" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Invalid Number"></asp:CompareValidator>
    </div>
    <div class="form-group">
        <label>Date of Birth</label>
        <asp:TextBox ID="dateTextBox" runat="server"></asp:TextBox> <asp:ImageButton ID="doBImageButton" runat="server" Height="23px" ImageUrl="~/image/calendar-512.png" Width="41px" OnClick="doBImageButton_Click" />
        <br/>
        <asp:Label ID="yearLabel" runat="server" Text="Year"></asp:Label>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        <asp:Label ID="monthLabel" runat="server" Text="Month"></asp:Label> <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
       
        <br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="172px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="298px" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
            <DayStyle Width="14%" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
            <TodayDayStyle BackColor="#CCCC99" />
        </asp:Calendar>
       
    </div>
    <div class="form-group">
        <label for="inputAddress">Address</label>
        <input type="text" class="form-control" id="inputAddress" runat="server" placeholder="Enter Address"/>
    </div>
    <asp:Button ID="saveButton" class="btn btn-primary" runat="server" Text="Save" OnClick="saveButton_Click" />
        <br/>
        <asp:Label ID="messageLabel" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="studentGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" Height="157px" Width="286px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
            <Columns>
                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <%#Eval("StudentName") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%#Eval("Email") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reg No.">
                    <ItemTemplate>
                        <%#Eval("RegNo") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile No.">
                    <ItemTemplate>
                        <%#Eval("Mobile") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <%#Eval("DoB") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%#Eval("Address") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


