Sub ExtrairEArmazenarMovimentacoesFundos()
    Dim ws As Worksheet
    Dim wsMovimentacoes As Worksheet
    Dim lastRow As Long, i As Long, newRow As Long
    Dim nomeFundo As String, cnpjFundo As String
    Dim dataMovimentacao As Date, transacao As String, quantidadeCotas As Double
    Dim valorCota As Double, valorBruto As Double, ir As Double, iof As Double, valorLiquido As Double
    
    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("fundos")
    
    ' Crie uma nova aba para armazenar as movimentações dos fundos
    Set wsMovimentacoes = ThisWorkbook.Sheets.Add(After:=Sheets(Sheets.Count))
    wsMovimentacoes.Name = "fundos_movimentacao_total"
    
    ' Defina a primeira linha na nova aba
    newRow = 1
    
    ' Encontre a última linha na coluna A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Loop através das células na coluna A
    For i = 1 To lastRow
        If Left(ws.Cells(i, 1).Value, 12) = "Movimentação" Then
            ' Encontrou uma linha de movimentação do fundo
            
            ' Extrai o nome do fundo e CNPJ
            nomeFundo = Trim(Mid(ws.Cells(i, 1).Value, 15, InStr(ws.Cells(i, 1).Value, "-") - 15))
            cnpjFundo = Trim(Mid(ws.Cells(i, 1).Value, InStr(ws.Cells(i, 1).Value, "-") + 1))
            
            ' Inicializa a linha atual para a próxima movimentação
            i = i + 1
            
            ' Loop até encontrar a próxima linha vazia ou uma nova movimentação
            Do While ws.Cells(i, "B").Value <> "" And Left(ws.Cells(i, 1).Value, 12) <> "Movimentação"
                ' Extrai os dados da movimentação
                dataMovimentacao = ws.Cells(i, "B").Value
                transacao = ws.Cells(i, "C").Value
                quantidadeCotas = ws.Cells(i, "D").Value
                valorCota = ws.Cells(i, "E").Value
                valorBruto = ws.Cells(i, "F").Value
                ir = ws.Cells(i, "G").Value
                iof = ws.Cells(i, "H").Value
                valorLiquido = ws.Cells(i, "I").Value
                
                ' Armazena os dados na nova aba
                wsMovimentacoes.Cells(newRow, "A").Value = nomeFundo
                wsMovimentacoes.Cells(newRow, "B").Value = cnpjFundo
                wsMovimentacoes.Cells(newRow, "C").Value = dataMovimentacao
                wsMovimentacoes.Cells(newRow, "D").Value = transacao
                wsMovimentacoes.Cells(newRow, "E").Value = quantidadeCotas
                wsMovimentacoes.Cells(newRow, "F").Value = valorCota
                wsMovimentacoes.Cells(newRow, "G").Value = valorBruto
                wsMovimentacoes.Cells(newRow, "H").Value = ir
                wsMovimentacoes.Cells(newRow, "I").Value = iof
                wsMovimentacoes.Cells(newRow, "J").Value = valorLiquido
                
                ' Avança para a próxima linha na nova aba
                newRow = newRow + 1
                
                ' Avança para a próxima linha
                i = i + 1
            Loop
        End If
    Next i
End Sub
