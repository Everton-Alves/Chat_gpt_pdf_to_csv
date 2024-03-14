Sub CopiarSheetsParaArquivoFinal()
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim newWb As Workbook
    Dim newRow As Long
    
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
            ' Copiar o conteúdo da planilha atual
            ws.UsedRange.Copy
            
            ' Colar no arquivo final
            newWb.Sheets("Arquivo_final").Cells(newRow, 1).PasteSpecial xlPasteValues
            
            ' Atualizar a linha para a próxima cópia
            newRow = newRow + ws.UsedRange.Rows.Count + 2
        Next ws
        
        ' Fechar o arquivo atual
        wb.Close False
        
        ' Procurar o próximo arquivo na pasta
        Filename = Dir
    Loop
    
    ' Ajustar largura das colunas
    newWb.Sheets("Arquivo_final").Cells.EntireColumn.AutoFit
    
    ' Limpar a área de transferência
    Application.CutCopyMode = False
    
    ' Salvar o novo arquivo
    newWb.SaveAs ThisWorkbook.Path & "\Arquivo_final.xlsx"
    
    ' Fechar o novo arquivo
    newWb.Close False
    
    MsgBox "Os dados foram copiados para o arquivo final com sucesso!", vbInformation
    
End Sub
