Sub InserirInformacoes(ByVal informacao1 As String, ByVal informacao2 As String)
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim ultimaLinha As Long
    Dim i As Long
    Dim informacaoExiste As Boolean
    
    ' Verifica se o arquivo "planilha.xlsx" está aberto
    On Error Resume Next
    Set wb = Workbooks("planilha.xlsx")
    On Error GoTo 0
    
    ' Se o arquivo não estiver aberto, abre-o
    If wb Is Nothing Then
        Set wb = Workbooks.Open("Caminho\para\o\arquivo\planilha.xlsx")
    End If
    
    ' Define a planilha onde serão inseridas as informações
    Set ws = wb.Sheets("Extratos_renomeados")
    
    ' Determina a última linha preenchida na coluna A
    ultimaLinha = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Verifica se a informação já existe na coluna A
    informacaoExiste = False
    For i = 1 To ultimaLinha
        If ws.Cells(i, 1).Value = informacao1 Then
            informacaoExiste = True
            Exit For
        End If
    Next i
    
    ' Se a informação não existe, insere as informações nas colunas A e B
    If Not informacaoExiste Then
        ws.Cells(ultimaLinha + 1, 1).Value = informacao1
        ws.Cells(ultimaLinha + 1, 2).Value = informacao2
    End If
    
    ' Salva e fecha o arquivo
    wb.Save
    wb.Close
    
    MsgBox "Informações inseridas com sucesso!", vbInformation
End Sub
