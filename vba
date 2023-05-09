Sub Juntar_Arquivos()

    'Definir as variáveis
    Dim wbDestino As Workbook
    Dim wbOrigem As Workbook
    Dim wsDestino As Worksheet
    Dim wsOrigem As Worksheet
    Dim rngDestino As Range
    Dim rngOrigem As Range
    Dim strCaminhoArquivo As String
    Dim strNomeArquivo As String
    
    'Definir a pasta onde estão os arquivos a serem juntados
    strCaminhoArquivo = "C:\Caminho\Para\Pasta\Com\Arquivos\"
    
    'Definir o nome do arquivo destino
    strNomeArquivo = "Arquivo_Juntado.xlsx"
    
    'Definir a planilha e a célula inicial no arquivo destino
    Set wbDestino = Workbooks.Add
    Set wsDestino = wbDestino.Worksheets(1)
    Set rngDestino = wsDestino.Range("A1")
    
    'Percorrer todos os arquivos da pasta
    strArquivo = Dir(strCaminhoArquivo & "*.xlsx")
    Do While Len(strArquivo) > 0
    
        'Abrir o arquivo de origem
        Set wbOrigem = Workbooks.Open(strCaminhoArquivo & strArquivo)
        
        'Copiar a planilha de origem para o arquivo destino
        Set wsOrigem = wbOrigem.Worksheets(1)
        Set rngOrigem = wsOrigem.UsedRange
        rngOrigem.Copy rngDestino
        
        'Fechar o arquivo de origem sem salvar as alterações
        wbOrigem.Close False
        
        'Mover a célula inicial para a próxima planilha
        Set rngDestino = wsDestino.Cells(rngDestino.Row + rngOrigem.Rows.Count, 1)
        
        'Obter o próximo arquivo da pasta
        strArquivo = Dir()
    Loop
    
    'Salvar o arquivo destino
    wbDestino.SaveAs strCaminhoArquivo & strNomeArquivo
    
    'Fechar o arquivo destino
    wbDestino.Close
    
    'Mensagem de conclusão
    MsgBox "Arquivos juntados com sucesso!"
End Sub
