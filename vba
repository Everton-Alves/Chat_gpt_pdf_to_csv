Dim celula As Range
Dim valor As Variant
Dim indice As Long
indice = 0
For Each celula In coluna
    valor = celula.Value
    If Not IsError(valor) Then 'ignora valores de erro
        If IsEmpty(vetor) Then 'adiciona o primeiro valor
            ReDim vetor(0)
            vetor(0) = valor
            indice = 1
        ElseIf IsNumeric(Application.Match(valor, vetor, 0)) Then 'verifica se o valor já existe no vetor
            'ignora valores duplicados
        Else 'adiciona o valor único
            ReDim Preserve vetor(indice)
            vetor(indice) = valor
            indice = indice + 1
        End If
    End If
Next celula
