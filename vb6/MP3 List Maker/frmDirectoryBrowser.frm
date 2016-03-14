VERSION 5.00
Begin VB.Form frmDirectoryBrowser 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Directory Browser"
   ClientHeight    =   3240
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4800
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3240
   ScaleWidth      =   4800
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      Top             =   2760
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Top             =   2760
      Width           =   1095
   End
   Begin VB.DriveListBox drvDrives 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      TabIndex        =   1
      Top             =   2160
      Width           =   4335
   End
   Begin VB.DirListBox dirDirectory 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1890
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmDirectoryBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim sDir As String

Private Sub cmdCancel_Click()
    Me.Dir = ""
    Me.Hide
End Sub

Public Property Let Dir(sPath As String)
    sDir = sPath
End Property

Public Property Get Dir() As String
    Dir = sDir
End Property

Private Sub cmdOK_Click()
    Me.Dir = dirDirectory.List(dirDirectory.ListIndex)
    Me.Hide
End Sub

Private Sub drvDrives_Change()
    dirDirectory.Path = drvDrives.Drive
End Sub

Private Sub Form_Load()
    dirDirectory.Path = drvDrives.Drive
End Sub
