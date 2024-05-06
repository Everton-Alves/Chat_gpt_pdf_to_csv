Function RemoverZerosEsquerdaComHifen(ByVal numString As String) As String
    Dim partes() As String
    Dim resultado As String
    Dim i As Integer
    
    ' Dividir a string pelo hífen
    partes = Split(numString, "-")
    
    ' Iterar sobre as partes e remover os zeros à esquerda
    For i = 0 To UBound(partes)
        partes(i) = CStr(CLng(partes(i)))
    Next i
    
    ' Juntar as partes com um hífen e retornar o resultado
    RemoverZerosEsquerda = Join(partes, "-")
End Function

Sub TesteRemoverZerosEsquerda()
    Dim numString As String
    Dim resultado As String
    
    ' String de exemplo
    numString = "0034-00123456"
    
    ' Chamada da função para remover os zeros à esquerda
    resultado = RemoverZerosEsquerda(numString)
    
    ' Exibir o resultado
    MsgBox "Resultado: " & resultado
End Sub
