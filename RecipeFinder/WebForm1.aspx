<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"  CodeBehind="WebForm1.aspx.cs" StyleSheetTheme="Fridge" Inherits="RecipeFinder.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">

    <form id="form1" runat="server">    

        <div class="row">
            <label class="control-label col-xs-6 col-sm-3 col-md-2 col-lg-2; text-nowrap">Please enter ingredients on-hand</label>
            <br />
        </div>
        <div class="row">
            <div class="control-label col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <asp:Label ID="lblIngredient1" class="lbl" runat="server" Text="Ingredient #1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="searchBox1" CssClass="error" ErrorMessage="Enter at least one ingredient"></asp:RequiredFieldValidator>
                <asp:TextBox ID="searchBox1" runat="server" CssClass="form-control" OnTextChanged="searchBox1_TextChanged" SkinID="Entry"></asp:TextBox>
            </div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="row">
            <div class="control-label col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <asp:Label ID="lblIngredient2" class="lbl" runat="server" Text="Ingredient #2"></asp:Label>
                <asp:TextBox ID="searchBox2" runat="server" CssClass="form-control" SkinID="Entry"></asp:TextBox>
            </div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="row">
            <div class="control-label col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <asp:Label ID="lblIngredient3" class="lbl" runat="server" Text="Ingredient #3"></asp:Label>
                <asp:TextBox ID="searchBox3" runat="server" CssClass="form-control" SkinID="Entry"></asp:TextBox>
            </div>
        </div>

        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>

        <div class="row">
            <div class="control-label col-xs-1 col-sm-3 col-md-2 col-lg-2">
                <asp:Button ID="searchButton"  runat="server" OnClick="searchButton_Click" Text="Search" SkinID="Submit" CssClass="btn btn-primary" />
            </div>
            <div class="control-label col-xs-6 col-sm-9 col-md-10 col-lg-10">
                <asp:Button ID="addChange" runat="server" Text="Add/Change Recipes" CausesValidation="False" SkinID="Submit" CssClass="btn btn-primary" OnClick="addChange_Click" PostBackUrl="~/WebForm4.aspx" />
            </div>
        </div>

        <div class="row">
            <div class="control-label col-xs-12 col-sm-12 col-md-12 col-lg-12">
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerPlaceHolder" runat="server">
</asp:Content>
