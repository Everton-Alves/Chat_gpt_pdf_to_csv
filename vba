Sub ManipularDados()

    ' Declarar variáveis
    Dim wbOrigem As Workbook
    Dim wsOrigem As Worksheet
    Dim rngFiltrado As Range
    Dim rngCopiar As Range
    Dim wbDestino As Workbook
    Dim wsDestino As Worksheet
    Dim i As Long
    
    ' Abrir arquivo Excel de origem
    Set wbOrigem = Workbooks.Open("Caminho_do_Arquivo_de_Origem.xlsx")
    Set wsOrigem = wbOrigem.Sheets("Nome_da_Aba_de_Origem")
    
    ' Filtrar dados na coluna G
    wsOrigem.AutoFilterMode = False
    wsOrigem.Range("G1").AutoFilter Field:=7, Criteria1:="Critério_de_Filtro"
    Set rngFiltrado = wsOrigem.AutoFilter.Range
    
    ' Copiar dados filtrados
    rngFiltrado.Copy
    
    ' Abrir novo arquivo Excel de destino e colar dados
    Set wbDestino = Workbooks.Add
    Set wsDestino = wbDestino.Sheets(1)
    wsDestino.Range("A1").PasteSpecial Paste:=xlPasteValues
    
    ' Excluir colunas A, B, C e E
    wsDestino.Columns("A:C").Delete
    wsDestino.Columns("E").Delete
    
    ' Incluir duas novas colunas B e C
    wsDestino.Columns("B:C").Insert Shift:=xlToRight
    
    ' Separar texto na coluna A por "-"
    wsDestino.Columns("A").TextToColumns Destination:=Range("A1"), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
        Semicolon:=False, Comma:=False, Space:=False, Other:=True, OtherChar:="-", _
        FieldInfo:=Array(Array(1, 1), Array(2, 1))
    
    ' Separar espaço na coluna B por nada
    wsDestino.Columns("B").Replace What:=" ", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    
    ' Colocar nome dos fundos na coluna B
    
    ' Colocar nome Sigla na coluna E
    
    ' VLOOKUP na coluna G com a aba "de para"
    
    ' Colocar nome na coluna F para ATIVO
    wsDestino.Columns("F").Value = "ATIVO"
    
    ' Ordenar coluna F em ordem alfabética
    wsDestino.Columns("F").Sort key1:=Range("F1"), order1:=xlAscending, Header:=xlYes
    
    ' Ordenar coluna B em ordem alfabética
    wsDestino.Columns("B").Sort key1:=Range("B1"), order1:=xlAscending, Header:=xlYes
    
    ' Inserir tabela dinâmica em nova aba
    Dim wsPivot As Worksheet
    Set wsPivot = wbDestino.Sheets.Add(After:=wbDestino.Sheets(wbDestino.Sheets.Count))
    wsPivot.Name = "Tabela Dinâmica"
    Dim tblPivot As PivotTable
    Dim tblPivotRange As Range
    Set tblPivotRange = wsDestino.Range("A1").CurrentRegion
    Set tblPivot = wsPivot.PivotTableWizard(SourceType:=xlDatabase, SourceData:=tblPivotRange)
    
    ' Transformar coluna C da tabela dinâmica em valor
    tblPivot.PivotFields("Nome_da_Coluna_C").Orientation = xlDataField
    tblPivot.PivotFields("Nome_da_Coluna_C").Function = xlSum
    
    ' Fechar arquivo de origem sem salvar alterações
    wbOrigem.Close SaveChanges:=False
    
End Sub
