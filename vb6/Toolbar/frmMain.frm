VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H000000C0&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Left            =   840
      Top             =   1800
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const pos_Left = 1, pos_Right = 2, pos_Top = 3, pos_Buttom = 4

Dim m As New cMouse
Dim meVisible As Boolean
Dim tppY As Long, tppX As Long, meHeight As Long, meWidth As Long
Dim scrWidth As Long, scrHeight As Long, meCurrentSide As Integer

Private Sub Form_Load()
    fHeight = Screen.Height * 0.05
    tppY = Screen.TwipsPerPixelY
    tppX = Screen.TwipsPerPixelX
    meHeight = tppY * 25
    meWidth = tppX * 25
    scrWidth = Screen.Width
    scrHeight = Screen.Height
    
    Me.Width = scrWidth
    Me.Height = meHeight
    Me.Top = 0
    Me.Left = 0
    Timer1.Interval = 10
    Timer1.Enabled = True
    meVisible = True
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 1 Then
        Timer1.Enabled = False
        '// Release the capture of the mouse
        Me.Width = meWidth
        Me.Height = meHeight
        Me.Top = ToTwipsY(m.CurrentY) - meHeight \ 2
        Me.Left = ToTwipsX(m.CurrentX) - meWidth \ 2

        Call ReleaseCapture
        '// Move the form with the mouse
        SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
    End If
End Sub

Sub HideMe()
    Do Until Me.Height <= 0
        Me.Height = Me.Height - tppY
        Sleep 10
    Loop
    meVisible = False
End Sub

Sub ShowMe()
    Do Until Me.Height = meHeight
        Me.Height = Me.Height + tppY
    Loop
    meVisible = True
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    '
End Sub

Private Sub Timer1_Timer()
    Debug.Print meVisible, m.CurrentY
    If Not meVisible And m.CurrentY = 0 Then
        Call ShowMe
    ElseIf meVisible And m.CurrentY >= meHeight \ tppY Then
        Call HideMe
    End If
End Sub

Function ToTwipsY(p_val As Long) As Long
    ToTwipsY = p_val * tppY
End Function

Function ToPixelY(t_val As Long) As Long
    ToPixelY = t_val \ tppY
End Function

Function ToTwipsX(p_val As Long) As Long
    ToTwipsX = p_val * tppX
End Function

Function ToPixelX(t_val As Long) As Long
    ToPixelX = t_val \ tppX
End Function

Sub setPosition(pos As Integer)
    Select Case pos
        Case pos_Left
        Case pos_Right
        Case pos_Top
        Case pos_Buttom
End Sub

Function getAppPos() As Integer
    'if me.Top
End Function
