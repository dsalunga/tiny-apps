VERSION 5.00
Object = "{27395F88-0C0C-101B-A3C9-08002B2F49FB}#1.1#0"; "PICCLP32.OCX"
Begin VB.Form frmGame 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Picture Puzzle"
   ClientHeight    =   8355
   ClientLeft      =   45
   ClientTop       =   735
   ClientWidth     =   11055
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8355
   ScaleWidth      =   11055
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FF00FF&
      Height          =   8100
      Left            =   120
      ScaleHeight     =   8040
      ScaleWidth      =   10740
      TabIndex        =   0
      Top             =   120
      Width           =   10800
      Begin PicClip.PictureClip PictureClip1 
         Left            =   1680
         Top             =   3960
         _ExtentX        =   2778
         _ExtentY        =   2143
         _Version        =   393216
         Rows            =   6
         Cols            =   6
      End
      Begin VB.PictureBox Piece 
         FillColor       =   &H8000000F&
         Height          =   810
         Index           =   0
         Left            =   0
         ScaleHeight     =   750
         ScaleWidth      =   1020
         TabIndex        =   1
         Top             =   0
         Visible         =   0   'False
         Width           =   1080
      End
   End
   Begin VB.Menu mnuGame 
      Caption         =   "&Game"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
      End
      Begin VB.Menu mnuSurrender 
         Caption         =   "Give-Up"
      End
      Begin VB.Menu mnuPreview 
         Caption         =   "Preview"
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGrid 
         Caption         =   "Grid"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuPicture 
         Caption         =   "&Select Picture..."
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmGame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim hiddenX As Integer, hiddenY As Integer, Shuffling As Boolean, Steps As Integer

Private Sub Form_Load()
    Dim row As Integer, col As Integer, pieceIndex As Integer
    Piece(0).Width = pieceWidth
    Piece(0).Height = pieceHeight
    
    For row = 1 To pieceCount
        For col = 1 To pieceCount
            pieceIndex = (row - 1) * pieceCount + col
            Load Piece(pieceIndex)
            Piece(pieceIndex).Left = (col - 1) * pieceWidth
            Piece(pieceIndex).Top = (row - 1) * pieceHeight
            Piece(pieceIndex).Visible = True
        Next
    Next
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub mnuExit_Click()
    End
End Sub

Private Sub mnuGrid_Click()
    Dim i As Integer, borderStyle As Integer
    
    If mnuGrid.Checked Then
        mnuGrid.Checked = False
        borderStyle = 0
    Else
        mnuGrid.Checked = True
        borderStyle = 1
    End If
    
    For i = 1 To pieceCount * pieceCount
        Piece(i).borderStyle = borderStyle
    Next
End Sub

Private Sub mnuNew_Click()
    If picturePath <> "" Then
        Call mnuSurrender_Click
        GameStarted = True
        Piece(1).Visible = False
        
        hiddenX = 0
        hiddenY = 0
        Call Shuffle
        Steps = 0
    End If
End Sub

Private Sub mnuPicture_Click()
    Dim row As Integer, col As Integer, pieceIndex As Integer
    Load frmSetup
    frmSetup.Show vbModal
    If pictureChanged Then
        Call mnuSurrender_Click
        PictureClip1.Picture = LoadPicture(picturePath)
        For row = 1 To pieceCount
            For col = 1 To pieceCount
                pieceIndex = (row - 1) * pieceCount + col
                Piece(pieceIndex).Picture = PictureClip1.GraphicCell(pieceIndex - 1)
            Next
        Next
    End If
End Sub

Private Sub mnuPreview_Click()
    Load frmPreview
    frmPreview.Show
End Sub

Private Sub mnuSurrender_Click()
    Dim row As Integer, col As Integer, pieceIndex As Integer
    
    For row = 1 To pieceCount
        For col = 1 To pieceCount
            pieceIndex = (row - 1) * pieceCount + col
            Piece(pieceIndex).Left = (col - 1) * pieceWidth
            Piece(pieceIndex).Top = (row - 1) * pieceHeight
        Next
    Next
    GameStarted = False
    Piece(1).Visible = True
End Sub

Private Sub Piece_Click(Index As Integer)
    Dim tmpX As Integer, tmpY As Integer
    If GameStarted Then
    If ((Piece(Index).Left - pieceWidth = hiddenX Or Piece(Index).Left + pieceWidth = hiddenX) _
       And (Piece(Index).Top = hiddenY)) Xor _
       ((Piece(Index).Top - pieceHeight = hiddenY Or Piece(Index).Top + pieceHeight = hiddenY) _
       And (Piece(Index).Left = hiddenX)) Then
       
        tmpX = Piece(Index).Left
        tmpY = Piece(Index).Top
        
        Piece(Index).Left = hiddenX
        Piece(Index).Top = hiddenY
        hiddenX = tmpX
        hiddenY = tmpY
        
        If Not Shuffling Then
            Steps = Steps + 1
            If IsPuzzleComplete() Then
                MsgBox "Congratulations!!! Completed in " & CStr(Steps) & " steps!", vbOKOnly + vbExclamation, "Puzzle Completed"
                Piece(1).Visible = True
            End If
        End If
    End If
    
    End If
End Sub

Function IsPuzzleComplete() As Boolean
Dim row As Integer, col As Integer, pieceIndex As Integer, WrongPosition As Boolean
    For row = 1 To pieceCount
        For col = 1 To pieceCount
            pieceIndex = (row - 1) * pieceCount + col
            If Not ((Piece(pieceIndex).Left = (col - 1) * pieceWidth) And (Piece(pieceIndex).Top = (row - 1) * pieceHeight)) Then
                WrongPosition = True
                Exit For
            End If
        Next
        If WrongPosition Then Exit For
    Next
    IsPuzzleComplete = Not WrongPosition
End Function

Sub Shuffle()
    Dim x As Integer
    Shuffling = True
    Randomize
    For x = 1 To 10000
        Piece_Click (Int((36 - 2 + 1) * Rnd + 2))
    Next
    Shuffling = False
End Sub
