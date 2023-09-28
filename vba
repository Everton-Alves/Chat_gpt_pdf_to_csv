Sub CriarVetorEIterarValoresDistintos()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Planilha1") ' Substitua "Planilha1" pelo nome da sua planilha
    
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row ' Encontra a última linha na coluna A
    
    Dim valoresDistintos() As Variant
    ReDim valoresDistintos(1 To 1) ' Inicializa o vetor com tamanho 1
    
    Dim valor As Variant
    Dim i As Long
    Dim encontrado As Boolean
    
    For Each cell In ws.Range("A2:A" & lastRow) ' Assumindo que os dados começam na linha 2
        valor = cell.Value
        encontrado = False
        
        ' Verifica se o valor já existe no vetor
        For i = 1 To UBound(valoresDistintos)
            If valoresDistintos(i) = valor Then
                encontrado = True
                Exit For
            End If
        Next i
        
        ' Se não encontrado, adiciona ao vetor
        If Not encontrado Then
            ReDim Preserve valoresDistintos(1 To UBound(valoresDistintos) + 1)
            valoresDistintos(UBound(valoresDistintos)) = valor
        End If
    Next cell
    
    ' Agora, você tem todos os valores distintos na matriz "valoresDistintos"
    
    ' Iterar sobre os valores distintos
    For i = 1 To UBound(valoresDistintos)
        MsgBox "Valor Distinto: " & valoresDistintos(i)
        ' Faça o que quiser com cada valor distintos aqui
    Next i
End Sub
