Sub AdicionarBordas(rngString As String)
    Dim ws As Worksheet
    Dim rng As Range
    
    ' Defina a planilha onde você deseja adicionar as bordas
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Converta a string em um objeto Range
    Set rng = ws.Range(rngString)
    
    ' Adicione bordas ao intervalo especificado
    With rng.Borders
        .LineStyle = xlContinuous ' Estilo de linha contínua
        .Color = vbBlack ' Cor da linha preta
        .Weight = xlThin ' Espessura da linha fina
    End With
End Sub
