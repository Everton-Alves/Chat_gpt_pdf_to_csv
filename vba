Sub ObterEmailsDoGrupo()
    Dim olApp As Object 'Outlook.Application
    Dim olNamespace As Object 'Outlook.Namespace
    Dim olRecipient As Object 'Outlook.Recipient
    Dim olAddressList As Object 'Outlook.AddressList
    Dim olAddressEntry As Object 'Outlook.AddressEntry
    Dim olExchangeUser As Object 'Outlook.ExchangeUser
    Dim strEmails As String
    
    ' Inicializa o objeto do Outlook
    Set olApp = CreateObject("Outlook.Application")
    Set olNamespace = olApp.GetNamespace("MAPI")
    
    ' Define o endereço de e-mail do remetente
    Set olRecipient = olNamespace.CreateRecipient("teste@teste.com")
    
    ' Obtém a lista de contatos compartilhados pelo remetente
    Set olAddressList = olNamespace.AddressLists("Contatos compartilhados")
    Set olAddressEntry = olAddressList.AddressEntries.Item(olRecipient.Name)
    Set olExchangeUser = olAddressEntry.GetExchangeUser
    
    ' Verifica cada contato no grupo "MA" e adiciona seu e-mail à string
    For Each olAddressEntry In olExchangeUser.GetMemberOfList
        If olAddressEntry.Name = "MA" Then
            Dim olDistList As Object 'Outlook.DistListItem
            Dim olMember As Object
            
            Set olDistList = olAddressEntry.GetExchangeDistributionList
            For Each olMember In olDistList.Member
                strEmails = strEmails & olMember.Address & ";"
            Next olMember
            
            Exit For
        End If
    Next olAddressEntry
    
    ' Remove o último ponto-e-vírgula da string, se existir
    If Right(strEmails, 1) = ";" Then
        strEmails = Left(strEmails, Len(strEmails) - 1)
    End If
    
    ' Exibe a string de e-mails
    MsgBox strEmails
End Sub
