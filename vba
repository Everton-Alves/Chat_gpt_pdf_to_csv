Function IsSheetInCopyProcess(SheetName As String) As Boolean
    Dim ws As Worksheet
    Dim Found As Boolean
    Found = False
    
    ' Percorre todas as planilhas do workbook
    For Each ws In ThisWorkbook.Sheets
        ' Verifica se o nome da planilha atual coincide com o nome passado
        If ws.Name = SheetName Then
            Found = True
            Exit For
        End If
    Next ws
    
    ' Retorna True se a planilha foi encontrada no processo
    IsSheetInCopyProcess = Found
End Function
