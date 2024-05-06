Function RemoverZerosEsquerda(nomeArquivo As String) As String
    Dim partes() As String
    Dim parte1 As String
    Dim parte2 As String
    
    ' Dividir o nome do arquivo em partes usando o traço "-"
    partes = Split(nomeArquivo, "-")
    
    ' Remover zeros à esquerda da primeira parte
    parte1 = Trim(StrConv(CLng(Val(Trim(partes(0)))), vbUnicode))
    
    ' Remover zeros à esquerda da segunda parte, se existir
    If UBound(partes) > 0 Then
        parte2 = Trim(StrConv(CLng(Val(Trim(partes(1)))), vbUnicode))
    Else
        parte2 = ""
    End If
    
    ' Retornar a numeração sem zeros à esquerda
    RemoverZerosEsquerda = parte1 & IIf(Len(parte2) > 0, "-" & parte2, "")
End Function

Sub Teste()
    Dim nomeArquivo As String
    Dim numSemZeros As String
    
    ' Exemplo de nome de arquivo com zeros à esquerda
    nomeArquivo = " 0001234-0012341234_texto.pdf "
    
    ' Chamada da função para remover zeros à esquerda
    numSemZeros = RemoverZerosEsquerda(nomeArquivo)
    
    ' Exibir o resultado
    MsgBox "Número sem zeros à esquerda: " & numSemZeros
End Sub
