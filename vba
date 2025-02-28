Sub SalvarECopiarEExcluir()
    Dim wbOriginal As Workbook
    Dim wbNovo As Workbook
    Dim caminhoOriginal As String
    Dim caminhoNovo As String
    Dim sheetsExcluir As Variant
    Dim i As Integer
    
    ' Referência ao workbook original
    Set wbOriginal = ThisWorkbook
    caminhoOriginal = wbOriginal.FullName
    
    ' Salvar uma cópia em .xlsx
    caminhoNovo = Replace(caminhoOriginal, ".xlsm", "_Copia.xlsx")
    wbOriginal.SaveCopyAs caminhoNovo
    
    ' Abrir o arquivo copiado
    Set wbNovo = Workbooks.Open(caminhoNovo)
    
    ' Definir as planilhas a serem excluídas
    sheetsExcluir = Array("Planilha1", "Planilha2") ' Adicione os nomes das planilhas que você quer excluir
    
    ' Excluir as planilhas especificadas
    For i = LBound(sheetsExcluir) To UBound(sheetsExcluir)
        On Error Resume Next ' Caso a planilha não exista, ignorar o erro
        wbNovo.Sheets(sheetsExcluir(i)).Delete
        On Error GoTo 0 ' Restaurar o tratamento de erro padrão
    Next i
    
    ' Salvar o arquivo como .xlsm
    caminhoNovo = Replace(caminhoNovo, ".xlsx", ".xlsm")
    wbNovo.SaveAs caminhoNovo, FileFormat:=xlOpenXMLWorkbookMacroEnabled
    
    ' Fechar o arquivo
    wbNovo.Close SaveChanges:=False
    
    MsgBox "Cópia salva como .xlsm com as planilhas excluídas!"
End Sub
