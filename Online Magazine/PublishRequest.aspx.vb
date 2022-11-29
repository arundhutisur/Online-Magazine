Imports System.Data.OleDb
Imports System.IO
Imports System.Net
Imports System.Reflection

Public Class PublishRequest
    Inherits System.Web.UI.Page
    Private Shared docpath As String
    Private Shared imgpath As String
    Private Shared uid As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GenreBind()
        End If
    End Sub

    Protected Sub GenreBind()
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        strSelect = "Select genre From genre"
        cmdSelect = New OleDbCommand(strSelect, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()
        If (dtrSelect.HasRows) Then
            dropGenre.DataSource = dtrSelect
            dropGenre.DataTextField = "genre"
            dropGenre.DataBind()
        End If
        dtrSelect.Close()
        conom.Close()
    End Sub
    Protected Sub UploadMag(sender As Object, e As EventArgs) Handles btnUpload.Click
        imgpath = Server.MapPath("~/MagImage/")
        If Not Directory.Exists(imgpath) Then
            Directory.CreateDirectory(imgpath)
        End If
        magupload.SaveAs(imgpath & Path.GetFileName(magthumbnail.FileName))

        docpath = Server.MapPath("~/MagtoPub/")
        If Not Directory.Exists(docpath) Then
            Directory.CreateDirectory(docpath)
        End If
        magupload.SaveAs(docpath & Path.GetFileName(magupload.FileName))
        InsertMag()
        lblmessage.Text = Path.GetFileName(magupload.FileName) & " has been submitted for publishing."
    End Sub

    Protected Sub InsertMag()
        Dim conom As OleDbConnection
        Dim strInsert As String
        Dim cmdInsert As OleDbCommand
        uid = Request.QueryString("userid")

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        strInsert = "Insert Into publishreq (magname, genre, imgpath, docpath, publisher,userid,status) Values ('" & magname.Text & "', '" & dropGenre.Text & "', '/MagImage/" & Path.GetFileName(magthumbnail.FileName) & "', '/MagtoPub/" & Path.GetFileName(magupload.FileName) & "', '" & Publisher.Text & "','" & uid & "','Submitted')"
        cmdInsert = New OleDbCommand(strInsert, conom)

        conom.Open()
        cmdInsert.ExecuteNonQuery()
        conom.Close()
    End Sub

End Class