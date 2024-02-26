Sub PintarCelulasIguais()
    Dim ws As Worksheet
    Dim valorD As Variant
    Dim rngF As Range, cel As Range
    
    ' Definir a planilha de trabalho (substitua "Planilha1" pelo nome real da sua planilha)
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Definir o valor da célula na coluna D a ser verificado
    valorD = ws.Range("D1").Value ' Altere para a célula desejada
    
    ' Definir o intervalo na coluna F (de F1 até a última célula com dados)
    Set rngF = ws.Range("F1:F" & ws.Cells(ws.Rows.Count, "F").End(xlUp).Row)
    
    ' Verificar se o valor de D1 existe em toda a coluna F
    For Each cel In rngF
        If cel.Value = valorD Then
            ' Se encontrado, pintar a célula correspondente na coluna D
            ws.Cells(cel.Row, "D").Interior.Color = RGB(255, 0, 0) ' Cor vermelha (pode ser alterada)
        End If
    Next cel
End Sub
