VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Tic-Tac-Toe"
   ClientHeight    =   6135
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5550
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6135
   ScaleWidth      =   5550
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   3840
      TabIndex        =   10
      Top             =   5520
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   5055
      Left            =   240
      ScaleHeight     =   4995
      ScaleWidth      =   4995
      TabIndex        =   0
      Top             =   240
      Width           =   5055
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   8
         Left            =   3480
         TabIndex        =   9
         Top             =   3480
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   7
         Left            =   1800
         TabIndex        =   8
         Top             =   3480
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   6
         Left            =   120
         TabIndex        =   7
         Top             =   3480
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   5
         Left            =   3480
         TabIndex        =   6
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   4
         Left            =   1800
         TabIndex        =   5
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   3
         Left            =   120
         TabIndex        =   4
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   2
         Left            =   3480
         TabIndex        =   3
         Top             =   120
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   1
         Left            =   1800
         TabIndex        =   2
         Top             =   120
         Width           =   1455
      End
      Begin VB.Label Label 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   65.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   1455
      End
      Begin VB.Line Line4 
         BorderWidth     =   5
         X1              =   0
         X2              =   5040
         Y1              =   3360
         Y2              =   3360
      End
      Begin VB.Line Line3 
         BorderWidth     =   5
         X1              =   0
         X2              =   5040
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line2 
         BorderWidth     =   5
         X1              =   3360
         X2              =   3360
         Y1              =   0
         Y2              =   5160
      End
      Begin VB.Line Line1 
         BorderWidth     =   5
         X1              =   1680
         X2              =   1680
         Y1              =   0
         Y2              =   5160
      End
   End
   Begin VB.Label lblTurn 
      Caption         =   "Turn:"
      Height          =   375
      Left            =   240
      TabIndex        =   11
      Top             =   5520
      Width           =   1695
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MyTurn As Boolean
Dim firstPlayer As String 'kung cno ang unang titira
Dim GameStarted As Boolean  'pag false ito, d ka pweding tumira

Private Sub cmdStart_Click()
    Dim x As Integer
    For x = 0 To 8  'magloo-loop para i-clear yung x and o
        Label(x).Caption = ""
    Next
    
    If firstPlayer = "X" Then   'titignan kung cno ang unang titira
        lblTurn.Caption = "Turn: X"
        MyTurn = False
        firstPlayer = "O"   'papalitan ang value para sa susunod na kiclick ung start yung isa nanaman ang unang titira
    Else
        lblTurn.Caption = "Turn: O"
        MyTurn = True
        firstPlayer = "X"
    End If
    GameStarted = True
End Sub

Private Sub Form_Load()
    firstPlayer = "O" 'unang titira ung O
End Sub

Private Sub Label_Click(Index As Integer)
    If (Label(Index).Caption = "") And (GameStarted = True) Then
        If MyTurn = True Then   'titignan kung ano ang dapat na ilagay, o or x
            Label(Index).Caption = "O"
            lblTurn.Caption = "Turn: X"
        Else
            Label(Index).Caption = "X"
            lblTurn.Caption = "Turn: O"
        End If
        Check   'iko-call ung sub na Check() para tignan kung may nanalo or draw ang game
        MyTurn = Not MyTurn 'ibabaligtad ang value ng myturn
    End If
End Sub

Sub Check()
    Dim player As String
    Dim x As Integer
    Dim y As Integer
    Dim blank As Boolean
    
    For x = 1 To 2  'magloo-loop ng dalawang beses para sa X and O
        If x = 1 Then
            player = "X"
        Else
            player = "O"
        End If
        
        'tignan lahat ng posibility kung may nanalo na, vertical, horizontal and diagonal
        If (Label(0).Caption = player And Label(1).Caption = player And Label(2).Caption = player) Or _
            (Label(3).Caption = player And Label(4).Caption = player And Label(5).Caption = player) Or _
            (Label(6).Caption = player And Label(7).Caption = player And Label(8).Caption = player) Or _
            (Label(0).Caption = player And Label(3).Caption = player And Label(6).Caption = player) Or _
            (Label(1).Caption = player And Label(4).Caption = player And Label(7).Caption = player) Or _
            (Label(2).Caption = player And Label(5).Caption = player And Label(8).Caption = player) Or _
            (Label(0).Caption = player And Label(4).Caption = player And Label(8).Caption = player) Or _
            (Label(2).Caption = player And Label(4).Caption = player And Label(6).Caption = player) Then
            MsgBox player & " Wins!!!"
            GameStarted = False
            Exit Sub
        Else
            'kung wla pang nanalo magloo-loop para tignan kung puno na game, pag puno na that means na draw
            For y = 0 To 8
                If Label(y).Caption = "" Then
                    blank = True
                    Exit For
                End If
            Next
            If blank = False Then
                MsgBox "It is a draw!!!"
                Exit Sub
            End If
        End If
    Next
End Sub
