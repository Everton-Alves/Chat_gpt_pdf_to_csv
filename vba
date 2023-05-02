Sub InserirAssinatura()
    Dim objMail As MailItem
    Dim strAssinatura As String
    
    ' Obtém o e-mail atual
    Set objMail = Application.ActiveInspector.CurrentItem
    
    ' Define a assinatura padrão
    strAssinatura = objMail.HTMLBody
    
    ' Insere a assinatura no final do corpo do e-mail
    objMail.HTMLBody = objMail.HTMLBody & strAssinatura
    
    ' Libera a memória do objeto MailItem
    Set objMail = Nothing
End Sub
