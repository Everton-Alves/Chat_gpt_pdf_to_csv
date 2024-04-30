Function ObterNovoRange(rngOriginal As Range, ByVal numColunas As Integer) As Range
    Dim novoRange As Range
    
    ' Redimensionar o intervalo original para incluir o número desejado de colunas
    Set novoRange = rngOriginal.Resize(1, numColunas)
    
    ' Retornar o novo intervalo
    Set ObterNovoRange = novoRange
End Function
