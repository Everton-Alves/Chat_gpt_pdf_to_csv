Sub EnviarEmailComRange(rng As Range)

    Dim olApp As Object
    Dim olMail As Object
    
    ' Cria uma nova instância do Outlook
    Set olApp = CreateObject("Outlook.Application")
    
    ' Cria um novo e-mail
    Set olMail = olApp.CreateItem(olMailItem)
    
    ' Copia o conteúdo do range para a área de transferência
    rng.Copy
    
    ' Cola o conteúdo no corpo do e-mail
    olMail.GetInspector.WordEditor.Range.PasteAndFormat wdFormatOriginalFormatting
    
    ' Mostra o e-mail para o usuário
    olMail.Display
    
    ' Limpa a área de transferência
    Application.CutCopyMode = False
    
    ' Libera as referências do Outlook
    Set olMail = Nothing
    Set olApp = Nothing

End Sub
