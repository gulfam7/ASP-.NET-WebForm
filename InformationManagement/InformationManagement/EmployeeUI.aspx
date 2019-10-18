<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeUI.aspx.cs" Inherits="InformationManagement.EmployeeUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <div class="form-group">
    <label for="inputName">Employee Name</label>
        <input type="text" class="form-control" id="inputName" runat="server" placeholder="Enter Name"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inputEmpName" ForeColor="red" Display="Dynamic" ErrorMessage="Name Can't Be empty"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label for="inputEmpEmail">Employee Email</label>
        <input type="text" class="form-control"  runat="server" id="inputEmail"  placeholder="Enter Email"/>
    </div>
    <div class="form-group">
        <label for="inputEmpId">Employee Id</label>
        <input type="text" class="form-control"  runat="server" id="inputId"  placeholder="Enter Id"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inputEmpId" ForeColor="red" Display="Dynamic" ErrorMessage="You must provide employee Id"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Date of Birth</label>
        <asp:TextBox ID="dateTextBox" runat="server" Width="121px"></asp:TextBox><asp:ImageButton ID="dobImageButton" ImageUrl="~/image/calendar-512.png" runat="server" Height="26px" style="margin-left: 21px" Width="39px" OnClick="dobImageButton_Click" />
        <br/>
        <asp:Label ID="yearLabel" runat="server" Text="Year"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="monthLabel" runat="server" Text="Month"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"></asp:DropDownList>
        <br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="160px" NextPrevFormat="ShortMonth" Width="248px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <br/>

    </div>
        <div class="form-group">
            <label>Gender</label>
            <asp:RadioButton ID="maleRadioButton" runat="server" Text="Male" />
            <asp:RadioButton ID="femaleRadioButton" runat="server" Text="Female" Font-Bold="False" />
        </div>
        <div class="form-group">
            <label for="inputAddress">Address</label>
            <input type="text" class="form-control" id="inputAddress" runat="server" placeholder="Enter Address"/>
        </div>
        <asp:Button ID="saveButton" runat="server" Text="Save" class="btn btn-primary" />
        <asp:Label ID="messageLabel" runat="server"></asp:Label>
    </div>
</asp:Content>
