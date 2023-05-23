Sub ObterContatosCompartilhados()
    Dim olApp As Object 'Outlook.Application
    Dim olNamespace As Object 'Outlook.Namespace
    Dim olRecipient As Object 'Outlook.Recipient
    Dim olAddressList As Object 'Outlook.AddressList
    Dim olAddressEntry As Object 'Outlook.AddressEntry
    Dim olExchangeUser As Object 'Outlook.ExchangeUser
    Dim olSharedContactsFolder As Object 'Outlook.Folder
    Dim olContact As Object 'Outlook.ContactItem
    
    ' Inicializa o objeto do Outlook
    Set olApp = CreateObject("Outlook.Application")
    Set olNamespace = olApp.GetNamespace("MAPI")
    
    ' Define o endereço de e-mail do remetente
    Set olRecipient = olNamespace.CreateRecipient("teste@teste.com")
    
    ' Obtém a lista de contatos compartilhados pelo remetente
    Set olAddressList = olNamespace.AddressLists("Contatos compartilhados")
    Set olAddressEntry = olAddressList.AddressEntries.Item(olRecipient.Name)
    Set olExchangeUser = olAddressEntry.GetExchangeUser
    
    ' Obtém a pasta de contatos compartilhados
    Set olSharedContactsFolder = olNamespace.GetSharedDefaultFolder(olExchangeUser, 10) ' 10 = OlDefaultFolders.olFolderContacts
    
    ' Percorre os contatos compartilhados e exibe seus nomes
    For Each olContact In olSharedContactsFolder.Items
        Debug.Print olContact.FullName
    Next olContact
    
    ' Limpa os objetos
    Set olContact = Nothing
    Set olSharedContactsFolder = Nothing
    Set olExchangeUser = Nothing
    Set olAddressEntry = Nothing
    Set olAddressList = Nothing
    Set olRecipient = Nothing
    Set olNamespace = Nothing
    Set olApp = Nothing
End Sub
