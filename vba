Function RenomearArquivoSeExistir(diretorio As String, nomeArquivo As String) As String
    Dim contador As Integer
    Dim novoNome As String
    
    ' Verifique se o arquivo existe no diretório
    Do While Dir(diretorio & "\" & nomeArquivo) <> ""
        ' Se o arquivo existir, encontre um novo nome adicionando uma numeração
        contador = contador + 1
        novoNome = Replace(nomeArquivo, ".pdf", " " & contador & ".pdf")
    Loop
    
    ' Construa o novo nome do arquivo
    RenomearArquivoSeExistir = novoNome
End Function
