<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" StyleSheetTheme="Fridge" Inherits="RecipeFinder.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <div>
            <br />
             Add Ingredient:<br />
            Name:
            <asp:TextBox ID="nameBox" runat="server" SkinID="Entry" CssClass="form-control" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNameBox2" runat="server" ErrorMessage="Must enter an ingredient name" ControlToValidate="nameBox" CssClass="error" ></asp:RequiredFieldValidator>
            <br />
            Amount:
            <asp:TextBox ID="amountBox" runat="server" SkinID="Entry" CssClass="form-control" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfbAmountBox" runat="server" ErrorMessage="Must enter an amount" ControlToValidate="amountBox" CssClass="error" ></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="addButton" runat="server" OnClick="addButton_Click" SkinId="Submit"  CssClass="btn btn-primary" Text="Add" />
            <asp:Button ID="backTo" runat="server" PostBackUrl="~/WebForm4.aspx" SkinID="Confirm" CssClass="btn btn-success" Text="Back to All Recipes" CausesValidation="False" />
            <br />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <asp:Label ID="Label1" runat="server" CssClass="RecipeName" ></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1"  runat="server" SkinID="Grid" CssClass="Grid" AutoGenerateColumns="False"  DataKeyNames="RecipeName" DataSourceID="SqlDataSource1" Width="500px">
                <Columns>
                    <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" ReadOnly="True" SortExpression="RecipeName"  />
                    <asp:TemplateField HeaderText="Recipe Directions" SortExpression="RecipeDirections">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RecipeDirections") %>' TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RecipeDirections") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-success" CausesValidation="False" >
<ControlStyle CssClass="btn btn-success"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [RecipeMaster] WHERE [RecipeName] = @original_RecipeName AND (([RecipeDirections] = @original_RecipeDirections) OR ([RecipeDirections] IS NULL AND @original_RecipeDirections IS NULL))" InsertCommand="INSERT INTO [RecipeMaster] ([RecipeName], [RecipeDirections]) VALUES (@RecipeName, @RecipeDirections)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RecipeMaster] WHERE ([RecipeName] = @RecipeName)" UpdateCommand="UPDATE [RecipeMaster] SET [RecipeDirections] = @RecipeDirections WHERE [RecipeName] = @original_RecipeName AND (([RecipeDirections] = @original_RecipeDirections) OR ([RecipeDirections] IS NULL AND @original_RecipeDirections IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_RecipeDirections" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RecipeName" Type="String" />
                    <asp:Parameter Name="RecipeDirections" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="RecipeName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RecipeDirections" Type="String" />
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_RecipeDirections" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" SkinID="Grid" CssClass="Grid" DataKeyNames="RecipeName,Name" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="RecipeName" HeaderText="Recipe Name" ReadOnly="True" SortExpression="RecipeName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-success" CausesValidation="False" >
<ControlStyle CssClass="btn btn-success"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" CausesValidation="False">
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <EmptyDataTemplate>
                    No ingredients added yet
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Ingredients] WHERE [RecipeName] = @original_RecipeName AND [Name] = @original_Name AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL))" InsertCommand="INSERT INTO [Ingredients] ([RecipeName], [Name], [Amount]) VALUES (@RecipeName, @Name, @Amount)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ingredients] WHERE ([RecipeName] = @RecipeName)" UpdateCommand="UPDATE [Ingredients] SET [Amount] = @Amount WHERE [RecipeName] = @original_RecipeName AND [Name] = @original_Name AND (([Amount] = @original_Amount) OR ([Amount] IS NULL AND @original_Amount IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RecipeName" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Amount" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="RecipeName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Amount" Type="String" />
                    <asp:Parameter Name="original_RecipeName" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerPlaceHolder" runat="server">
</asp:Content>