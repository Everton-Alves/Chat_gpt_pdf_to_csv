Sub CopiarPlanilhaEModulos()

    Dim wbOrigem As Workbook
    Dim wbNovo As Workbook
    Dim caminhoTemp As String
    Dim fs As Object
    Dim vbComp As Object
    
    Set wbOrigem = ThisWorkbook
    
    ' Copiar a planilha "vencimentos" para um novo workbook
    wbOrigem.Sheets("vencimentos").Copy
    Set wbNovo = ActiveWorkbook
    
    ' Renomear a aba no novo arquivo
    wbNovo.Sheets(1).Name = "vencimentos"
    
    ' Salvar como .xlsm
    caminhoTemp = wbOrigem.Path & "\ArquivoVencimentos_" & Format(Now, "yyyymmdd_hhnnss") & ".xlsm"
    Application.DisplayAlerts = False
    wbNovo.SaveAs Filename:=caminhoTemp, FileFormat:=xlOpenXMLWorkbookMacroEnabled
    Application.DisplayAlerts = True

    ' Copiar os módulos para o novo arquivo
    With wbNovo.VBProject.VBComponents
        ' Exportar e importar o módulo "email"
        wbOrigem.VBProject.VBComponents("email").Export wbOrigem.Path & "\email.bas"
        .Import wbOrigem.Path & "\email.bas"
        
        ' Exportar e importar o módulo "emailFunctions"
        wbOrigem.VBProject.VBComponents("emailFunctions").Export wbOrigem.Path & "\emailFunctions.bas"
        .Import wbOrigem.Path & "\emailFunctions.bas"
    End With
    
    ' Excluir arquivos temporários
    Set fs = CreateObject("Scripting.FileSystemObject")
    If fs.FileExists(wbOrigem.Path & "\email.bas") Then fs.DeleteFile wbOrigem.Path & "\email.bas"
    If fs.FileExists(wbOrigem.Path & "\emailFunctions.bas") Then fs.DeleteFile wbOrigem.Path & "\emailFunctions.bas"

    MsgBox "Novo arquivo criado em: " & caminhoTemp, vbInformation

End Sub
