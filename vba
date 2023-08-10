Sub XMLToExcelWithHeaders()
    Dim xmlFilePath As String
    Dim xmlDoc As Object
    Dim xmlNodeList As Object
    Dim xmlNode As Object
    Dim excelApp As Object
    Dim excelWorkbook As Object
    Dim excelWorksheet As Object
    Dim rowCounter As Long
    Dim colCounter As Long
    
    ' Defina o caminho para o arquivo XML
    xmlFilePath = "C:\Caminho\Para\Seu\Arquivo.xml"
    
    ' Crie um novo objeto XML e carregue o arquivo
    Set xmlDoc = CreateObject("MSXML2.DOMDocument")
    xmlDoc.async = False
    xmlDoc.Load (xmlFilePath)
    
    ' Crie uma instância do Excel
    Set excelApp = CreateObject("Excel.Application")
    excelApp.Visible = True
    
    ' Crie um novo arquivo Excel
    Set excelWorkbook = excelApp.Workbooks.Add
    
    ' Crie uma planilha
    Set excelWorksheet = excelWorkbook.Worksheets.Add
    
    ' Inicialize contadores
    rowCounter = 1
    colCounter = 1
    
    ' Loop através dos elementos no XML
    Set xmlNodeList = xmlDoc.SelectNodes("//*")
    For Each xmlNode In xmlNodeList
        ' Escreva o título da informação do XML
        excelWorksheet.Cells(rowCounter, colCounter).Value = xmlNode.nodeName
        
        ' Escreva o valor da informação do XML
        colCounter = colCounter + 1
        excelWorksheet.Cells(rowCounter, colCounter).Value = xmlNode.Text
        
        rowCounter = rowCounter + 1
        colCounter = 1
    Next xmlNode
End Sub
