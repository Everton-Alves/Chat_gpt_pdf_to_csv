Sub removerFiltro()
    Dim planilha As Worksheet
    Set planilha = ThisWorkbook.Worksheets("Planilha1") 'substitua "Planilha1" pelo nome da sua planilha
    
    'verifica se a planilha possui filtro ativado
    If planilha.AutoFilterMode = True Then
        'remove o filtro da coluna B
        planilha.Range("B1").AutoFilter Field:=1
        'remove o filtro da coluna D
        planilha.Range("D1").AutoFilter Field:=4
    End If
End Sub
