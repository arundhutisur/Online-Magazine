Imports System.Data.OleDb
Imports System.Security.Cryptography

Public Class Editor
    Inherits System.Web.UI.Page
    Private Shared uid As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader
            uid = Request.QueryString("userid")

            conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

            strSelect = "Select fname, lname, workgp From users Where userid='" & uid & "'"
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If (dtrSelect.HasRows) Then
                dtrSelect.Read()
                lblUser.Text = "Hello Editor: " & dtrSelect("fname") & " " & dtrSelect("lname")
            End If

            dtrSelect.Close()
            conom.Close()

            strSelect = "Select COUNT(*) as cou From publishreq where status='Submitted'"
            cmdSelect = New OleDbCommand(strSelect, conom)
            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If (dtrSelect.HasRows) Then
                dtrSelect.Read()
                lblr.Text = "Number of Magazines ready to be reviewed is: " & dtrSelect("cou")
            End If

            dtrSelect.Close()
            conom.Close()
        End If
    End Sub

    Protected Sub SearchPage()
        Dim url As String
        url = "Search.aspx?userid=" & uid
        Response.Redirect(url)
    End Sub

    Protected Sub ReviewMag()
        Dim url As String
        url = "Publish.aspx?userid=" & uid
        Response.Redirect(url)
    End Sub
End Class