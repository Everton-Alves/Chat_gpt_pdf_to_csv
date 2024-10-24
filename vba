Sub ConsolidarPlanilhas()

    Dim wbDestino As Workbook
    Dim wbOrigem As Workbook
    Dim wsOrigem As Worksheet
    Dim wsDestino As Worksheet
    Dim caminhoOrigem As String
    Dim caminhoDestino As String
    Dim nomeArquivo As String
    Dim nomePlanilhas As Variant
    Dim i As Integer
    Dim ultimaLinha As Long

    ' Defina o caminho fixo para a pasta de origem dos arquivos de trades
    caminhoOrigem = "C:\Caminho\Para\Pasta\De\Origem\"  ' Substitua pelo caminho real
    ' Defina o caminho fixo para salvar o arquivo consolidado
    caminhoDestino = "C:\Caminho\Para\Pasta\De\Destino\"  ' Substitua pelo caminho real

    ' Array contendo os nomes das planilhas que deseja consolidar
    nomePlanilhas = Array("CC_total", "RV_total", "RF_total", "FUNDOS_total")
    
    ' Cria um novo Workbook para consolidar as informações
    Set wbDestino = Workbooks.Add
    
    ' Loop para cada nome de planilha no array
    For i = LBound(nomePlanilhas) To UBound(nomePlanilhas)
        On Error Resume Next ' Ignora erro se a planilha não existir
        
        ' Nome da planilha no workbook de destino
        Set wsDestino = wbDestino.Sheets.Add
        wsDestino.Name = nomePlanilhas(i)
        
        ' Defina o nome do arquivo de origem (substitua pelo nome fixo, se necessário)
        nomeArquivo = caminhoOrigem & "Arquivo_" & nomePlanilhas(i) & ".xlsx"  ' Exemplo de nome de arquivo
        
        ' Verifica se o arquivo existe
        If Dir(nomeArquivo) <> "" Then
            ' Abre o Workbook de origem
            Set wbOrigem = Workbooks.Open(nomeArquivo)
            
            ' Verifica se a planilha especificada existe no arquivo de origem
            On Error Resume Next
            Set wsOrigem = wbOrigem.Sheets(nomePlanilhas(i))
            On Error GoTo 0
            
            If Not wsOrigem Is Nothing Then
                ' Copia todos os dados da planilha de origem para a planilha de destino
                wsOrigem.UsedRange.Copy Destination:=wsDestino.Range("A1")
            Else
                MsgBox "A planilha " & nomePlanilhas(i) & " não foi encontrada no arquivo " & nomeArquivo, vbExclamation
            End If
            
            ' Fecha o Workbook de origem sem salvar alterações
            wbOrigem.Close SaveChanges:=False
        Else
            MsgBox "O arquivo " & nomeArquivo & " não foi encontrado.", vbExclamation
        End If
    Next i
    
    ' Salva o Workbook consolidado na pasta de destino
    nomeArquivo = caminhoDestino & "Consolidado.xlsx"
    wbDestino.SaveAs Filename:=nomeArquivo
    MsgBox "Consolidação concluída com sucesso! Arquivo salvo em: " & nomeArquivo, vbInformation
    
    ' Fecha o Workbook consolidado
    wbDestino.Close SaveChanges:=True
    
End Sub
