Sub ObterContatosDoGrupoMA()
    Dim olApp As Outlook.Application
    Dim olNamespace As Outlook.Namespace
    Dim olFolder As Outlook.Folder
    Dim olContactsFolder As Outlook.Folder
    Dim olGroup As Outlook.DistListGroup
    Dim olRecipient As Outlook.Recipient
    Dim olSharedContacts As Outlook.Items
    Dim olContact As Outlook.ContactItem
    Dim contactString As String
    
    ' Inicializar o Outlook
    Set olApp = New Outlook.Application
    Set olNamespace = olApp.GetNamespace("MAPI")
    
    ' Obter a pasta de contatos compartilhados
    Set olFolder = olNamespace.GetSharedDefaultFolder(olApp.Session.CurrentUser, olFolderContacts)
    Set olContactsFolder = olFolder.Folders("Contatos Compartilhados")
    
    ' Procurar o grupo "MA"
    For Each olGroup In olContactsFolder.Items
        If olGroup.Class = olDistributionList Then
            If olGroup.DLName = "MA" Then
                ' Encontrou o grupo "MA", percorrer os membros
                Set olSharedContacts = olGroup.GetMembers
                For Each olRecipient In olSharedContacts
                    ' Verificar se o contato é compartilhado por "teste@teste.com"
                    If olRecipient.Address = "teste@teste.com" Then
                        ' Obter o contato completo
                        Set olContact = olNamespace.GetItemFromID(olRecipient.EntryID)
                        contactString = contactString & olContact.Email1Address & "; "
                    End If
                Next olRecipient
                Exit For ' Encerrar o loop após encontrar o grupo "MA"
            End If
        End If
    Next olGroup
    
    ' Exibir a string de contatos
    MsgBox contactString
    
    ' Limpar objetos
    Set olContact = Nothing
    Set olSharedContacts = Nothing
    Set olGroup = Nothing
    Set olContactsFolder = Nothing
    Set olFolder = Nothing
    Set olNamespace = Nothing
    Set olApp = Nothing
End Sub
