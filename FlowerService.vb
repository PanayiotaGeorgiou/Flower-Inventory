Imports System.Data
Imports System.Data.SqlClient

Public Class FlowerService
    Private connectionString As String = ConfigurationManager.ConnectionStrings("FlowerShopConnectionString").ConnectionString

    ' Get all flowers
    Public Function GetAllFlowers() As DataTable
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand("GetAllFlowers", conn)
                cmd.CommandType = CommandType.StoredProcedure
                conn.Open()
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    dt.Load(reader)
                End Using
            End Using
        End Using
        Return dt
    End Function

    ' Get all categories
    Public Function GetAllCategories() As DataTable
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand("GetAllCategories", conn)
                cmd.CommandType = CommandType.StoredProcedure
                conn.Open()
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    dt.Load(reader)
                End Using
            End Using
        End Using
        Return dt
    End Function

    ' Add a new flower
    Public Sub AddFlower(name As String, type As String, price As Decimal, categoryId As Integer)
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand("AddFlower", conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Type", type)
                cmd.Parameters.AddWithValue("@Price", price)
                cmd.Parameters.AddWithValue("@CategoryId", categoryId)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    ' Update a flower
    Public Sub UpdateFlower(flowerId As Integer, name As String, type As String, price As Decimal, categoryId As Integer)
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand("UpdateFlower", conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@FlowerId", flowerId)
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Type", type)
                cmd.Parameters.AddWithValue("@Price", price)
                cmd.Parameters.AddWithValue("@CategoryId", categoryId)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    ' Delete a flower
    Public Sub DeleteFlower(flowerId As Integer)
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand("DeleteFlower", conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@FlowerId", flowerId)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub
End Class