<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" StyleSheetTheme="Fridge" Inherits="RecipeFinder.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">

    <form id="form1" runat="server">
        <div>
            Search 1:
            <asp:Label ID="search1Lbl" runat="server"></asp:Label>
            <br />
            Search 2:
            <asp:Label ID="search2Lbl" runat="server"></asp:Label>
            <br />
            Search 3:
            <asp:Label ID="search3Lbl" runat="server"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [RecipeName] FROM [Ingredients] WHERE ([Name] LIKE '%' + @Name + '%') Intersect SELECT [RecipeName] FROM [Ingredients] WHERE ([Name] LIKE '%' + @Name2 + '%') Intersect SELECT [RecipeName] FROM [Ingredients] WHERE ([Name] LIKE '%' + @Name3 + '%')">
                <SelectParameters>
                    <asp:SessionParameter Name="Name" SessionField="SearchOne" Type="String" />
                    <asp:SessionParameter DefaultValue=" " Name="Name2" SessionField="SearchTwo" />
                    <asp:SessionParameter DefaultValue=" " Name="Name3" SessionField="SearchThree" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="Grid" SkinID="Grid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="RecipeName" HeaderText="&nbsp; &nbsp; Recipe Name" SortExpression="RecipeName" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="&nbsp; &nbsp; &nbsp; Action" ShowHeader="True" Text="Details" ControlStyle-CssClass="table-bordered" >
                    <ControlStyle CssClass="btn btn-success" />
                    </asp:ButtonField>
                </Columns>
                <EmptyDataTemplate>
                    NO Search Results found.
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSelectedValue" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" SkinID="Submit" CssClass="btn btn-primary" Text="Search Again" PostBackUrl="~/WebForm1.aspx" />
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerPlaceHolder" runat="server">
</asp:Content>
