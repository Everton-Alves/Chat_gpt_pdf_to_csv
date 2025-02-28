Sub SaveWorkbookCopy()

    Dim filePath As String
    Dim fileName As String
    Dim saveDirectory As String
    
    ' Defina o diretório onde o arquivo será salvo
    saveDirectory = "C:\Caminho\Para\Seu\Diretorio\"  ' Altere para o diretório desejado
    
    ' Defina o nome do arquivo
    fileName = "Copia_Macro_" & Format(Now, "yyyymmdd_hhnnss") & ".xlsx"  ' Nome com timestamp
    
    ' Combine diretório e nome do arquivo
    filePath = saveDirectory & fileName
    
    ' Salve o arquivo como .xlsx
    ThisWorkbook.SaveAs filePath, FileFormat:=xlOpenXMLWorkbook
    
    MsgBox "Arquivo salvo com sucesso em " & filePath

End Sub
