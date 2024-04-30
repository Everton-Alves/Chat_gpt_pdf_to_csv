Sub Teste()
    Dim ws As Worksheet
    Dim rngPorCodigo As Object
    Dim key As Variant
    
    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    ' Chame a função para obter os ranges por código na coluna 1 (por exemplo)
    Set rngPorCodigo = ObterRangesPorCodigo(ws, 1)
    
    ' Itere sobre o dicionário para acessar os intervalos de células para cada código
    For Each key In rngPorCodigo.keys
        Debug.Print "Código: " & key
        Debug.Print "Range: " & rngPorCodigo(key).Address
        Debug.Print
    Next key
End Sub
