Function ObterRangesPorCodigo(ws As Worksheet, coluna As Long) As Object
    Dim dict As Object
    Dim celula As Range
    Dim valor As Variant
    Dim rng As Range
    
    ' Crie um objeto Dictionary para armazenar os intervalos de células
    Set dict = CreateObject("Scripting.Dictionary")
    
    ' Percorra todas as células na coluna especificada
    For Each celula In ws.Columns(coluna).Cells
        valor = celula.Value
        
        If Not IsEmpty(valor) Then
            ' Verifique se o valor já existe no dicionário
            If Not dict.exists(valor) Then
                ' Se o valor ainda não existir, adicione-o ao dicionário
                Set dict(valor) = celula.EntireRow ' Armazena o intervalo de toda a linha
            Else
                ' Se o valor já existir, expanda o intervalo para incluir a nova célula
                Set dict(valor) = Union(dict(valor), celula.EntireRow)
            End If
        End If
    Next celula
    
    ' Retorne o dicionário contendo os intervalos de células para cada valor único
    Set ObterRangesPorCodigo = dict
End Function
