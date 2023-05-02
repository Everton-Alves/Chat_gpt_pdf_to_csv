Sub InserirAssinatura()
    Dim objOL As Outlook.Application
    Dim objMail As Outlook.MailItem
    Dim strAssinatura As String
    
    ' Cria uma nova instância do Outlook
    Set objOL = New Outlook.Application
    
    ' Cria um novo e-mail
    Set objMail = objOL.CreateItem(olMailItem)
    
    ' Define a assinatura padrão
    strAssinatura = objMail.HTMLBody
    
    ' Insere a assinatura no final do corpo do e-mail
    objMail.HTMLBody = objMail.HTMLBody & strAssinatura
    
    ' Exibe o e-mail
    objMail.Display
    
    ' Libera a memória dos objetos MailItem e Outlook
    Set objMail = Nothing
    Set objOL = Nothing
End Sub
