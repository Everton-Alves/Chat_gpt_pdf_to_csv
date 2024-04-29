Sub EncontrarRangesPorCodigo()
    Dim ws As Worksheet
    Dim codigo As Variant
    Dim rngCodigo As Range
    Dim ultimaLinha As Long
    Dim linhaInicio As Long
    Dim linhaFim As Long
    Dim listaCodigos As Variant
    Dim i As Long
    
    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Encontre a lista de códigos
    ultimaLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row ' Última linha com dados na coluna A
    listaCodigos = ws.Range("A1:A" & ultimaLinha).Value
    
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
                Set rngCodigo = ws.Range(ws.Cells(linhaInicio, 1), ws.Cells(linhaFim, ws.Columns.Count).End(xlToLeft))
                
                ' Faça o que precisar com o range (por exemplo, passar para outra função)
                ' Exemplo: OutraFuncao rngCodigo
                
                ' Limpe o range para o próximo código
                Set rngCodigo = Nothing
            End If
        End If
    Next i
End Sub
