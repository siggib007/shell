VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisOutlookSession"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit

Private WithEvents Items As Outlook.Items
Attribute Items.VB_VarHelpID = -1
Const PropName = "http://schemas.microsoft.com/mapi/proptag/0x007D001E"

Private Sub Application_Startup()
  Dim olApp As Outlook.Application
  Dim objNS As Outlook.NameSpace
  Set olApp = Outlook.Application
  Set objNS = olApp.GetNamespace("MAPI")
  ' default local Inbox
  Set Items = objNS.Folders(1).Folders("A0Test").Items
End Sub
Private Sub Items_ItemAdd(ByVal item As Object)
Const TempMsg = "c:\temp\TempEmail.msg"

  On Error GoTo ErrorHandler
  Dim Msg As Outlook.MailItem
  Dim objExtMsg As Outlook.MailItem
  Dim objAttachment As Outlook.Attachment
  Dim iLoc1 As Integer
  Dim strHeader As String
  Dim strExtHeader As String
  Dim bTest As Boolean
  Dim fso As Object
  
  Set fso = CreateObject("Scripting.FileSystemObject")

  bTest = False
  If TypeName(item) = "MailItem" Then
    Set Msg = item
    With Msg
        strHeader = .PropertyAccessor.GetProperty(PropName)
        iLoc1 = InStr(1, strHeader, "X-Testing", 1)
        If iLoc1 > 0 Then
            MsgBox ("This message has a test email header.")
            bTest = True
        End If
        iLoc1 = InStr(1, strHeader, "X-PHISHTEST", 1)
        If iLoc1 > 0 Then
            MsgBox ("Just got an phish test email")
            bTest = True
        End If
        If .Attachments.Count > 0 Then
            Set objAttachment = .Attachments.item(1)
            If objAttachment.Type = olEmbeddeditem Then
                objAttachment.SaveAsFile (TempMsg)
                Set objExtMsg = CreateItemFromTemplate(TempMsg)
                strExtHeader = objExtMsg.PropertyAccessor.GetProperty(PropName)
                iLoc1 = InStr(1, strExtHeader, "X-Testing", 1)
                If iLoc1 > 0 Then
                    MsgBox "Contains an attachment with test email header"
                    bTest = True
                End If
                iLoc1 = InStr(1, strExtHeader, "X-PHISHTEST", 1)
                If iLoc1 > 0 Then
                    MsgBox "Contains an attachment with phish test message"
                    bTest = True
                End If
                If Not bTest Then MsgBox "Contains a normal email attached"
            End If
        End If
    End With
    If Not bTest Then
        MsgBox ("Normal message. Subject: " & Msg.Subject)
    End If
  Else
    MsgBox ("item is class: " & Msg.Class)
  End If
  If fso.FileExists(TempMsg) Then
    fso.DeleteFile TempMsg, True
  End If
  
ProgramExit:
  Exit Sub
ErrorHandler:
  MsgBox Err.Number & " - " & Err.Description
  Resume ProgramExit
End Sub
