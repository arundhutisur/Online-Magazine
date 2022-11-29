Imports System.Data.OleDb


Public Class SignIn
    Inherits System.Web.UI.Page
    Private Shared errcon As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LogIn(sender As Object, e As EventArgs)

        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader
        Dim strUpdate As String
        Dim cmdUpdate As OleDbCommand
        Dim url As String


        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        strSelect = "Select passwd, workgp, userstat From users where userid='" & Email.Text & "'"
        cmdSelect = New OleDbCommand(strSelect, conom)

        strUpdate = "Update users Set userstat='" & "Locked" & "' Where userid='" & Email.Text & "'"
        cmdUpdate = New OleDbCommand(strUpdate, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()

        If (dtrSelect.HasRows) Then
            dtrSelect.Read()
            If (dtrSelect("userstat") = "Active") Then
                If (dtrSelect("passwd") = Password.Text) Then
                    If (dtrSelect("workgp") = "Administrator") Then
                        Response.Redirect("/About.aspx")
                    ElseIf (dtrSelect("workgp") = "Reader") Then
                        url = "/Reader.aspx?userid=" & Email.Text
                        Response.Redirect(url)
                    ElseIf (dtrSelect("workgp") = "Author") Then
                        url = "/Author.aspx?userid=" & Email.Text
                        Response.Redirect(url)
                    ElseIf (dtrSelect("workgp") = "Editor") Then
                        url = "/Editor.aspx?userid=" & Email.Text
                        Response.Redirect(url)
                    End If
                Else
                    errcon = errcon + 1
                    ErrorDisplay.Text = "Username or Password Invalid ! You are left with " & 3 - errcon & " attempt"
                    If (errcon = 3) Then
                        cmdUpdate.ExecuteNonQuery()
                        ErrorDisplay.Text = "Your Account has been Locked"
                    End If
                End If
            Else
                ErrorDisplay.Text = "Your Account is Locked. Please Contact the Administrator."
            End If
        End If
        dtrSelect.Close()
        conom.Close()


    End Sub

    Protected Sub SignUp(sender As Object, e As EventArgs)

    End Sub

    Protected Sub ForgetPassword(sender As Object, e As EventArgs)
        Response.Redirect("/ForgetPassword.aspx")
    End Sub
End Class