Function CopiarDadosDeOutraPlanilha(caminhoDaPlanilha As String, nomeDaPlanilha As String)
    Dim wbDestino As Workbook
    Dim wbOrigem As Workbook
    Dim wsOrigem As Worksheet
    Dim wsDestino As Worksheet
    Dim ultimaLinhaDestino As Long
    
    ' Abrir a planilha destino
    Set wbDestino = ThisWorkbook
    Set wsDestino = wbDestino.Sheets(nomeDaPlanilha)
    ultimaLinhaDestino = wsDestino.Cells(wsDestino.Rows.Count, 1).End(xlUp).Row + 1 ' Próxima linha vazia na planilha destino
    
    ' Abrir a planilha de origem
    Set wbOrigem = Workbooks.Open(caminhoDaPlanilha)
    Set wsOrigem = wbOrigem.Sheets(1) ' Pode ser alterado para o nome da planilha de origem
    
    ' Copiar os dados da planilha de origem
    wsOrigem.UsedRange.Copy
    
    ' Colar os dados na planilha destino
    wsDestino.Cells(ultimaLinhaDestino, 1).PasteSpecial Paste:=xlPasteValues
    
    ' Fechar a planilha de origem sem salvar
    wbOrigem.Close SaveChanges:=False
End Function
