Sub ExtrairEArmazenarMovimentacoesFundosComDicionario()
    Dim ws As Worksheet
    Dim wsMovimentacoes As Worksheet
    Dim lastRow As Long, i As Long
    Dim nomeFundo As String, cnpjFundo As String
    Dim movimentacoes As Object
    Dim movimentacao As Object
    Dim newRow As Long
    
    ' Defina a planilha onde estão os dados
    Set ws = ThisWorkbook.Sheets("fundos")
    
    ' Crie uma nova aba para armazenar as movimentações dos fundos
    Set wsMovimentacoes = ThisWorkbook.Sheets.Add(After:=Sheets(Sheets.Count))
    wsMovimentacoes.Name = "fundos_movimentacao_total"
    
    ' Inicialize o dicionário para armazenar as movimentações dos fundos
    Set movimentacoes = CreateObject("Scripting.Dictionary")
    
    ' Encontre a última linha na coluna A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Loop através das células na coluna A
    For i = 1 To lastRow
        If Left(ws.Cells(i, 1).Value, 12) = "Movimentação" Then
            ' Encontrou uma linha de movimentação do fundo
            
            ' Extrai o nome do fundo e CNPJ
            nomeFundo = Trim(Mid(ws.Cells(i, 1).Value, 15, InStr(ws.Cells(i, 1).Value, "-") - 15))
            cnpjFundo = Trim(Mid(ws.Cells(i, 1).Value, InStr(ws.Cells(i, 1).Value, "-") + 1))
            
            ' Crie um novo dicionário para armazenar as movimentações deste fundo
            Set movimentacao = CreateObject("Scripting.Dictionary")
            
            ' Inicialize a linha atual para a próxima movimentação
            i = i + 1
            
            ' Loop até encontrar a próxima linha vazia ou uma nova movimentação
            Do While ws.Cells(i, "B").Value <> "" And Left(ws.Cells(i, 1).Value, 12) <> "Movimentação"
                ' Adicione os detalhes desta movimentação ao dicionário de movimentações
                movimentacao.Add i, Array(ws.Cells(i, "B").Value, ws.Cells(i, "C").Value, ws.Cells(i, "D").Value, ws.Cells(i, "E").Value, ws.Cells(i, "F").Value, ws.Cells(i, "G").Value, ws.Cells(i, "H").Value, ws.Cells(i, "I").Value)
                
                ' Avance para a próxima linha
                i = i + 1
            Loop
            
            ' Adicione o dicionário de movimentações ao dicionário principal, usando o nome do fundo como chave
            movimentacoes.Add nomeFundo, movimentacao
        End If
    Next i
    
    ' Escreva os cabeçalhos na nova aba
    wsMovimentacoes.Range("A1").Value = "Fundo"
    wsMovimentacoes.Range("B1").Value = "CNPJ"
    wsMovimentacoes.Range("C1").Value = "Data"
    wsMovimentacoes.Range("D1").Value = "Transacao"
    wsMovimentacoes.Range("E1").Value = "QuantidadeCotas"
    wsMovimentacoes.Range("F1").Value = "ValorCota"
    wsMovimentacoes.Range("G1").Value = "ValorBruto"
    wsMovimentacoes.Range("H1").Value = "IR"
    wsMovimentacoes.Range("I1").Value = "IOF"
    wsMovimentacoes.Range("J1").Value = "ValorLiquido"
    
    ' Inicialize a linha atual na nova aba
    newRow = 2
    
    ' Loop através do dicionário de movimentações
    For Each nomeFundo In movimentacoes.keys
        ' Obtenha o dicionário de movimentações deste fundo
        Set movimentacao = movimentacoes(nomeFundo)
        
        ' Loop através das movimentações deste fundo
        For i = 0 To movimentacao.Count - 1
            ' Escreva os detalhes desta movimentação na nova aba
            wsMovimentacoes.Cells(newRow, "A").Value = nomeFundo
            wsMovimentacoes.Cells(newRow, "B").Value = cnpjFundo
            wsMovimentacoes.Cells(newRow, "C").Value = movimentacao(i)(0)
            wsMovimentacoes.Cells(newRow, "D").Value = movimentacao(i)(1)
            wsMovimentacoes.Cells(newRow, "E").Value = movimentacao(i)(2)
            wsMovimentacoes.Cells(newRow, "F").Value = movimentacao(i)(3)
            wsMovimentacoes.Cells(newRow, "G").Value = movimentacao(i)(4)
            wsMovimentacoes.Cells(newRow, "H").Value = movimentacao(i)(5)
            wsMovimentacoes.Cells(newRow, "I").Value = movimentacao(i)(6)
            wsMovimentacoes.Cells(newRow, "J").Value = movimentacao(i)(7)
            
            ' Avance para a próxima linha na nova aba
            newRow = newRow + 1
        Next i
    Next nomeFundo
End Sub
