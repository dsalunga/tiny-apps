VERSION 5.00
Begin VB.Form frmPreview 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Picture Preview"
   ClientHeight    =   3285
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4275
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3285
   ScaleWidth      =   4275
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image Picture1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3000
      Left            =   120
      Stretch         =   -1  'True
      Top             =   120
      Width           =   4005
   End
End
Attribute VB_Name = "frmPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Picture1.Picture = LoadPicture(picturePath)
End Sub
