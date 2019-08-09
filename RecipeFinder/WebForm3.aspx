<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" StyleSheetTheme="Fridge" Inherits="RecipeFinder.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <div>
            Recipe Name:
            <asp:Label ID="inRecipeName" runat="server"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Amount] FROM [Ingredients] WHERE ([RecipeName] = @RecipeName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="inRecipeName" Name="RecipeName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [RecipeDirections] FROM [RecipeMaster] WHERE ([RecipeName] = @RecipeName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="inRecipeName" Name="RecipeName" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" SkinID="Grid" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Ingredient" SortExpression="Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Measurement" SortExpression="Amount" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server" SkinID="Grid" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="RecipeDirections" HeaderText="Recipe Directions" SortExpression="RecipeDirections" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search Again" SkinID="Submit" CssClass="btn btn-primary" PostBackUrl="~/WebForm1.aspx" />
        </div>
    </form>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerPlaceHolder" runat="server">
</asp:Content>
