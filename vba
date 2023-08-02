Sub RepetirValor()
    Dim valor As Variant
    Dim i As Integer
    
    ' Define o valor a ser repetido
    valor = ActiveCell.Value
    
    ' Percorre as próximas 15 linhas a partir da célula ativa
    For i = 1 To 15
        ActiveCell.Offset(i - 1, 1).Value = valor
    Next i
End Sub
