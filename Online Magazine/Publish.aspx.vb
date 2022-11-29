Imports System.Data.OleDb


Public Class Publish
    Inherits System.Web.UI.Page
    Private Shared docp As String
    Private Shared status As String
    Private Shared strselect As String
    Private Shared accnumber As Integer
    Private Shared acc As Integer
    Private Shared Str As String
    Private Shared newstr As String
    Private Shared imge As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ViewSub()
        End If
    End Sub

    Protected Sub ViewSub()
        strselect = "Select * From publishreq where status='Submitted'"
        Review()
    End Sub
    Protected Sub ViewAll()
        strselect = "Select * From publishreq"
        Review()
    End Sub

    Protected Sub ViewRej()
        strselect = "Select * From publishreq where status='Rejected'"
        Review()
    End Sub

    Protected Sub ViewPub()
        strselect = "Select * From publishreq where status='Published'"
        Review()
    End Sub
    Protected Sub Review()
        Dim conom As OleDbConnection
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader

        dgrdPub.DataSource = Nothing
        dgrdPub.DataBind()
        lblInfo.Text = ""

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")
        cmdSelect = New OleDbCommand(strselect, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()
        If (dtrSelect.HasRows) Then
            dgrdPub.DataSource = dtrSelect
            dgrdPub.DataBind()
        Else
            lblInfo.Text = "No Related Magazine Found"
        End If
        dtrSelect.Close()
        conom.Close()
    End Sub

    Sub ReadMag(s As Object, e As DataGridCommandEventArgs)
        accnumber = dgrdPub.DataKeys(e.Item.ItemIndex)
        dgrdPub.SelectedIndex = e.Item.ItemIndex
        status = e.CommandName
        If status = "Publish" Or status = "Reject" Then
            PublishMag()
        Else
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader

            conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

            strSelect = "Select docpath From publishreq Where tempaccn=" & accnumber
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If (dtrSelect.HasRows) Then
                dtrSelect.Read()
                docp = dtrSelect("docpath")
                DisplayMag()
            End If
            dtrSelect.Close()
            conom.Close()
        End If
    End Sub

    Protected Sub DisplayMag()
        Response.Redirect(docp)
    End Sub

    Private Sub RenameMag()
        Dim oldfile As String = Server.MapPath(Str)
        newstr = "/MagDepository/" & acc + 1 & ".pdf"
        Dim newfile As String = Server.MapPath(newstr)
        Dim fi As IO.FileInfo = New IO.FileInfo(oldfile)

        If fi.Exists Then
            fi.MoveTo(newfile)
        End If
        MsgBox("Rename Successful")
    End Sub

    Protected Sub PublishMag()
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim strInsert As String
        Dim cmdInsert As OleDbCommand
        Dim cmdSelect As OleDbCommand

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        If status = "Reject" Then
            strInsert = "Update publishreq Set status='Rejected' Where tempaccn=" & accnumber
            cmdInsert = New OleDbCommand(strInsert, conom)
            conom.Open()
            cmdInsert.ExecuteNonQuery()
            conom.Close()
        ElseIf status = "Publish" Then
            strSelect = "Select MAX(accno) As maxaccn From magazineinfo"
            cmdSelect = New OleDbCommand(strSelect, conom)
            conom.Open()
            acc = cmdSelect.ExecuteScalar()
            conom.Close()

            Dim item As DataGridItem = dgrdPub.Items(dgrdPub.SelectedIndex)
            Str = item.Cells(5).Text
            imge = item.Cells(4).Text
            Dim strname As String = item.Cells(1).Text
            Dim strgenre As String = item.Cells(2).Text
            Dim strpub As String = item.Cells(3).Text
            RenameMag()

            strInsert = "Update publishreq Set docpath='" & newstr & "',status='Published' Where tempaccn=" & accnumber
            cmdInsert = New OleDbCommand(strInsert, conom)
            conom.Open()
            cmdInsert.ExecuteNonQuery()
            conom.Close()

            strInsert = "Insert into magazineinfo (accno, magname, genre, publisher,imgpath,docpath) Values(" & acc + 1 & ",'" & strname & "','" & strgenre & "','" & strpub & "','" & imge & "','" & newstr & "')"
            cmdInsert = New OleDbCommand(strInsert, conom)
            conom.Open()
            cmdInsert.ExecuteNonQuery()
            conom.Close()
        End If
        ViewSub()
    End Sub

End Class