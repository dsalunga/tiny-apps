VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MP3 List Builder"
   ClientHeight    =   3975
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5085
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3975
   ScaleWidth      =   5085
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create List"
      Default         =   -1  'True
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   3360
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Options"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   4575
      Begin VB.OptionButton optOption 
         Caption         =   "Text Format (&Title - Artist)"
         Height          =   255
         Index           =   2
         Left            =   1080
         TabIndex        =   6
         Top             =   2400
         Width           =   2895
      End
      Begin VB.OptionButton optOption 
         Caption         =   "Text Format (&Artist - Title)"
         Height          =   255
         Index           =   1
         Left            =   1080
         TabIndex        =   5
         Top             =   1920
         Width           =   3015
      End
      Begin VB.OptionButton optOption 
         Caption         =   "&Table Form (HTML)"
         Height          =   255
         Index           =   0
         Left            =   1080
         TabIndex        =   4
         Top             =   1440
         Value           =   -1  'True
         Width           =   2415
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "&Browse..."
         Height          =   375
         Left            =   1920
         TabIndex        =   2
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox txtDir 
         Height          =   285
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   4095
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim oFSO As New Scripting.FileSystemObject
Dim oDir As Scripting.Folder
Dim oMP3 As Scripting.File
Dim oStream As Scripting.TextStream
Dim oIExplore As InternetExplorer

Private Sub cmdBrowse_Click()
    Load frmDirectoryBrowser
    frmDirectoryBrowser.Show vbModal
    txtDir = frmDirectoryBrowser.Dir
    Unload frmDirectoryBrowser
End Sub

Private Sub cmdCreate_Click()
    Dim sFilename As String, iSongNo As Integer
    Set oIExplore = New InternetExplorer
    If oFSO.FolderExists(txtDir) Then
        Set oDir = oFSO.GetFolder(txtDir)
        If optOption(0).Value Then
            sFilename = App.Path & "\MP3List.htm"
            Set oStream = oFSO.CreateTextFile(sFilename, True)
            oStream.WriteLine "<html><body style='font-family:Verdana;'><table border=1 style='font-size:9pt' width=100%><tr><th>Song No.</th><th>Title</th><th>Artist</th></tr>"
            For Each oMP3 In oDir.Files
                If UCase(Right(oMP3.Name, 3)) = "MP3" Then
                    iSongNo = iSongNo + 1
                    oStream.WriteLine "<tr><td>" & CStr(iSongNo) & "</td><td>" & GetTitle(oMP3.Name) & "</td><td>" & GetArtist(oMP3.Name) & "</td></tr>"
                End If
            Next
            oStream.WriteLine "</table></body></html>"
            oStream.Close
            oIExplore.Navigate sFilename
            oIExplore.Visible = True
        Else
            sFilename = App.Path & "\MP3List.txt"
            Set oStream = oFSO.CreateTextFile(sFilename, True)
            For Each oMP3 In oDir.Files
                If UCase(Right(oMP3.Name, 3)) = "MP3" Then
                    iSongNo = iSongNo + 1
                    If optOption(1).Value Then
                        oStream.WriteLine CStr(iSongNo) & Space(3) & Left(oMP3.Name, Len(oMP3.Name) - 4)
                    Else
                        oStream.WriteLine CStr(iSongNo) & Space(3) & GetTitle(oMP3.Name) & " - " & GetArtist(oMP3.Name)
                    End If
                End If
            Next
            oStream.Close
            Shell "Notepad.exe " & sFilename
        End If
    Else
        MsgBox "Invalid Path!", vbOKOnly + vbExclamation, "MP3 List Maker"
    End If
End Sub

Function GetTitle(sSong As String) As String
    Dim iStart As Integer, sTemp As String
    iStart = InStr(sSong, " - ")
    If iStart <> 0 Then
        sTemp = Right(sSong, Len(sSong) - iStart - 2)
        GetTitle = Left(sTemp, Len(sTemp) - 4)
    Else
        GetTitle = Left(sSong, Len(sSong) - 4)
    End If
End Function

Function GetArtist(sSong As String) As String
    Dim iStart As Integer
    iStart = InStr(sSong, " - ")
    If iStart <> 0 Then
        GetArtist = Left(sSong, iStart - 1)
    Else
        GetArtist = Left(sSong, Len(sSong) - 4)
    End If
End Function
