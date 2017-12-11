Attribute VB_Name = "ReportPhishing"
Option Explicit


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

Const PropName = "http://schemas.microsoft.com/mapi/proptag/0x007D001E"
Const ForwardTo = "siggi.bjarnason@t-mobile.com"
Const MsgSubject = "Suspect Phishing email attached"
Const Congrats = "Congrats you passed the test"
Const ReportAck = "Potential phising email reported to " & ForwardTo

  On Error GoTo ErrorHandler
  
  Dim objItem As Object
  Dim objMsg As Outlook.MailItem
  Dim objMail As Outlook.MailItem
  Dim objAttachments As Outlook.Attachments
  Dim iLoc1 As Integer
  Dim strHeader As String
  
  Set objItem = GetCurrentItem()
  
  If TypeName(objItem) = "MailItem" Then
    objMsg = objItem
    With objMsg
        strHeader = .PropertyAccessor.GetProperty(PropName)
        iLoc1 = InStr(1, strHeader, "X-PHISHTEST", 1)
        If iLoc1 > 0 Then
            MsgBox Congrats
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
            MsgBox ReportAck
        End If
    End With
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
