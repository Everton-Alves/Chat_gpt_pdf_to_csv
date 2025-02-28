
Sub SaveAsXLSXandThenXLSM()
    Dim wb As Workbook
    Dim filePath As String
    Dim xlsxFilePath As String
    Dim xlsmFilePath As String

    ' Caminho do arquivo original
    filePath = "C:\Caminho\Para\ArquivoOriginal.xlsx"
    
    ' Caminho para o novo arquivo .xlsx (salvo como uma cópia)
    xlsxFilePath = "C:\Caminho\Para\ArquivoSalvo.xlsx"
    
    ' Caminho para o novo arquivo .xlsm
    xlsmFilePath = "C:\Caminho\Para\ArquivoFinal.xlsm"
    
    ' Definir a pasta de trabalho ativa
    Set wb = ActiveWorkbook
    
    ' Salvar o arquivo no formato .xlsx (sem macros)
    wb.SaveAs Filename:=xlsxFilePath, FileFormat:=xlOpenXMLWorkbook
    
    ' Fechar o arquivo .xlsx (sem macros)
    wb.Close SaveChanges:=False
    
    ' Reabrir o arquivo .xlsx
    Set wb = Workbooks.Open(Filename:=xlsxFilePath)
    
    ' Salvar como .xlsm (com macros habilitadas)
    wb.SaveAs Filename:=xlsmFilePath, FileFormat:=xlOpenXMLWorkbookMacroEnabled
    
    ' Fechar o arquivo .xlsm
    wb.Close SaveChanges:=False
    
    MsgBox "Arquivo salvo como .xlsx e depois convertido para .xlsm com sucesso!"
End Sub
