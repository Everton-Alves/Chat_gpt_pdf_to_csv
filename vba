Sub InserirAssinatura()
    Dim objMail As MailItem
    
    ' Verifica se há um e-mail aberto
    If Application.ActiveInspector.CurrentItem.Class = olMail Then
        ' Obter o objeto MailItem do e-mail aberto
        Set objMail = Application.ActiveInspector.CurrentItem
        
        ' Verifica se o corpo do e-mail não está vazio
        If objMail.Body <> "" Then
            ' Insere a assinatura no final do corpo do e-mail
            objMail.HTMLBody = objMail.HTMLBody & objMail.HTMLBody
        
        Else ' Se o corpo do e-mail estiver vazio
            ' Define a assinatura padrão
            objMail.HTMLBody = objMail.HTMLBody
        End If
        
    Else ' Se nenhum e-mail estiver aberto
        MsgBox "Por favor, abra um e-mail e tente novamente.", vbExclamation
        Exit Sub
    End If
End Sub
