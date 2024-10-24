Sub ConsolidarPlanilhas()

    Dim wbDestino As Workbook
    Dim wbOrigem As Workbook
    Dim wsOrigem As Worksheet
    Dim wsDestino As Worksheet
    Dim caminhoOrigem As String
    Dim caminhoDestino As String
    Dim arquivoAtual As String
    Dim nomePlanilhas As Variant
    Dim i As Integer
    Dim ultimaLinhaDestino As Long
    Dim primeiraCopia As Boolean

    ' Defina o caminho fixo para a pasta de origem dos arquivos de trades
    caminhoOrigem = "C:\Caminho\Para\Pasta\De\Origem\"  ' Substitua pelo caminho real
    ' Defina o caminho fixo para salvar o arquivo consolidado
    caminhoDestino = "C:\Caminho\Para\Pasta\De\Destino\"  ' Substitua pelo caminho real

    ' Array contendo os nomes das planilhas que deseja consolidar
    nomePlanilhas = Array("CC_total", "RV_total", "RF_total", "FUNDOS_total")
    
    ' Cria um novo Workbook para consolidar as informações
    Set wbDestino = Workbooks.Add
    
    ' Cria uma sheet no workbook de destino para cada nome no array
    For i = LBound(nomePlanilhas) To UBound(nomePlanilhas)
        Set wsDestino = wbDestino.Sheets.Add
        wsDestino.Name = nomePlanilhas(i)
    Next i
    
    ' Procura por todos os arquivos Excel na pasta de origem
    arquivoAtual = Dir(caminhoOrigem & "*.xlsx")
    
    Do While arquivoAtual <> ""
        ' Abre o Workbook de origem
        Set wbOrigem = Workbooks.Open(caminhoOrigem & arquivoAtual)
        
        ' Percorre cada planilha especificada no array
        For i = LBound(nomePlanilhas) To UBound(nomePlanilhas)
            On Error Resume Next ' Ignora erro se a planilha não existir
            
            ' Verifica se a planilha especificada existe no arquivo de origem
            Set wsOrigem = wbOrigem.Sheets(nomePlanilhas(i))
            On Error GoTo 0
            
            If Not wsOrigem Is Nothing Then
                ' Encontra a planilha de destino correspondente no Workbook consolidado
                Set wsDestino = wbDestino.Sheets(nomePlanilhas(i))
                
                ' Determina a última linha preenchida na planilha de destino
                ultimaLinhaDestino = wsDestino.Cells(wsDestino.Rows.Count, 1).End(xlUp).Row
                
                ' Copia os dados da planilha de origem para a planilha de destino
                If ultimaLinhaDestino = 1 Then
                    ' Primeira cópia para esta planilha (inclui o cabeçalho)
                    wsOrigem.UsedRange.Copy Destination:=wsDestino.Range("A1")
                    primeiraCopia = True
                Else
                    ' Cópias subsequentes (ignora a primeira linha/cabeçalho)
                    wsOrigem.Rows("2:" & wsOrigem.UsedRange.Rows.Count).Copy Destination:=wsDestino.Cells(ultimaLinhaDestino + 1, 1)
                    primeiraCopia = False
                End If
            End If
        Next i
        
        ' Fecha o Workbook de origem sem salvar alterações
        wbOrigem.Close SaveChanges:=False
        
        ' Pega o próximo arquivo na pasta de origem
        arquivoAtual = Dir
    Loop
    
    ' Salva o Workbook consolidado na pasta de destino
    wbDestino.SaveAs Filename:=caminhoDestino & "Consolidado.xlsx"
    MsgBox "Consolidação concluída com sucesso! Arquivo salvo em: " & caminhoDestino & "Consolidado.xlsx", vbInformation
    
    ' Fecha o Workbook consolidado
    wbDestino.Close SaveChanges:=True
    
End Sub
