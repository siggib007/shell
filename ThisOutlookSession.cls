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
  Dim objInbox As Outlook.Folder
  Dim objRootFolder As Outlook.Folder
  Set olApp = Outlook.Application
  Set objNS = olApp.GetNamespace("MAPI")
  ' default local Inbox
  Set objInbox = objNS.GetDefaultFolder(olFolderInbox)
  Set objRootFolder = objInbox.Parent
  Set Items = objRootFolder.Folders("A0Test").Items
End Sub

Private Sub Items_ItemAdd(ByVal item As Object)

  On Error GoTo ErrorHandler
  Dim olApp As Outlook.Application
  Dim objNS As Outlook.NameSpace
  Dim objMail As Outlook.MailItem
  Dim objExtMsg As Outlook.MailItem
  Dim objReplyMsg As Outlook.MailItem
  
  Dim objAttachment As Outlook.Attachment
  Dim iLoc1 As Integer
  Dim strHeader As String
  Dim strExtHeader As String
  Dim fso As Object
  Dim strTempMsg As String
  Dim objInbox As Outlook.Folder
  Dim objRootFolder As Outlook.Folder
  Dim objDestFolder As Outlook.Folder
  

  strTempMsg = Environ("temp") & "\DPHJITSQHEAFEMTTBCGF.msg"
  
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set olApp = Outlook.Application
  Set objNS = olApp.GetNamespace("MAPI")
  Set objInbox = objNS.GetDefaultFolder(olFolderInbox)
  Set objRootFolder = objInbox.Parent
  Set objDestFolder = objRootFolder.Folders("00PhisingTest")

  If TypeName(item) = "MailItem" Then
    Set objMail = item
    With objMail
        If .Attachments.Count > 0 Then
            Set objAttachment = .Attachments.item(1)
            If objAttachment.Type = olEmbeddeditem Then
                objAttachment.SaveAsFile (strTempMsg)
                Set objExtMsg = objNS.OpenSharedItem(strTempMsg)
                strExtHeader = objExtMsg.PropertyAccessor.GetProperty(PropName)
                iLoc1 = InStr(1, strExtHeader, "X-PHISHTEST", 1)
                If iLoc1 > 0 Then
                    MsgBox "Contains an attachment with phish test message"
                    .Move objDestFolder
                    Set objReplyMsg = .Reply
                    objReplyMsg.Body = "Thanks for reporting this. This message was a phishing test"
                    objReplyMsg.Send
                Else
                    MsgBox "Contains a normal email attached"
                End If
            Else
                MsgBox "Contains non-email attachment"
            End If
        Else
            strHeader = .PropertyAccessor.GetProperty(PropName)
            iLoc1 = InStr(1, strHeader, "X-PHISHTEST", 1)
            If iLoc1 > 0 Then
                MsgBox ("Phising test email, no attachment")
                .Move objDestFolder
            Else
                MsgBox ("Normal email, no attachment")
            End If
        End If
    End With
    Set objAttachment = Nothing
    Set objExtMsg = Nothing
  Else
    MsgBox ("item is " & TypeName(item) & " class: " & item.Class)
  End If
  If fso.FileExists(strTempMsg) Then
    fso.DeleteFile strTempMsg, True
  End If
  
ProgramExit:
  Set fso = Nothing
  Set olApp = Nothing
  Set objNS = Nothing
  Set objInbox = Nothing
  Set objRootFolder = Nothing
  Set objDestFolder = Nothing
  Set objExtMsg = Nothing
  Set objAttachment = Nothing
  Exit Sub
ErrorHandler:
  MsgBox Err.Number & " - " & Err.Description
  Resume ProgramExit
End Sub
