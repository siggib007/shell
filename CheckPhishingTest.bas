Attribute VB_Name = "Module1"
Option Explicit
Const PropName = "http://schemas.microsoft.com/mapi/proptag/0x007D001E"
Function GetCurrentItem() As Object
    Dim objApp As Outlook.Application
           
    Set objApp = Application
    On Error Resume Next
    Select Case TypeName(objApp.ActiveWindow)
        Case "Explorer"
            Set GetCurrentItem = objApp.ActiveExplorer.Selection.item(1)
        Case "Inspector"
            Set GetCurrentItem = objApp.ActiveInspector.CurrentItem
    End Select
       
    Set objApp = Nothing
End Function

Function EvalCurrentItem()
    Dim objItem As Object
    
    Set objItem = GetCurrentItem()
    If objItem.Class = olMail Then
        CheckTest
    Else
        MsgBox "Class ID " & objItem.Class
    End If
    Set objItem = Nothing
    
End Function

Sub CheckTest()
Const TempMsg = "c:\temp\TempEmail.msg"

  On Error GoTo ErrorHandler
  Dim objMsg As Outlook.MailItem
  Dim objExtMsg As Outlook.MailItem
  Dim objAttachment As Outlook.Attachment
  Dim iLoc1 As Integer
  Dim strHeader As String
  Dim strExtHeader As String
  Dim bTest As Boolean
  Dim fso As Object
  Dim objItem As Object
  
  
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set objItem = GetCurrentItem()
  
  bTest = False
  If TypeName(objItem) = "MailItem" Then
    Set objMsg = objItem
    With objMsg
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
        MsgBox ("Normal message. Subject: " & objMsg.Subject)
    End If
  Else
    MsgBox ("item is class: " & objMsg.Class)
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

