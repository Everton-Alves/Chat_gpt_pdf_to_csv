Sub ProcurarEmailsPorGrupo()
    Dim objNamespace As Outlook.Namespace
    Dim objRecipient As Outlook.Recipient
    Dim objFolder As Outlook.Folder
    Dim objItems As Outlook.Items
    Dim objDistList As Outlook.DistListItem
    Dim strGroupName As String
    
    ' Nome do grupo de contatos
    strGroupName = InputBox("Digite o nome do grupo de contatos:")
    
    ' Inicializar o objeto Namespace
    Set objNamespace = Outlook.Application.GetNamespace("MAPI")
    
    ' Obter o objeto Recipient
    Set objRecipient = objNamespace.CreateRecipient("exemplo@dominio.com") ' Substitua pelo endereço de e-mail compartilhado
    
    ' Verificar se o endereço de e-mail foi resolvido corretamente
    If objRecipient.Resolved Then
        ' Obter a pasta compartilhada
        Set objFolder = objNamespace.GetSharedDefaultFolder(objRecipient, olFolderContacts)
        
        ' Obter todos os itens na pasta de contatos
        Set objItems = objFolder.Items
        
        ' Percorrer todos os itens
        For Each objDistList In objItems
            ' Verificar se é um grupo de contatos
            If TypeOf objDistList Is Outlook.DistListItem Then
                ' Verificar se o nome do grupo corresponde ao fornecido
                If objDistList.DLName = strGroupName Then
                    ' Exibir os e-mails do grupo de contatos
                    Dim objMember As Outlook.Recipient
                    For Each objMember In objDistList.MemberObjects
                        MsgBox "Nome: " & objMember.Name & vbCrLf & "E-mail: " & objMember.Address
                    Next objMember
                    Exit Sub ' Sair do loop assim que o grupo for encontrado
                End If
            End If
        Next objDistList
        
        ' O grupo de contatos não foi encontrado
        MsgBox "Grupo de contatos não encontrado."
    Else
        ' O endereço de e-mail não foi resolvido corretamente
        MsgBox "Endereço de e-mail inválido."
    End If
    
    ' Limpar a memória
    Set objDistList = Nothing
    Set objItems = Nothing
    Set objFolder = Nothing
    Set objRecipient = Nothing
    Set objNamespace = Nothing
End Sub
