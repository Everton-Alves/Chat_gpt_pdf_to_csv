Sub PintarCelulasIguais()
    Dim ws As Worksheet
    Dim lastRow As Long, i As Long
    
    ' Definir a planilha de trabalho (substitua "Planilha1" pelo nome real da sua planilha)
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Encontrar a última linha com dados na coluna D
    lastRow = ws.Cells(ws.Rows.Count, "D").End(xlUp).Row
    
    ' Loop através das linhas da coluna D
    For i = 1 To lastRow
        ' Verificar se a célula na coluna D é igual à célula correspondente na coluna F
        If ws.Cells(i, "D").Value = ws.Cells(i, "F").Value Then
            ' Se for igual, pintar a célula na coluna D
            ws.Cells(i, "D").Interior.Color = RGB(255, 0, 0) ' Cor vermelha (pode ser alterada)
        End If
    Next i
End Sub
