Sub SaveWorkbookCopy()

    Dim filePath As String
    Dim fileName As String
    Dim saveDirectory As String
    Dim copiedWorkbook As Workbook
    
    ' Defina o diretório onde o arquivo será salvo
    saveDirectory = "C:\Caminho\Para\Seu\Diretorio\"  ' Altere para o diretório desejado
    
    ' Defina o nome do arquivo
    fileName = "Copia_Macro_" & Format(Now, "yyyymmdd_hhnnss") & ".xlsx"  ' Nome com timestamp
    
    ' Combine diretório e nome do arquivo
    filePath = saveDirectory & fileName
    
    ' Crie uma cópia do workbook atual
    ThisWorkbook.Copy
    
    ' Defina a cópia como um novo workbook
    Set copiedWorkbook = ActiveWorkbook
    
    ' Salve a cópia como .xlsx
    copiedWorkbook.SaveAs filePath, FileFormat:=xlOpenXMLWorkbook
    
    ' Feche a cópia sem salvar alterações (já foi salva)
    copiedWorkbook.Close SaveChanges:=False
    
    MsgBox "Cópia do arquivo salva com sucesso em " & filePath

End Sub
