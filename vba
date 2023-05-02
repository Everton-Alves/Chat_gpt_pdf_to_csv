Sub InsereAssinatura()
    Dim objMail As MailItem
    Set objMail = Application.ActiveInspector.CurrentItem
    
    'Verifica se o corpo do e-mail está vazio
    If objMail.Body = "" Then
        'Caso esteja vazio, insere apenas a assinatura
        objMail.HTMLBody = objMail.HTMLBody & objMail.HTMLBody & objMail.HTMLBody
    Else
        'Caso contrário, insere o corpo do e-mail e a assinatura
        objMail.HTMLBody = objMail.HTMLBody & objMail.HTMLBody & objMail.HTMLBody & objMail.HTMLBody
    End If
End Sub
