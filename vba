Sub EncontrarEmailsCompartilhados()
    Dim objNamespace As Outlook.Namespace
    Dim objRecipient As Outlook.Recipient
    Dim objFolder As Outlook.Folder
    Dim objItems As Outlook.Items
    Dim objMail As Outlook.MailItem
    Dim strEmail As String
    
    ' Endereço de e-mail do destinatário compartilhado
    strEmail = "exemplo@dominio.com"
    
    ' Inicializar o objeto Namespace
    Set objNamespace = Outlook.Application.GetNamespace("MAPI")
    
    ' Obter o objeto Recipient
    Set objRecipient = objNamespace.CreateRecipient(strEmail)
    objRecipient.Resolve
    
    ' Verificar se o endereço de e-mail foi resolvido corretamente
    If objRecipient.Resolved Then
        ' Obter a pasta compartilhada
        Set objFolder = objNamespace.GetSharedDefaultFolder(objRecipient, olFolderInbox)
        
        ' Obter todos os itens na pasta
        Set objItems = objFolder.Items
        
        ' Percorrer todos os itens
        For Each objMail In objItems
            ' Verificar se é um e-mail
            If TypeOf objMail Is Outlook.MailItem Then
                ' Fazer algo com o e-mail encontrado
                MsgBox "Assunto: " & objMail.Subject & vbCrLf & "Remetente: " & objMail.SenderEmailAddress
            End If
        Next objMail
    Else
        ' O endereço de e-mail não foi resolvido corretamente
        MsgBox "Endereço de e-mail inválido."
    End If
    
    ' Limpar a memória
    Set objMail = Nothing
    Set objItems = Nothing
    Set objFolder = Nothing
    Set objRecipient = Nothing
    Set objNamespace = Nothing
End Sub
