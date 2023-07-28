Sub ExtrairInformacoesDoNomeDoArquivo()
    Dim regex As Object
    Set regex = CreateObject("VBScript.RegExp")

    'Padrão regex para extrair o número da conta corrente e a data do arquivo
    Dim padraoRegex As String
    padraoRegex = "MR_Cliente_([A-Za-z0-9\-]+)_([0-9]{8})"

    'Nome do arquivo no padrão MR_Cliente_abcde-f_yyyymmdd
    Dim nomeArquivo As String
    nomeArquivo = "MR_Cliente_abcde-f_20230630"

    'Verifica se o nome do arquivo segue o padrão esperado
    If regex.Test(nomeArquivo, padraoRegex) Then
        'Executa a correspondência usando o padrão regex
        regex.Global = True
        regex.Pattern = padraoRegex
        Dim correspondencias As Object
        Set correspondencias = regex.Execute(nomeArquivo)

        'Extrai as informações da conta corrente e data do arquivo
        Dim numeroConta As String
        Dim dataArquivo As String
        numeroConta = correspondencias(0).SubMatches(0)
        dataArquivo = correspondencias(0).SubMatches(1)

        'Exibe as informações extraídas
        MsgBox "Número da conta corrente: " & numeroConta & vbCrLf & "Data do arquivo: " & dataArquivo
    Else
        'Caso o nome do arquivo não siga o padrão esperado
        MsgBox "O nome do arquivo não segue o padrão esperado."
    End If
End Sub
