Function RemoverZerosEsquerda(nomeArquivo As String) As String
    Dim partes() As String
    Dim parte1 As String
    Dim parte2 As String
    
    ' Dividir o nome do arquivo em partes usando o traço "-"
    partes = Split(nomeArquivo, "-")
    
    ' Remover espaços em branco da primeira parte
    parte1 = Replace(Trim(partes(0)), " ", "")
    
    ' Remover espaços em branco da segunda parte, se existir
    If UBound(partes) > 0 Then
        parte2 = Replace(Trim(partes(1)), " ", "")
    Else
        parte2 = ""
    End If
    
    ' Retornar a numeração sem espaços em branco entre os números
    RemoverZerosEsquerda = parte1 & IIf(Len(parte2) > 0, "-" & parte2, "")
End Function

Sub Teste()
    Dim nomeArquivo As String
    Dim numSemZeros As String
    
    ' Exemplo de nome de arquivo com espaços entre os números
    nomeArquivo = " 0001234 - 0012341234_texto.pdf "
    
    ' Chamada da função para remover espaços entre os números
    numSemZeros = RemoverZerosEsquerda(nomeArquivo)
    
    ' Exibir o resultado
    MsgBox "Número sem espaços entre os números: " & numSemZeros
End Sub
