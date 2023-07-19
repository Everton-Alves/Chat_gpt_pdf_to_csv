Sub RetornarLinhaAnteriorAoTeste()
    Dim texto As String
    Dim linhasTexto() As String
    Dim i As Integer
    Dim posicaoTeste As Integer
    Dim linhaAnterior As String
    
    ' Substitua o texto abaixo pelo texto completo onde deseja procurar a palavra "teste"
    texto = "Esta é a primeira linha. A palavra teste ocorre nesta linha. Esta é a linha anterior."
    
    ' Separar o texto em linhas
    linhasTexto = Split(texto, vbNewLine)
    
    ' Procurar a posição da palavra "teste" nas linhas do texto
    For i = LBound(linhasTexto) To UBound(linhasTexto)
        posicaoTeste = InStr(1, linhasTexto(i), "teste", vbTextCompare)
        If posicaoTeste > 0 Then
            ' Encontrou a palavra "teste" na linha i
            If i > LBound(linhasTexto) Then
                ' A linha anterior existe
                linhaAnterior = linhasTexto(i - 1)
                MsgBox "Linha anterior à palavra 'teste': " & linhaAnterior
                Exit Sub
            Else
                ' A palavra "teste" está na primeira linha do texto
                MsgBox "Não há linha anterior à palavra 'teste'. A palavra está na primeira linha."
                Exit Sub
            End If
        End If
    Next i
    
    ' A palavra "teste" não foi encontrada em nenhuma linha do texto
    MsgBox "Palavra 'teste' não encontrada no texto."
End Sub
