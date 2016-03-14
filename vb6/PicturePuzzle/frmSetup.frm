VERSION 5.00
Begin VB.Form frmSetup 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Picture Puzzle"
   ClientHeight    =   4185
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6390
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4185
   ScaleWidth      =   6390
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   3600
      Width           =   1215
   End
   Begin VB.FileListBox File1 
      Height          =   3015
      Left            =   240
      Pattern         =   "DSC04*.jpg"
      TabIndex        =   1
      Top             =   240
      Width           =   1695
   End
   Begin VB.CommandButton cmdSelect 
      Caption         =   "Select"
      Default         =   -1  'True
      Height          =   375
      Left            =   1800
      TabIndex        =   0
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Image Picture1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3000
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   240
      Width           =   4000
   End
End
Attribute VB_Name = "frmSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdCancel_Click()
    pictureChanged = False
    Unload Me
End Sub

Private Sub cmdSelect_Click()
    picturePath = File1.Path & "\" & File1.FileName
    pictureChanged = True
    Unload Me
End Sub

Private Sub File1_Click()
    Picture1.Picture = LoadPicture(File1.Path & "\" & File1.FileName)
End Sub

Private Sub File1_DblClick()
    Call cmdSelect_Click
End Sub

Private Sub Form_Load()
    File1.Path = App.Path & "\" & "Images"
    File1.ListIndex = 0
End Sub
