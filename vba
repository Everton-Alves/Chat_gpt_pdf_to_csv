Sub InserirAssinatura()

    Dim objOutlook As Outlook.Application
    Dim objMail As Outlook.MailItem
    Dim strAssinatura As String
    
    ' Cria uma nova instância do Outlook
    Set objOutlook = CreateObject("Outlook.Application")
    
    ' Cria um novo e-mail
    Set objMail = objOutlook.CreateItem(olMailItem)
    
    ' Define a assinatura padrão
    strAssinatura = objMail.HTMLBody
    
    ' Insere a assinatura no final do corpo do e-mail
    objMail.HTMLBody = Range("A1").Value & strAssinatura
    
    ' Exibe o e-mail para o usuário
    objMail.Display
    
    ' Libera a memória dos objetos MailItem e Application
    Set objMail = Nothing
    Set objOutlook = Nothing
    
End Sub
