Sub CopiarContatosCompartilhadosParaExcel()
    Dim olApp As Object 'Outlook.Application
    Dim olNamespace As Object 'Outlook.Namespace
    Dim olRecipient As Object 'Outlook.Recipient
    Dim olAddressList As Object 'Outlook.AddressList
    Dim olAddressEntry As Object 'Outlook.AddressEntry
    Dim olExchangeUser As Object 'Outlook.ExchangeUser
    Dim olSharedContactsFolder As Object 'Outlook.Folder
    Dim olContact As Object 'Outlook.ContactItem
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim rowIndex As Integer
    
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
    
    ' Cria um novo arquivo do Excel e uma nova planilha
    Set wb = Workbooks.Add
    Set ws = wb.Sheets(1)
    
    ' Cabeçalhos das colunas
    ws.Cells(1, 1).Value = "Nome"
    ws.Cells(1, 2).Value = "Endereço de e-mail"
    
    ' Percorre os contatos compartilhados e copia os dados para o Excel
    rowIndex = 2 ' Começa na linha 2 (após o cabeçalho)
    For Each olContact In olSharedContactsFolder.Items
        ws.Cells(rowIndex, 1).Value = olContact.FullName
        ws.Cells(rowIndex, 2).Value = olContact.Email1Address
        rowIndex = rowIndex + 1
    Next olContact
    
    ' Ajusta as larguras das colunas
    ws.Columns("A:B").AutoFit
    
    ' Exibe o Excel com os dados dos contatos
    wb.Application.Visible = True
    
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
