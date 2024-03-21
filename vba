Sub ExtrairEArmazenarMovimentacoesFundosComDicionario()
    Dim ws As Worksheet
    Dim wsMovimentacoes As Worksheet
    Dim lastRow As Long, i As Long
    Dim nomeFundo As String, cnpjFundo As String
    Dim movimentacoes As Object
    Dim movimentacao As Object
    
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
                ' Crie um novo dicionário para armazenar os detalhes desta movimentação
                Dim detalhesMovimentacao As Object
                Set detalhesMovimentacao = CreateObject("Scripting.Dictionary")
                
                ' Armazene os detalhes desta movimentação no dicionário de detalhes
                detalhesMovimentacao("Data") = ws.Cells(i, "B").Value
                detalhesMovimentacao("Transacao") = ws.Cells(i, "C").Value
                detalhesMovimentacao("QuantidadeCotas") = ws.Cells(i, "D").Value
                detalhesMovimentacao("ValorCota") = ws.Cells(i, "E").Value
                detalhesMovimentacao("ValorBruto") = ws.Cells(i, "F").Value
                detalhesMovimentacao("IR") = ws.Cells(i, "G").Value
                detalhesMovimentacao("IOF") = ws.Cells(i, "H").Value
                detalhesMovimentacao("ValorLiquido") = ws.Cells(i, "I").Value
                
                ' Adicione este dicionário de detalhes à lista de movimentações deste fundo
                movimentacao.Add i, detalhesMovimentacao
                
                ' Avance para a próxima linha
                i = i + 1
            Loop
            
            ' Adicione este dicionário de movimentações ao dicionário principal, usando o nome do fundo como chave
            movimentacoes.Add nomeFundo, movimentacao
        End If
    Next i
    
    ' Agora, vamos transferir os dados do dicionário para a nova aba
    
    ' Escreva os cabeçalhos
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
        Set movimentacao = movimentacoes(nomeFundo)
        
        ' Loop através das movimentações deste fundo
        For Each key In movimentacao.keys
            Set detalhesMovimentacao = movimentacao(key)
            
            ' Escreva os detalhes desta movimentação na nova aba
            wsMovimentacoes.Cells(newRow, "A").Value = nomeFundo
            wsMovimentacoes.Cells(newRow, "B").Value = cnpjFundo
            wsMovimentacoes.Cells(newRow, "C").Value = detalhesMovimentacao("Data")
            wsMovimentacoes.Cells(newRow, "D").Value = detalhesMovimentacao("Transacao")
            wsMovimentacoes.Cells(newRow, "E").Value = detalhesMovimentacao("QuantidadeCotas")
            wsMovimentacoes.Cells(newRow, "F").Value = detalhesMovimentacao("ValorCota")
            wsMovimentacoes.Cells(newRow, "G").Value = detalhesMovimentacao("ValorBruto")
            wsMovimentacoes.Cells(newRow, "H").Value = detalhesMovimentacao("IR")
            wsMovimentacoes.Cells(newRow, "I").Value = detalhesMovimentacao("IOF")
            wsMovimentacoes.Cells(newRow, "J").Value = detalhesMovimentacao("Valor
