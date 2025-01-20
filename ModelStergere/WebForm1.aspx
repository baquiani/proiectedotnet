
<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ModelStergere.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <asp:AccessDataSource ID="ADS2" runat="server" DataFile="~/App_Data/BD_Examen.accdb" 
     SelectCommand="SELECT [Data], [Persoana], [IdCarte] FROM [Imprumuturi]" >
</asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" Text="Carti"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ADS1"
            GridLines="Vertical">
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
        <asp:Label ID="Label2" runat="server" Text="Imprumuturi"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Sterge o carte" style="position:absolute; 
             top: 14px; left: 471px;" OnClick="Button1_Click"  />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
             BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
             DataKeyNames="Data,Persoana,IdCarte" DataSourceID="ADS2">
            <Columns>
              <asp:BoundField DataField="Data" HeaderText="Data" ReadOnly="True" SortExpression="Data" />
              <asp:BoundField DataField="Persoana" HeaderText="Persoana" ReadOnly="True" 
                   SortExpression="Persoana" />
              <asp:BoundField DataField="IdCarte" HeaderText="IdCarte" ReadOnly="True" 
                   SortExpression="IdCarte" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
         </asp:GridView>
         <asp:Panel ID="Panel1" runat="server" style="position :absolute; top: 117px; left: 507px; 
              width: 295px; height: 196px;">
             <asp:Label ID="Label3" runat="server" Text="Confirmati stergerea cartii" 
              style="position:absolute; top: 9px; left: 31px;"></asp:Label>
            <asp:TextBox ID="TxtTitlu" runat="server" 
             style="position:absolute; top: 35px; left: 23px; width: 196px;" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="Id" 
            style="position :absolute; top: 65px; left: 29px;"></asp:Label>
            <asp:TextBox ID="TxtIdCarte" runat="server" 
            
            style="position :absolute; top: 64px; left: 55px; height: 20px; width: 44px;" ReadOnly="True"></asp:TextBox>
            <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" 
            style="position :absolute; top: 98px; left: 30px;"  />
            <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" 
            style="position :absolute; top: 96px; left: 143px;" OnClick="BtnRenunta_Click"
            CausesValidation="False" />
            <asp:CustomValidator ID="CV" runat="server" ErrorMessage="CustomValidator" 
            style="position :absolute; top: 54px; left: 126px; width: 19px; height: 33px;" 
            Text="&nbsp" OnServerValidate="CV_ServerValidate" ></asp:CustomValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            style="position :absolute; top: 138px; left: 28px;" ForeColor="#FF3300"/>
    </asp:Panel>

    </form>

</body>
</html>
