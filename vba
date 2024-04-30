Function ObterNovoRange(rngOriginal As String, ByVal numColunas As Integer) As Range
    Dim ws As Worksheet
    Dim strRange As String
    Dim rng As Range
    Dim linhaInicial As Integer
    Dim linhaFinal As Integer
    Dim colunaInicial As String
    Dim colunaFinal As String
    
    ' Defina a planilha onde você deseja criar o novo intervalo
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Extraia as partes do intervalo original fornecido
    linhaInicial = Val(Mid(rngOriginal, 2, InStr(rngOriginal, ":") - 2))
    linhaFinal = Val(Mid(rngOriginal, InStr(rngOriginal, ":") + 2, Len(rngOriginal) - InStr(rngOriginal, ":") - 1))
    colunaInicial = Left(Mid(rngOriginal, 2), 1)
    
    ' Calcular a coluna final com base no número de colunas
    Dim colunaInicialNum As Integer
    colunaInicialNum = WorksheetFunction.Column(ws.Range(colunaInicial & 1))
    colunaFinal = Split(ws.Cells(1, colunaInicialNum + numColunas - 1).Address, "$")(1)
    
    ' Construa a string para o novo intervalo
    strRange = colunaInicial & linhaInicial & ":" & colunaFinal & linhaFinal
    
    ' Converta a string em um objeto Range
    Set rng = ws.Range(strRange)
    
    ' Retorne o novo intervalo
    Set ObterNovoRange = rng
End Function
