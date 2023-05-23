Sub ProcurarEmailsCompartilhados()
    Dim objNamespace As Outlook.Namespace
    Dim objRecipient As Outlook.Recipient
    Dim objFolder As Outlook.Folder
    Dim objItems As Outlook.Items
    Dim objContact As Outlook.ContactItem
    Dim strNome As String
    Dim strEmails As String
    
    ' Nome a ser procurado
    strNome = InputBox("Digite o nome a ser pesquisado:", "Procurar E-mails Compartilhados")
    
    ' Inicializar o objeto Namespace
    Set objNamespace = Outlook.Application.GetNamespace("MAPI")
    
    ' Obter a pasta de contatos compartilhada
    Set objRecipient = objNamespace.CreateRecipient("exemplo@dominio.com") ' Substitua pelo e-mail do contato compartilhado
    objRecipient.Resolve
    
    If objRecipient.Resolved Then
        Set objFolder = objNamespace.GetSharedDefaultFolder(objRecipient, olFolderContacts)
        
        ' Obter todos os itens na pasta de contatos
        Set objItems = objFolder.Items
        
        ' Limpar a string de e-mails
        strEmails = ""
        
        ' Percorrer todos os contatos
        For Each objContact In objItems
            ' Verificar se é um contato
            If TypeOf objContact Is Outlook.ContactItem Then
                ' Verificar se o nome corresponde à pesquisa
                If InStr(1, objContact.FullName, strNome, vbTextCompare) > 0 Then
                    ' Adicionar o e-mail do contato à string
                    strEmails = strEmails & objContact.Email1Address & vbCrLf
                End If
            End If
        Next objContact
        
        ' Exibir os e-mails encontrados
        If Len(strEmails) > 0 Then
            MsgBox "E-mails encontrados:" & vbCrLf & strEmails
        Else
            MsgBox "Nenhum e-mail encontrado com o nome especificado."
        End If
    Else
        ' O endereço de e-mail não foi resolvido corretamente
        MsgBox "Endereço de e-mail inválido."
    End If
    
    ' Limpar a memória
    Set objContact = Nothing
    Set objItems = Nothing
    Set objFolder = Nothing
    Set objRecipient = Nothing
    Set objNamespace = Nothing
End Sub
