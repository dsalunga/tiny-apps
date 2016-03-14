Public Class Main
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()
        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents ContextMenu1 As System.Windows.Forms.ContextMenu
    Friend WithEvents NotifyIcon1 As System.Windows.Forms.NotifyIcon
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents cmdSend As System.Windows.Forms.Button
    Friend WithEvents cmdRefresh As System.Windows.Forms.Button
    Friend WithEvents txtMessage As System.Windows.Forms.TextBox
    Friend WithEvents cboRecipients As System.Windows.Forms.ComboBox
    Friend WithEvents txtStatus As System.Windows.Forms.StatusBar
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Main))
        Me.ContextMenu1 = New System.Windows.Forms.ContextMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.NotifyIcon1 = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.cmdSend = New System.Windows.Forms.Button
        Me.cmdRefresh = New System.Windows.Forms.Button
        Me.txtMessage = New System.Windows.Forms.TextBox
        Me.cboRecipients = New System.Windows.Forms.ComboBox
        Me.txtStatus = New System.Windows.Forms.StatusBar
        Me.SuspendLayout()
        '
        'ContextMenu1
        '
        Me.ContextMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem2, Me.MenuItem3})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.Text = "&Show"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 1
        Me.MenuItem2.Text = "-"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 2
        Me.MenuItem3.Text = "E&xit"
        '
        'NotifyIcon1
        '
        Me.NotifyIcon1.ContextMenu = Me.ContextMenu1
        Me.NotifyIcon1.Text = "Windows Messaging"
        Me.NotifyIcon1.Visible = True
        '
        'cmdSend
        '
        Me.cmdSend.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.cmdSend.Location = New System.Drawing.Point(256, 8)
        Me.cmdSend.Name = "cmdSend"
        Me.cmdSend.Size = New System.Drawing.Size(80, 24)
        Me.cmdSend.TabIndex = 2
        Me.cmdSend.Text = "&Send"
        '
        'cmdRefresh
        '
        Me.cmdRefresh.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.cmdRefresh.Location = New System.Drawing.Point(256, 40)
        Me.cmdRefresh.Name = "cmdRefresh"
        Me.cmdRefresh.Size = New System.Drawing.Size(80, 24)
        Me.cmdRefresh.TabIndex = 3
        Me.cmdRefresh.Text = "&Refresh"
        '
        'txtMessage
        '
        Me.txtMessage.Location = New System.Drawing.Point(8, 40)
        Me.txtMessage.Multiline = True
        Me.txtMessage.Name = "txtMessage"
        Me.txtMessage.Size = New System.Drawing.Size(240, 80)
        Me.txtMessage.TabIndex = 5
        Me.txtMessage.Text = ""
        '
        'cboRecipients
        '
        Me.cboRecipients.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboRecipients.Location = New System.Drawing.Point(8, 8)
        Me.cboRecipients.Name = "cboRecipients"
        Me.cboRecipients.Size = New System.Drawing.Size(240, 21)
        Me.cboRecipients.TabIndex = 4
        '
        'txtStatus
        '
        Me.txtStatus.Location = New System.Drawing.Point(0, 130)
        Me.txtStatus.Name = "txtStatus"
        Me.txtStatus.Size = New System.Drawing.Size(346, 22)
        Me.txtStatus.TabIndex = 8
        Me.txtStatus.Text = "Ready"
        '
        'Main
        '
        Me.AcceptButton = Me.cmdSend
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(346, 152)
        Me.Controls.Add(Me.txtStatus)
        Me.Controls.Add(Me.txtMessage)
        Me.Controls.Add(Me.cboRecipients)
        Me.Controls.Add(Me.cmdRefresh)
        Me.Controls.Add(Me.cmdSend)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Main"
        Me.ShowInTaskbar = False
        Me.Text = "Windows Messaging"
        Me.WindowState = System.Windows.Forms.FormWindowState.Minimized
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim netview As System.Diagnostics.Process

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        NotifyIcon1.Icon = Me.Icon
        GetRecipients()
    End Sub

    Private Sub cboRecipients_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'GetRecipients()
    End Sub

    Private Sub NotifyIcon1_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles NotifyIcon1.DoubleClick
        ShowWindow()
    End Sub

    Private Sub MenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem3.Click
        NotifyIcon1.Visible = False
        Application.Exit()
    End Sub

    Private Sub cmdSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSend.Click

        If cboRecipients.Items.Count = 0 Then
            Exit Sub
        End If

        Dim i As New System.Diagnostics.ProcessStartInfo
        i.FileName = "net.exe"

        Dim sendarg As String
        If cboRecipients.Text = "All" Then
            sendarg = "send * " & Chr(34) & Trim(txtMessage.Text) & Chr(34)
        Else
            sendarg = "send " & cboRecipients.Text & " " & Chr(34) & Trim(txtMessage.Text) & Chr(34)
        End If
        i.Arguments = sendarg
        i.RedirectStandardOutput = True
        i.RedirectStandardInput = True
        i.RedirectStandardError = True
        i.CreateNoWindow = True
        i.UseShellExecute = False

        netview = New System.Diagnostics.Process
        netview.StartInfo = i
        netview.Start()
        txtStatus.Text = netview.StandardOutput.ReadLine
    End Sub

    Sub ShowWindow()
        If Me.WindowState = FormWindowState.Minimized Then Me.WindowState = FormWindowState.Normal
        Me.Show()
    End Sub

    Private Sub MenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem1.Click
        ShowWindow()
    End Sub

    Sub GetRecipients()
        Dim i As New System.Diagnostics.ProcessStartInfo
        i.FileName = "net.exe"
        i.Arguments = "view"
        i.RedirectStandardOutput = True
        i.RedirectStandardInput = True
        i.RedirectStandardError = True
        i.CreateNoWindow = True
        i.UseShellExecute = False

        netview = New System.Diagnostics.Process
        netview.StartInfo = i
        netview.Start()

        cboRecipients.Items.Clear()
        Dim resultLine As String
        resultLine = netview.StandardOutput.ReadLine

        If resultLine.Trim.StartsWith("Server") Then
            netview.StandardOutput.ReadLine()
            netview.StandardOutput.ReadLine()
            resultLine = netview.StandardOutput.ReadLine().Trim()
            Do
                If resultLine.StartsWith("\\") Then
                    cboRecipients.Items.Add(resultLine.Substring(2))
                End If
                resultLine = netview.StandardOutput.ReadLine().Trim()
            Loop Until resultLine.StartsWith("\\") = False
            cboRecipients.Items.Add("All")
            cboRecipients.SelectedIndex = 0

            txtStatus.Text = "Ready"
        Else
            txtStatus.Text = "No connectivity"
        End If
    End Sub

    Private Sub cmdRefresh_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRefresh.Click
        GetRecipients()
    End Sub

    Private Sub Main_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        e.Cancel = True
        Me.Hide()
    End Sub

    Private Sub Main_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Deactivate
        Me.Opacity = 0.5
    End Sub

    Private Sub Main_Activated(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Activated
        Me.Opacity = 1
    End Sub
End Class
