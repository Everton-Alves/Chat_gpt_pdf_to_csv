Sub verificarValores()
    Dim linhaInicial As Integer
    Dim linhaFinal As Integer
    Dim i As Integer
    
    'Define a linha inicial e final que deseja verificar
    linhaInicial = 2 'altere para a linha desejada
    linhaFinal = 10 'altere para a linha desejada
    
    For i = linhaInicial To linhaFinal - 1
        If Range("B" & i).Value = Range("B" & i + 1).Value And _
           Range("D" & i).Value = Range("D" & i + 1).Value And _
           Range("E" & i).Value = Range("E" & i + 1).Value And _
           Range("G" & i).Value = Range("G" & i + 1).Value Then
            MsgBox "As células das colunas B, D, E e G na linha " & i & " são iguais às células da linha " & i + 1 & "."
        End If
    Next i
End Sub
