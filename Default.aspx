<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Flower Inventory Management</h2>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; 
            padding: 20px;
        }
        h1 {
            color: #007bff; 
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .gridview-container {
            margin-top: 20px;
            background-color: #ffffff; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: left;
        }
        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .gridview tr:hover {
            background-color: #f1f1f1; 
        }
        .btn {
            margin: 2px;
        }
        .search-sort-container {
            margin-bottom: 20px;
        }
    </style>

    <div class="container">
        <h1>Flower Inventory Management</h1>

        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFlowerModal">
            Add New Flower
        </button>

        <div class="search-sort-container">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..." AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" />
            <asp:DropDownList ID="ddlSort" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                <asp:ListItem Value="Name">Name</asp:ListItem>
                <asp:ListItem Value="Type">Type</asp:ListItem>
                <asp:ListItem Value="Price">Price</asp:ListItem>
                <asp:ListItem Value="CategoryName">Category</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="gridview-container">
            <asp:GridView ID="GridViewFlowers" runat="server" AutoGenerateColumns="False" DataKeyNames="FlowerId"
                OnRowEditing="GridViewFlowers_RowEditing" OnRowUpdating="GridViewFlowers_RowUpdating"
                OnRowCancelingEdit="GridViewFlowers_RowCancelingEdit" OnRowDeleting="GridViewFlowers_RowDeleting"
                CssClass="gridview table">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTypeEdit" runat="server" Text='<%# Bind("Type") %>' CssClass="form-control" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPriceEdit" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategoryEdit" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-warning" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-danger"  CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete this flower?');" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="modal fade" id="addFlowerModal" tabindex="-1" aria-labelledby="addFlowerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addFlowerModalLabel">Add New Flower</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtName">Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter flower name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtType">Type:</label>
                        <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter flower type"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlCategory">Category:</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnAdd" runat="server" Text="Add Flower" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>