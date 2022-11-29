Imports System.Data.OleDb

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader

            conom = New OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")
            strSelect = "Select imgpath From magazineinfo"
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            Dim n As Integer
            n = 1

            If (dtrSelect.HasRows) Then
                While dtrSelect.Read()
                    Select Case n
                        Case 1
                            myimage1.ImageUrl = dtrSelect("imgpath")

                        Case 2
                            myimage2.ImageUrl = dtrSelect("imgpath")

                        Case 3
                            myimage3.ImageUrl = dtrSelect("imgpath")
                        Case 3
                            myimage3.ImageUrl = dtrSelect("imgpath")
                        Case 4
                            myimage4.ImageUrl = dtrSelect("imgpath")
                        Case 5
                            myimage5.ImageUrl = dtrSelect("imgpath")
                        Case 6
                            myimage6.ImageUrl = dtrSelect("imgpath")
                        Case 7
                            myimage7.ImageUrl = dtrSelect("imgpath")
                        Case 8
                            myimage8.ImageUrl = dtrSelect("imgpath")
                        Case 9
                            myimage9.ImageUrl = dtrSelect("imgpath")
                        Case 10
                            myimage10.ImageUrl = dtrSelect("imgpath")

                    End Select
                    n = n + 1
                End While
            End If

            dtrSelect.Close()
            conom.Close()

        End If
    End Sub


End Class