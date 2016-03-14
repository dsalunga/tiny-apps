VERSION 5.00
Begin VB.Form frmPuzzle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Puzzle"
   ClientHeight    =   5055
   ClientLeft      =   150
   ClientTop       =   840
   ClientWidth     =   4995
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5055
   ScaleWidth      =   4995
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   4575
      Left            =   240
      ScaleHeight     =   4515
      ScaleWidth      =   4485
      TabIndex        =   0
      Top             =   240
      Width           =   4545
      Begin VB.CommandButton cmdButton 
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   0
         Left            =   120
         TabIndex        =   16
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   1
         Left            =   1200
         TabIndex        =   15
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   2
         Left            =   2280
         TabIndex        =   14
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   3
         Left            =   3360
         TabIndex        =   13
         Top             =   120
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   4
         Left            =   120
         TabIndex        =   12
         Top             =   1200
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   5
         Left            =   1200
         TabIndex        =   11
         Top             =   1200
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   6
         Left            =   2280
         TabIndex        =   10
         Top             =   1200
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   7
         Left            =   3360
         TabIndex        =   9
         Top             =   1200
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   8
         Left            =   120
         TabIndex        =   8
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   9
         Left            =   1200
         TabIndex        =   7
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "11"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   10
         Left            =   2280
         TabIndex        =   6
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "12"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   11
         Left            =   3360
         TabIndex        =   5
         Top             =   2280
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "13"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   12
         Left            =   120
         TabIndex        =   4
         Top             =   3360
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "14"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   13
         Left            =   1200
         TabIndex        =   3
         Top             =   3360
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "15"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   14
         Left            =   2280
         TabIndex        =   2
         Top             =   3360
         Width           =   975
      End
      Begin VB.CommandButton cmdButton 
         Caption         =   "16"
         BeginProperty Font 
            Name            =   "Trebuchet MS"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Index           =   15
         Left            =   3360
         TabIndex        =   1
         Top             =   3360
         Visible         =   0   'False
         Width           =   975
      End
   End
   Begin VB.Menu mnuGame 
      Caption         =   "&Game"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
      End
      Begin VB.Menu mnuGiveup 
         Caption         =   "&Give-up"
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmPuzzle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim GameStarted As Boolean
Dim hiddenX As Integer
Dim hiddenY As Integer
Dim Shuffling As Boolean
Dim Steps As Integer
Const ButtonSize = 1080

Private Sub cmdButton_Click(Index As Integer)
    Dim tmpX As Integer, tmpY As Integer
    
    If GameStarted Then
    If ((cmdButton(Index).Left - ButtonSize = hiddenX Or cmdButton(Index).Left + ButtonSize = hiddenX) _
       And (cmdButton(Index).Top = hiddenY)) Xor _
       ((cmdButton(Index).Top - ButtonSize = hiddenY Or cmdButton(Index).Top + ButtonSize = hiddenY) _
       And (cmdButton(Index).Left = hiddenX)) Then

        tmpX = cmdButton(Index).Left
        tmpY = cmdButton(Index).Top
        
        cmdButton(Index).Left = hiddenX
        cmdButton(Index).Top = hiddenY
        hiddenX = tmpX
        hiddenY = tmpY
        
        If Not Shuffling Then
            Steps = Steps + 1
            If IsPuzzleComplete() Then
                MsgBox "Congratulations!!! Completed in " & CStr(Steps) & " steps!", vbOKOnly + vbExclamation, "Puzzle Completed"
                'cmdButton(1).Visible = True
                GameStarted = False
            End If
        End If
    End If
    
    End If
End Sub

Private Sub mnuExit_Click()
    End
End Sub

Sub Shuffle()
    Dim x As Integer
    Shuffling = True
    Randomize
    For x = 1 To 1000
        cmdButton_Click (Int((14 - 0 + 1) * Rnd + 0))
    Next
    Shuffling = False
End Sub

Private Sub mnuGiveup_Click()
Dim row As Integer, col As Integer, pieceIndex As Integer
    For row = 0 To 3
        For col = 0 To 3
            pieceIndex = row * 4 + col
            cmdButton(pieceIndex).Left = col * ButtonSize + 120
            cmdButton(pieceIndex).Top = row * ButtonSize + 120
        Next
    Next
    GameStarted = False
End Sub

Private Sub mnuNew_Click()
    hiddenY = 3360
    hiddenX = 3360
    GameStarted = True
    Call Shuffle
End Sub

Function IsPuzzleComplete() As Boolean
Dim row As Integer, col As Integer, pieceIndex As Integer, WrongPosition As Boolean
    For row = 0 To 3
        For col = 0 To 3
            pieceIndex = row * 4 + col
            If Not ((cmdButton(pieceIndex).Left = col * ButtonSize + 120) And (cmdButton(pieceIndex).Top = row * ButtonSize + 120)) Then
                WrongPosition = True
                Exit For
            End If
        Next
        If WrongPosition Then Exit For
    Next
    IsPuzzleComplete = Not WrongPosition
End Function
