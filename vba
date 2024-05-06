Function ExtrairNumeracao(ByVal nomeArquivo As String) As String
    Dim regex As Object
    Dim matches As Object
    Dim match As Object
    Dim resultado As String
    
    ' Inicializar o objeto regex
    Set regex = CreateObject("VBScript.RegExp")
    
    ' Definir o padrão de busca para encontrar os números no formato desejado
    regex.Pattern = "(\d{4})-(\d{8})_\w+\.pdf"
    
    ' Executar a busca no nome do arquivo
    If regex.Test(nomeArquivo) Then
        ' Obter todas as correspondências encontradas
        Set matches = regex.Execute(nomeArquivo)
        
        ' Iterar sobre as correspondências encontradas
        For Each match In matches
            ' Extrair o valor da correspondência
            resultado = match.SubMatches(0) & "-" & match.SubMatches(1)
        Next match
    End If
    
    ' Retornar o resultado
    ExtrairNumeracao = resultado
End Function

Sub Teste()
    Dim nomeArquivo As String
    Dim numeracao As String
    
    ' Nome do arquivo de exemplo
    nomeArquivo = "001234-0012341234_TextoVariavel.pdf"
    
    ' Chamada da função para extrair a numeração
    numeracao = ExtrairNumeracao(nomeArquivo)
    
    ' Exibir a numeração extraída
    MsgBox "Numeração extraída: " & numeracao
End Sub
