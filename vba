Sub ExtrairMovimentacoesFundos()
    Dim ws As Worksheet
    Dim lastRow As Long, i As Long
    Dim nomeFundo As String, cnpjFundo As String
    Dim dataMovimentacao As Date, transacao As String, quantidadeCotas As Double
    Dim valorCota As Double, valorBruto As Double, ir As Double, iof As Double, valorLiquido As Double
    
    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("fundos")
    
    ' Encontre a última linha com dados na coluna A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Loop através das células na coluna A
    For i = 1 To lastRow
        If Left(ws.Cells(i, 1).Value, 12) = "Movimentação" Then
            ' Encontrou uma linha de movimentação do fundo
            
            ' Extrai o nome do fundo e CNPJ
            nomeFundo = Trim(Mid(ws.Cells(i, 1).Value, 15, InStr(ws.Cells(i, 1).Value, "-") - 15))
            cnpjFundo = Trim(Mid(ws.Cells(i, 1).Value, InStr(ws.Cells(i, 1).Value, "-") + 1))
            
            ' Encontre a última linha na coluna B a partir da linha atual
            lastRow = ws.Cells(i, "B").End(xlDown).Row
            
            ' Loop através das células na coluna B
            Dim j As Long
            For j = i To lastRow
                If ws.Cells(j, "B").Value = "Total de Aplicações" Then
                    Exit For
                End If
                
                ' Extrai os dados da movimentação
                dataMovimentacao = ws.Cells(j, "B").Value
                transacao = ws.Cells(j, "C").Value
                quantidadeCotas = ws.Cells(j, "D").Value
                valorCota = ws.Cells(j, "E").Value
                valorBruto = ws.Cells(j, "F").Value
                ir = ws.Cells(j, "G").Value
                iof = ws.Cells(j, "H").Value
                valorLiquido = ws.Cells(j, "I").Value
                
                ' Imprime os dados da movimentação (ou faça o que quiser com eles)
                Debug.Print "Fundo: " & nomeFundo & " - CNPJ: " & cnpjFundo
                Debug.Print "Data da Movimentação: " & dataMovimentacao
                Debug.Print "Transação: " & transacao
                Debug.Print "Quantidade de Cotas: " & quantidadeCotas
                Debug.Print "Valor da Cota R$: " & valorCota
                Debug.Print "Valor Bruto R$: " & valorBruto
                Debug.Print "IR R$: " & ir
                Debug.Print "IOF R$: " & iof
                Debug.Print "Valor Líquido R$: " & valorLiquido
            Next j
            
            ' Atualiza o contador i para a próxima linha após a movimentação do fundo
            i = lastRow
        End If
    Next i
End Sub
