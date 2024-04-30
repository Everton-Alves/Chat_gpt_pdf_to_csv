Sub AdicionarBorda()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim rng As Range
    
    ' Defina a planilha "Template"
    Set ws = ThisWorkbook.Sheets("Template")
    
    ' Encontre a última célula preenchida na planilha "Template"
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    lastCol = ws.Cells(2, ws.Columns.Count).End(xlToLeft).Column
    
    ' Defina o intervalo a ser aplicada a borda
    Set rng = ws.Range("A2:" & Cells(lastRow, lastCol).Address)
    
    ' Aplique a borda ao intervalo
    With rng.Borders
        .LineStyle = xlContinuous
        .Color = vbBlack ' Cor da borda (preto)
        .Weight = xlThin ' Espessura da borda (fina)
    End With
End Sub
