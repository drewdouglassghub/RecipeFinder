<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" StyleSheetTheme="Fridge" Inherits="RecipeFinder.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <div>
             <br />
            To add a new recipe:<br />
            Recipe Name:
            <asp:TextBox ID="nameBox" runat="server" CssClass="form-control" SkinID="Entry" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNameBox" runat="server" ControlToValidate="nameBox" CssClass="error" ErrorMessage="Must enter a recipe name"></asp:RequiredFieldValidator>
            <br />
            Recipe Directions:
            <asp:TextBox ID="directionsBox" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" SkinID="Entry" MaxLength="1000" Width="500px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDirectionsBox" runat="server" ControlToValidate="directionsBox" CssClass="error" ErrorMessage="Description cannot be blank"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="addRecipe" runat="server" CssClass="btn btn-primary" SkinId="Submit" OnClick="addRecipe_Click" Text="Add" />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" SkinId="Submit"  PostBackUrl="~/WebForm1.aspx" Text="Search Again" CausesValidation="False" />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" CssClass="Grid" SkinId="Grid" runat="server" AutoGenerateColumns="False" DataKeyNames="RecipeName" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" ReadOnly="True" SortExpression="RecipeName" />
                    <asp:BoundField DataField="RecipeDirections" HeaderText="Recipe Directions" SortExpression="RecipeDirections" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ControlStyle-CssClass="btn btn-success" ShowHeader="True" Text="Modify" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [RecipeMaster] WHERE [RecipeName] = @original_RecipeName AND (([RecipeDirections] = @original_RecipeDirections) OR ([RecipeDirections] IS NULL AND @original_RecipeDirections IS NULL))" InsertCommand="INSERT INTO [RecipeMaster] ([RecipeName], [RecipeDirections]) VALUES (@RecipeName, @RecipeDirections)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RecipeMaster]" UpdateCommand="UPDATE [RecipeMaster] SET [RecipeDirections] = @RecipeDirections WHERE [RecipeName] = @original_RecipeName AND (([RecipeDirections] = @original_RecipeDirections) OR ([RecipeDirections] IS NULL AND @original_RecipeDirections IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_RecipeDirections" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RecipeName" Type="String" />
                    <asp:Parameter Name="RecipeDirections" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipeDirections" Type="String" />
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_RecipeDirections" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />  
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerPlaceHolder" runat="server">
</asp:Content>
