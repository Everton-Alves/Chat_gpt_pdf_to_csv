Function ObterCodigosComRange(ws As Worksheet) As Variant
    Dim ultimaLinha As Long
    Dim listaCodigos As Variant
    Dim i As Long, j As Long
    Dim codigo As String
    Dim linhaInicio As Long
    Dim linhaFim As Long
    Dim resultado() As CodigoComRange
    
    ' Encontre a lista de códigos
    ultimaLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row ' Última linha com dados na coluna A
    listaCodigos = ws.Range("A1:A" & ultimaLinha).Value
    
    ' Redimensionar a matriz para armazenar os resultados
    ReDim resultado(1 To ultimaLinha)
    
    ' Iterar sobre cada código na lista
    For i = LBound(listaCodigos) To UBound(listaCodigos)
        codigo = listaCodigos(i, 1)
        
        ' Se o código atual não for vazio
        If Not IsEmpty(codigo) Then
            linhaInicio = 0
            linhaFim = 0
            
            ' Encontrar o range para o código atual
            For j = i To ultimaLinha
                If ws.Cells(j, 1).Value = codigo Then
                    If linhaInicio = 0 Then
                        linhaInicio = j ' Encontrou o início do range
                    End If
                Else
                    If linhaInicio <> 0 Then
                        linhaFim = j - 1 ' Encontrou o fim do range
                        Exit For
                    End If
                End If
            Next j
            
            ' Se o código for encontrado
            If linhaInicio <> 0 Then
                ' Defina o range para o código atual
                Dim rngCodigo As Range
                Set rngCodigo = ws.Range(ws.Cells(linhaInicio, 1), ws.Cells(linhaFim, ws.Columns.Count).End(xlToLeft))
                
                ' Armazene o código e o range correspondente na matriz resultado
                Set resultado(i) = New CodigoComRange
                resultado(i).Initialize codigo, rngCodigo
            End If
        End If
    Next i
    
    ' Redimensionar a matriz para remover elementos vazios
    ReDim Preserve resultado(1 To i)
    
    ' Retornar a matriz de objetos CodigoComRange
    ObterCodigosComRange = resultado
End Function
