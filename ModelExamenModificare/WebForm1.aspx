<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ModelExamenModificare.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modificare</title>

    
</head>
<body>
   <form id="form1" runat="server">

    <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/BD_Examen.accdb"
        SelectCommand="SELECT [IdCarte], [Titlu], [An], [Autor] FROM [Carti]"
        DeleteCommand="DELETE FROM [Carti] WHERE [IdCarte] = ?"
        InsertCommand="INSERT INTO [Carti] ([Titlu], [An], [Autor]) VALUES (?, ?, ?)"
        UpdateCommand="UPDATE [Carti] SET [Titlu] = ?, [An] = ?, [Autor] = ? WHERE [IdCarte] = ?">
        <DeleteParameters>
            <asp:Parameter Name="IdCarte" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Titlu" Type="String" />
            <asp:Parameter Name="An" Type="Int32" />
            <asp:Parameter Name="Autor" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Titlu" Type="String" />
            <asp:Parameter Name="An" Type="Int32" />
            <asp:Parameter Name="Autor" Type="String" />
            <asp:Parameter Name="IdCarte" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ADS1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>

    <asp:Button ID="Button1" runat="server" Text="Modifica o carte" style="position:absolute; top: 14px; left: 471px;" OnClick="Button1_Click" />

    <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 54px; left: 467px; width: 481px; height: 286px;">
        <asp:Label ID="LblTitlu" runat="server" Text="Titlu" style="position:absolute; top: 31px; left: 18px; bottom: 136px;"></asp:Label>
        <asp:TextBox ID="TxtTitlu" runat="server" style="position:absolute; top: 32px; left: 105px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVTitlu" runat="server" ErrorMessage="Completati titlu" style="position:absolute; top: 34px; left: 262px;" ControlToValidate="TxtTitlu" SetFocusOnError="True" ValidationGroup="myValidationGroup"></asp:RequiredFieldValidator>

        <asp:Label ID="LblAn" runat="server" Text="An" style="position:absolute; top: 80px; left: 22px; bottom: 87px;"></asp:Label>
        <asp:TextBox ID="TxtAn" runat="server" style="position:absolute; top: 79px; left: 107px; right: 206px;"></asp:TextBox>
        <asp:RangeValidator ID="RVAn" runat="server" ErrorMessage="Anul trebuie să fie între 1500 și 2022" style="position:absolute; top: 80px; left: 274px;" ControlToValidate="TxtAn" MaximumValue="2022" MinimumValue="1500" SetFocusOnError="True" ValidationGroup="myValidationGroup"></asp:RangeValidator>
        <asp:RequiredFieldValidator ID="RFVAn" runat="server" ErrorMessage="Completati an" 
style="position:absolute; top: 80px; left: 274px;" ControlToValidate="TxtAn" SetFocusOnError="True" ValidationGroup="myValidationGroup"></asp:RequiredFieldValidator>
             
        <asp:Label ID="LblAutor" runat="server" Text="Autor" style="position:absolute; top: 134px; left: 25px;"></asp:Label>
        <asp:DropDownList ID="DdlAutor" runat="server" style="position:absolute; top: 130px; left: 109px;">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Mihai Eminescu</asp:ListItem>
            <asp:ListItem>Ion Creanga</asp:ListItem>
            <asp:ListItem>Petre Ispirescu</asp:ListItem>
            <asp:ListItem>Eckhart Tolle</asp:ListItem>
        </asp:DropDownList>

        <asp:Label ID="LblIdProdus" runat="server" Text="IdProdus" style="position:absolute; top: 183px; left: 25px;"></asp:Label>
        <asp:TextBox ID="TxtIdCarte" runat="server" style="position:absolute; top: 185px; left: 106px; width: 63px;" ReadOnly="True"></asp:TextBox>

        <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" style="position:absolute; top: 243px; left: 25px;" OnClick="BtnConfirma_Click" CausesValidation="True" ValidationGroup="myValidationGroup" />
        <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" style="position:absolute; top: 243px; left: 152px;" CausesValidation="False" OnClick="BtnRenunta_Click" />

        <asp:CustomValidator ID="CV" runat="server" style="position:absolute; top: 102px; left: 311px; width: 25px;" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="position:absolute; top: 211px; left: 271px; width: 199px;" ForeColor="Red" />
    </asp:Panel>
</form>


</body>
</html>
