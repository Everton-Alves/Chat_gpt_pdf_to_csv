Sub VerificarColunas()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim i As Long
    Dim somaFinal As Double
    Dim valorAtualU As Variant
    Dim valorAtualV As Variant
    Dim valorX As Double
    
    ' Defina a planilha na qual você deseja trabalhar
    Set ws = ThisWorkbook.Sheets("NomeDaSuaPlanilha")
    
    ' Encontre a última linha com dados na coluna U
    lastRow = ws.Cells(ws.Rows.Count, "U").End(xlUp).Row
    
    ' Inicialize a soma final
    somaFinal = 0
    
    ' Comece a partir da segunda linha (assumindo que a primeira linha seja um cabeçalho)
    For i = 2 To lastRow
        ' Obtenha os valores das colunas U e V na linha atual
        valorAtualU = ws.Cells(i, "U").Value
        valorAtualV = ws.Cells(i, "V").Value
        
        ' Verifique se o valor em U é igual ao próximo
        If valorAtualU = ws.Cells(i + 1, "U").Value Then
            ' Verifique se o valor em V é "Aplicação" ou "Resgate"
            If valorAtualV = "Aplicação" Then
                valorX = Abs(ws.Cells(i, "X").Value) ' Valor positivo para Aplicação
            ElseIf valorAtualV = "Resgate" Then
                valorX = -Abs(ws.Cells(i, "X").Value) ' Valor negativo para Resgate
            End If
            
            ' Some o valor calculado à soma final
            somaFinal = somaFinal + valorX
        End If
    Next i
    
    ' Determine se a soma final é positiva ou negativa e exiba o resultado
    If somaFinal > 0 Then
        MsgBox "A soma final é positiva. Valor de Aplicação: " & somaFinal
    ElseIf somaFinal < 0 Then
        MsgBox "A soma final é negativa. Valor de Resgate: " & somaFinal
    Else
        MsgBox "A soma final é zero."
    End If
End Sub
