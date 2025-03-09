Imports System.Data
Imports System.Data.SqlClient
Imports Flower_Inventory

Partial Class _Default
    Inherits System.Web.UI.Page

    ' Page_Load event: Runs when the page is loaded
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindFlowers()
            PopulateCategoryDropdown()
        End If
    End Sub

    ' BindFlowers: Fetches flowers from the database and binds them to the GridView
    Private Sub BindFlowers()

        Dim service As New FlowerService()
        Dim flowers As DataTable = service.GetAllFlowers()

        If Not String.IsNullOrEmpty(txtSearch.Text) Then
            flowers = flowers.Select("Name LIKE '%" & txtSearch.Text & "%'").CopyToDataTable()
        End If

        If ddlSort.SelectedValue <> "" Then
            flowers.DefaultView.Sort = ddlSort.SelectedValue & " ASC"
        End If

        GridViewFlowers.DataSource = flowers
        GridViewFlowers.DataBind()
    End Sub

    ' PopulateCategoryDropdown: Fetches categories from the database and binds them to the dropdown
    Private Sub PopulateCategoryDropdown()

        Dim service As New FlowerService()
        ddlCategory.DataSource = service.GetAllCategories()
        ddlCategory.DataTextField = "Name"
        ddlCategory.DataValueField = "CategoryId"
        ddlCategory.DataBind()
    End Sub

    ' btnAdd_Click: Handles the "Add Flower" button click event
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click

        Dim service As New FlowerService()
        service.AddFlower(txtName.Text, txtType.Text, Decimal.Parse(txtPrice.Text), Integer.Parse(ddlCategory.SelectedValue))
        BindFlowers()
    End Sub

    ' GridViewFlowers_RowEditing: Handles the "Edit" button click event in the GridView
    Protected Sub GridViewFlowers_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridViewFlowers.RowEditing
        GridViewFlowers.EditIndex = e.NewEditIndex
        BindFlowers()
    End Sub

    ' GridViewFlowers_RowUpdating: Handles the "Update" button click event in the GridView
    Protected Sub GridViewFlowers_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridViewFlowers.RowUpdating

        Dim flowerId As Integer = Integer.Parse(GridViewFlowers.DataKeys(e.RowIndex).Value)
        Dim name As String = CType(GridViewFlowers.Rows(e.RowIndex).FindControl("txtNameEdit"), TextBox).Text
        Dim type As String = CType(GridViewFlowers.Rows(e.RowIndex).FindControl("txtTypeEdit"), TextBox).Text
        Dim price As Decimal = Decimal.Parse(CType(GridViewFlowers.Rows(e.RowIndex).FindControl("txtPriceEdit"), TextBox).Text)
        Dim categoryId As Integer = Integer.Parse(CType(GridViewFlowers.Rows(e.RowIndex).FindControl("ddlCategoryEdit"), DropDownList).SelectedValue)

        Dim service As New FlowerService()
        service.UpdateFlower(flowerId, name, type, price, categoryId)
        GridViewFlowers.EditIndex = -1
        BindFlowers()
    End Sub

    ' GridViewFlowers_RowCancelingEdit: Handles the "Cancel" button click event in the GridView
    Protected Sub GridViewFlowers_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridViewFlowers.RowCancelingEdit
        GridViewFlowers.EditIndex = -1
        BindFlowers()
    End Sub

    ' GridViewFlowers_RowDeleting: Handles the "Delete" button click event in the GridView
    Protected Sub GridViewFlowers_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridViewFlowers.RowDeleting
        Dim flowerId As Integer = Integer.Parse(GridViewFlowers.DataKeys(e.RowIndex).Value)e
        Dim service As New FlowerService()
        service.DeleteFlower(flowerId)
        BindFlowers()
    End Sub

    ' txtSearch_TextChanged: Handles the search textbox text change event
    Protected Sub txtSearch_TextChanged(sender As Object, e As EventArgs) Handles txtSearch.TextChanged
        BindFlowers()
    End Sub

    ' ddlSort_SelectedIndexChanged: Handles the sort dropdown selection change event
    Protected Sub ddlSort_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSort.SelectedIndexChanged
        BindFlowers()
    End Sub
End Class