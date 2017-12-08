Attribute VB_Name = "ReportPhishing"
Option Explicit
Const PropName = "http://schemas.microsoft.com/mapi/proptag/0x007D001E"
Const TempMsg = "c:\temp\TempEmail.msg"
Const ForwardTo = "siggi.bjarnason@t-mobile.com"
Const MsgSubject = "Suspect Phishing email attached"

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

Sub CheckTest()


  'On Error GoTo ErrorHandler
  
  Dim objMsg As Outlook.MailItem
  Dim objExtMsg As Outlook.MailItem
  Dim objMail As Outlook.MailItem
  Dim objAttachment As Outlook.Attachment
  Dim objAttachments As Outlook.Attachments
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
        If .Attachments.Count > 0 Then
            Set objAttachment = .Attachments.item(1)
            If objAttachment.Type = olEmbeddeditem Then
                objAttachment.SaveAsFile (TempMsg)
                Set objExtMsg = CreateItemFromTemplate(TempMsg)
                strExtHeader = objExtMsg.PropertyAccessor.GetProperty(PropName)
                iLoc1 = InStr(1, strExtHeader, "X-PHISHTEST", 1)
                If iLoc1 > 0 Then
                    MsgBox "Contains an attachment with phish test message"
                Else
                    MsgBox "Contains a normal email attached"
                End If
            End If
        End If
        strHeader = .PropertyAccessor.GetProperty(PropName)
        iLoc1 = InStr(1, strHeader, "X-PHISHTEST", 1)
        If iLoc1 > 0 Then
            MsgBox ("Congrats you passed the test")
        Else
            Set objMail = Application.CreateItem(olMailItem)
            With objMail
               Set objAttachments = .Attachments
               objAttachments.Add objMsg
               .To = ForwardTo
               .Subject = MsgSubject
               .Body = ""
               '.Display
               .Send
            End With
            MsgBox "Thanks for reporting a potential phising email"
        End If
    End With
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

Sub CreateHTMLMail()

 'Creates a new e-mail item and modifies its properties
 Dim objMail As Outlook.MailItem

 'Create e-mail item
 Set objMail = Application.CreateItem(olMailItem)
 With objMail
 'Set body format to HTML
    .BodyFormat = olFormatHTML
    .HTMLBody = "<HTML><H2>The body of this message will appear in HTML.</H2><BODY> Please enter the message text here. </BODY></HTML>"
    .To = "siggi.bjarnason@t-mobile.com"
    .Subject = "This is a test"
    '.Display
    .Send
 End With
End Sub
