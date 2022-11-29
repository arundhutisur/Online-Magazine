Imports System.Data.OleDb

Public Class ForgetPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            SecQuesBind()
        End If
    End Sub

    Protected Sub UpdatePassword(sender As Object, e As EventArgs)
        If Password.Text <> RePassword.Text Then
            ErrorDisplay.Text = "Re-Entered Password and Password Mismatch"
        Else
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader
            Dim strUpdate As String
            Dim cmdUpdate As OleDbCommand

            conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

            strSelect = "Select secquestion, secanswer From users Where userid='" & Email.Text & "'"
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If (dtrSelect.HasRows) Then
                dtrSelect.Read()
                If (dtrSelect("secquestion") <> dropQuestion.Text) Or (dtrSelect("secanswer") <> SecAns.Text) Then
                    ErrorDisplay.Text = "Security Question or Answer incorrect"
                Else
                    strUpdate = "Update users Set passwd='" & Password.Text & "' Where userid='" & Email.Text & "'"
                    cmdUpdate = New OleDbCommand(strUpdate, conom)
                    cmdUpdate.ExecuteNonQuery()
                    ErrorDisplay.Text = "Password Updated Successfully"
                End If
            Else
                ErrorDisplay.Text = "Invalid Email Id. Please Enter valid Email Id."
            End If
            dtrSelect.Close()
            conom.Close()
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

End Class