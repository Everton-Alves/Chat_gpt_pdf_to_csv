Sub InserirAssinaturaOutlook()
    Dim olApp As Object 'Outlook.Application
    Dim olMsg As Object 'Outlook.MailItem
    Dim strAssinatura As String
    
    ' Cria uma nova instância do Outlook
    Set olApp = CreateObject("Outlook.Application")
    
    ' Cria um novo e-mail
    Set olMsg = olApp.CreateItem(0)
    
    ' Define a assinatura padrão
    strAssinatura = olMsg.HTMLBody
    
    ' Insere a assinatura no final do corpo do e-mail
    olMsg.HTMLBody = olMsg.HTMLBody & strAssinatura
    
    ' Exibe o e-mail
    olMsg.Display
    
    ' Libera a memória dos objetos MailItem e Outlook
    Set olMsg = Nothing
    Set olApp = Nothing
End Sub
