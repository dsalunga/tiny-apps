VERSION 5.00
Begin VB.Form frmSnake 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Snake"
   ClientHeight    =   6015
   ClientLeft      =   150
   ClientTop       =   840
   ClientWidth     =   6015
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6015
   ScaleWidth      =   6015
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1680
      Top             =   1440
   End
   Begin VB.Menu mnuGame 
      Caption         =   "&Game"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmSnake"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim dir As Integer      'snake direction
Dim posX As Integer     'last x position
Dim posY As Integer     '...
Dim Score As Integer    'score
Dim i As Integer        'temp. variable (for loop)
Dim X As Integer        'new x position
Dim Y As Integer

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    dir = KeyCode
End Sub

Private Sub Form_Load()
    Me.ScaleMode = 3    'scalemode = pixel
    Me.BackColor = vbBlack
End Sub

Sub Init()
    Score = 0
    posX = 0
    posY = 0
    dir = 0
    
    Me.Cls              'clear the form

    For i = 1 To 25     'generates 25 red squares with random position inside the form
        Randomize
        X = Int(Rnd * 375)  'generate new random x position
        Y = Int(Rnd * 375)
        Me.Line (X, Y)-(X + 15, Y + 15), vbRed, BF  'creates a red box, 15x15 pixel
    Next
    
    Do                      'finds a new starting point for the snake by generating random x,y coor outside red boxes
        X = Int(Rnd * 375)
        Y = Int(Rnd * 375)
    Loop While Me.Point(X, Y) = vbRed       'determines if the gerated x,y are inside the box, if inside then generate again until outside
    
    Me.PSet (X, Y), vbWhite     'creates the starting point for the snake from the generated x,y
    posX = X
    posY = Y
    
    Timer1.Enabled = True
End Sub

Private Sub mnuExit_Click()
    End
End Sub

Private Sub mnuNew_Click()
    Call Init       'initialize a new game
End Sub

Private Sub Timer1_Timer()
    If dir = 0 Then Exit Sub
    
    Select Case dir         'determine the direction of the snake, assign new x,y for the line
        Case vbKeyLeft      'constant for Left arrow key
            X = posX - 2
            Y = posY
        Case vbKeyRight     '...
            X = posX + 2
            Y = posY
        Case vbKeyDown
            X = posX
            Y = posY + 2
        Case vbKeyUp
            X = posX
            Y = posY - 2
    End Select
    
    Me.Line (posX, posY)-(X, Y), vbWhite        'makes the snake longer by creating a line
    Score = Score + 1
    posX = X
    posY = Y
    
    If Me.Point(X, Y) <> vbBlack Then           'if the new x,y for the snake touches the red box, its body or the form's border then game is over
        MsgBox "Game Over! Your score is " & Score & ".", vbInformation
        Me.Caption = "Last Score: " & Score
        Timer1.Enabled = False
    End If
End Sub

