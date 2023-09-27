Sub VerificarValores()
    Dim ws As Worksheet
    Dim rng As Range
    Dim cel As Range
    Dim valoresBP() As Variant
    Dim i As Long
    
    ' Defina a planilha na qual você deseja trabalhar
    Set ws = ThisWorkbook.Sheets("NomeDaSuaPlanilha")
    
    ' Defina o range da coluna "BP"
    Set rng = ws.Range("BP1:BP" & ws.Cells(ws.Rows.Count, "BP").End(xlUp).Row)
    
    ' Redimensione o vetor de acordo com o número de células no range
    ReDim valoresBP(1 To rng.Rows.Count)
    
    ' Armazene os valores da coluna "BP" no vetor
    i = 1
    For Each cel In rng
        valoresBP(i) = cel.Value
        i = i + 1
    Next cel
    
    ' Itere pelos valores do vetor
    For i = 1 To UBound(valoresBP)
        ' Verifique se os valores nas linhas são iguais
        If valoresBP(i) = valoresBP(i + 1) Then
            ' Verifique se o valor na coluna "BQ" é "Aplicação" ou "Resgate"
            If ws.Cells(i, "BQ").Value = "Aplicação" And ws.Cells(i + 1, "BQ").Value = "Resgate" Then
                ' Faça algo aqui, por exemplo, imprimir a mensagem
                MsgBox "Os valores em BP são iguais, e BQ contém Aplicação seguido por Resgate."
            End If
        End If
    Next i
End Sub
