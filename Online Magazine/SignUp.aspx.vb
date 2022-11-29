Imports System.Data.OleDb

Public Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SecQuesBind()
            WorkGroupBind()
        End If
    End Sub

    Protected Sub Register(sender As Object, e As EventArgs)
        If Password.Text <> RePassword.Text Then
            ErrorDisplay.Text = "Re-Entered Password and Password Mismatch"
        Else
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader
            Dim strInsert As String
            Dim cmdInsert As OleDbCommand

            conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

            strSelect = "Select * From users Where userid='" & Email.Text & "'"
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If dtrSelect.HasRows Then
                ErrorDisplay.Text = "User already registered. Sign-In to continue"
            Else
                If dropWorkgp.Text = "Reader" Or dropWorkgp.Text = "Author" Then
                    strInsert = "Insert Into users (fname, lname, userid, workgp, passwd, secquestion, secanswer, userstat) Values ('" & Fname.Text & "', '" & Lname.Text & "', '" & Email.Text & "', '" & dropWorkgp.Text & "', '" & Password.Text & "', '" & dropQuestion.Text & "', '" & SecAns.Text & "', 'Active')"
                Else
                    strInsert = "Insert Into users (fname, lname, userid, workgp, passwd, secquestion, secanswer, userstat) Values ('" & Fname.Text & "', '" & Lname.Text & "', '" & Email.Text & "', '" & dropWorkgp.Text & "', '" & Password.Text & "', '" & dropQuestion.Text & "', '" & SecAns.Text & "', 'Inactive')"
                End If
                cmdInsert = New OleDbCommand(strInsert, conom)
                cmdInsert.ExecuteNonQuery()
                ErrorDisplay.Text = "User registered successfully"
                dtrSelect.Close()
                conom.Close()
            End If
        End If
    End Sub

    Protected Sub SecQuesBind()
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        strSelect = "Select qtext From securityquestion"
        cmdSelect = New OleDbCommand(strSelect, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()
        If (dtrSelect.HasRows) Then
            dropQuestion.DataSource = dtrSelect
            dropQuestion.DataTextField = "qtext"
            dropQuestion.DataBind()
        End If
        dtrSelect.Close()
        conom.Close()
    End Sub

    Protected Sub WorkGroupBind()
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        strSelect = "Select wg From workgroup"
        cmdSelect = New OleDbCommand(strSelect, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()
        If (dtrSelect.HasRows) Then
            dropWorkgp.DataSource = dtrSelect
            dropWorkgp.DataTextField = "wg"
            dropWorkgp.DataBind()
        End If
        dtrSelect.Close()
        conom.Close()
    End Sub

End Class