Attribute VB_Name = "Module1"
Option Explicit

Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2

Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2

Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, _
        ByVal hWndInsertAfter As Long, ByVal x As Long, _
        ByVal y As Long, ByVal cx As Long, _
        ByVal cy As Long, ByVal wFlags As Long) As Long


Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
        (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) _
        As Long
Public Declare Sub ReleaseCapture Lib "user32" ()


Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Public Function SetTopMostWindow(hwnd As Long, Topmost As Boolean) As Long

    If Topmost = True Then
        SetTopMostWindow = SetWindowPos(hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
    Else
        SetTopMostWindow = SetWindowPos(hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, FLAGS)
        SetTopMostWindow = False
    End If
End Function



