Imports System.Data.OleDb

Public Class Search
    Inherits System.Web.UI.Page

    Private Shared scriteria As String
    Private Shared stxt As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim conom As OleDbConnection
            Dim strSelect As String
            Dim cmdSelect As OleDbCommand
            Dim dtrSelect As OleDbDataReader

            conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

            strSelect = "Select searchcriteria From searchby"
            cmdSelect = New OleDbCommand(strSelect, conom)

            conom.Open()
            dtrSelect = cmdSelect.ExecuteReader()
            If (dtrSelect.HasRows) Then
                dropSearch.DataSource = dtrSelect
                dropSearch.DataTextField = "searchcriteria"
                dropSearch.DataBind()
            End If

            dtrSelect.Close()
            conom.Close()
        End If
    End Sub

    Protected Sub ListMag()
        scriteria = dropSearch.Text
        stxt = txtsearch.Text
        SearchMag(scriteria, stxt)
    End Sub

    Protected Sub SearchMag(scriteria As String, stxt As String)
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim dtrSelect As OleDbDataReader

        dgrdMag.DataSource = Nothing
        dgrdMag.DataBind()
        lblInfo.Text = ""

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        If scriteria = "Magazine Name" Then
            strSelect = "Select accno, magname, genre, publisher, imgpath, docpath, upvotecount, downvotecount From magazineinfo Where magname like '%" & stxt & "%' Order By accno"
        ElseIf scriteria = "Magazine Genre" Then
            strSelect = "Select accno, magname, genre, publisher, imgpath, docpath, upvotecount, downvotecount From magazineinfo Where genre like '%" & stxt & "%' Order By accno"
        Else
            strSelect = "Select accno, magname, genre, publisher, imgpath, docpath, upvotecount, downvotecount From magazineinfo Where publisher like '%" & stxt & "%' Order By accno"
        End If

        cmdSelect = New OleDbCommand(strSelect, conom)

        conom.Open()
        dtrSelect = cmdSelect.ExecuteReader()
        If (dtrSelect.HasRows) Then
            dgrdMag.DataSource = dtrSelect
            dgrdMag.DataBind()
        Else
            lblInfo.Text = "No Related Magazine Found"
        End If

        dtrSelect.Close()
        conom.Close()
    End Sub

    Sub ReadMag(s As Object, e As DataGridCommandEventArgs)
        Dim accnumber As Integer
        Dim LikeDislike As String
        accnumber = dgrdMag.DataKeys(e.Item.ItemIndex)
        dgrdMag.SelectedIndex = e.Item.ItemIndex

        LikeDislike = e.CommandName
        If LikeDislike = "Like" Or LikeDislike = "Dislike" Then
            votecount(LikeDislike, accnumber)
        Else
            DisplayMag(accnumber)
        End If
    End Sub

    Protected Sub DisplayMag(accn As Integer)
        Response.Redirect("/MagDepository/" & accn & ".pdf")
    End Sub
    Private Sub votecount(votechoice As String, accn As Integer)
        Dim conom As OleDbConnection
        Dim strSelect As String
        Dim cmdSelect As OleDbCommand
        Dim strUpdate As String
        Dim cmdUpdate As OleDbCommand
        Dim count As Integer

        conom = New OleDbConnection("PROVIDER= Microsoft.ACE.OLEDB.12.0;DATA Source=C:\OnlineMagazine\OnlineMagazine.mdb")

        If votechoice = "Like" Then
            strSelect = "Select upvotecount From magazineinfo Where accno=" & accn

        Else
            strSelect = "Select downvotecount From magazineinfo Where accno=" & accn
        End If
        cmdSelect = New OleDbCommand(strSelect, conom)

        conom.Open()
        count = cmdSelect.ExecuteScalar()

        If votechoice = "Like" Then
            strUpdate = "Update magazineinfo Set upvotecount=" & count + 1 & " Where accno=" & accn
        Else
            strUpdate = "Update magazineinfo Set downvotecount=" & count + 1 & " Where accno=" & accn
        End If
        cmdUpdate = New OleDbCommand(strUpdate, conom)
        cmdUpdate.ExecuteNonQuery()
        conom.Close()
        SearchMag(scriteria, stxt)
    End Sub


End Class