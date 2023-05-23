Sub EncontrarEmailsPorGrupo()
    Dim objNamespace As Outlook.Namespace
    Dim objRecipient As Outlook.Recipient
    Dim objFolder As Outlook.Folder
    Dim objItems As Outlook.Items
    Dim objContactGroup As Outlook.DistListItem
    Dim objContact As Outlook.ContactItem
    Dim strEmail As String
    Dim strGroupName As String
    
    ' Endereço de e-mail do destinatário compartilhado
    strEmail = "teste@teste.com"
    
    ' Nome do grupo de contatos a ser procurado
    strGroupName = InputBox("Digite o nome do grupo de contatos:")
    
    ' Inicializar o objeto Namespace
    Set objNamespace = Outlook.Application.GetNamespace("MAPI")
    
    ' Obter o objeto Recipient
    Set objRecipient = objNamespace.CreateRecipient(strEmail)
    objRecipient.Resolve
    
    ' Verificar se o endereço de e-mail foi resolvido corretamente
    If objRecipient.Resolved Then
        ' Obter a pasta compartilhada
        Set objFolder = objNamespace.GetSharedDefaultFolder(objRecipient, olFolderContacts)
        
        ' Obter todos os itens na pasta
        Set objItems = objFolder.Items
        
        ' Percorrer todos os itens
        For Each objContact In objItems
            ' Verificar se é um grupo de contatos
            If TypeOf objContact Is Outlook.DistListItem Then
                Set objContactGroup = objContact
                
                ' Verificar se o nome do grupo corresponde à entrada do usuário
                If InStr(1, objContactGroup.DLName, strGroupName, vbTextCompare) > 0 Then
                    ' Exibir os e-mails do grupo de contatos
                    For Each Member In objContactGroup.MemberCount
                        MsgBox objContactGroup.GetMember(Member).Address
                    Next Member
                    Exit Sub
                End If
            End If
        Next objContact
        
        ' O grupo de contatos não foi encontrado
        MsgBox "Grupo de contatos não encontrado."
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
