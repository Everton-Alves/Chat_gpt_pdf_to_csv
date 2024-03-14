Sub CopiarSheetsParaArquivoFinal()
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim newWb As Workbook
    Dim newRow As Long
    Dim i As Integer
    
    ' Desativar alertas
    Application.DisplayAlerts = False
    
    ' Criar um novo arquivo final
    Set newWb = Workbooks.Add
    
    ' Renomear a primeira planilha como "Arquivo_final"
    newWb.Sheets(1).Name = "Arquivo_final"
    
    ' Iniciar a contagem de linha para colar os dados
    newRow = 1
    
    ' Loop através de todos os arquivos na pasta atual
    Dim Filename As String
    Filename = Dir(ThisWorkbook.Path & "\*.xls*")
    
    Do While Filename <> ""
        ' Abrir o arquivo atual
        Set wb = Workbooks.Open(ThisWorkbook.Path & "\" & Filename)
        
        ' Loop através de todas as planilhas no arquivo
        For Each ws In wb.Sheets
            ' Copiar a largura das colunas da planilha atual
            For i = 1 To ws.Columns.Count
                newWb.Sheets("Arquivo_final").Columns(i).ColumnWidth = ws.Columns(i).ColumnWidth
            Next i
            
            ' Copiar o conteúdo da planilha atual
            ws.UsedRange.Copy
            
            ' Colar no arquivo final mantendo a formatação e largura das colunas
            newWb.Sheets("Arquivo_final").Cells(newRow, 1).PasteSpecial xlPasteAllUsingSourceTheme
            
            ' Atualizar a linha para a próxima cópia
            newRow = newRow + ws.UsedRange.Rows.Count + 2
        Next ws
        
        ' Fechar o arquivo atual sem salvar alterações e sem exibir mensagens de aviso
        wb.Close False
        
        ' Procurar o próximo arquivo na pasta
        Filename = Dir
    Loop
    
    ' Limpar a área de transferência
    Application.CutCopyMode = False
    
    ' Salvar o novo arquivo
    newWb.SaveAs ThisWorkbook.Path & "\Arquivo_final.xlsx"
    
    ' Fechar o novo arquivo sem exibir mensagens de aviso
    newWb.Close False
    
    ' Ativar alertas novamente
    Application.DisplayAlerts = True
    
    ' Mensagem de conclusão
    MsgBox "Os dados foram copiados para o arquivo final com sucesso!", vbInformation
    
End Sub
