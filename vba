Sub ConsolidarPlanilhas()

    Dim wbDestino As Workbook
    Dim wbOrigem As Workbook
    Dim wsOrigem As Worksheet
    Dim wsDestino As Worksheet
    Dim caminhoOrigem As String
    Dim nomeArquivo As String
    Dim ultimaLinha As Long
    Dim nomePlanilhas As Variant
    Dim i As Integer

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
        
        ' Solicita o caminho do arquivo de origem
        caminhoOrigem = Application.GetOpenFilename("Arquivos Excel (*.xlsx; *.xlsm), *.xlsx; *.xlsm", , "Selecione o arquivo de origem para a planilha " & nomePlanilhas(i))
        
        ' Verifica se o usuário selecionou um arquivo
        If caminhoOrigem <> "False" Then
            ' Abre o Workbook de origem
            Set wbOrigem = Workbooks.Open(caminhoOrigem)
            
            ' Verifica se a planilha especificada existe no arquivo de origem
            On Error Resume Next
            Set wsOrigem = wbOrigem.Sheets(nomePlanilhas(i))
            On Error GoTo 0
            
            If Not wsOrigem Is Nothing Then
                ' Copia todos os dados da planilha de origem para a planilha de destino
                wsOrigem.UsedRange.Copy Destination:=wsDestino.Range("A1")
            Else
                MsgBox "A planilha " & nomePlanilhas(i) & " não foi encontrada no arquivo selecionado.", vbExclamation
            End If
            
            ' Fecha o Workbook de origem sem salvar alterações
            wbOrigem.Close SaveChanges:=False
        End If
    Next i
    
    ' Salva o Workbook consolidado
    nomeArquivo = Application.GetSaveAsFilename("Consolidado.xlsx", "Arquivos Excel (*.xlsx), *.xlsx", , "Salvar arquivo consolidado como")
    If nomeArquivo <> "False" Then
        wbDestino.SaveAs Filename:=nomeArquivo
        MsgBox "Consolidação concluída com sucesso!", vbInformation
    End If
    
    ' Fecha o Workbook consolidado
    wbDestino.Close SaveChanges:=True
    
End Sub
