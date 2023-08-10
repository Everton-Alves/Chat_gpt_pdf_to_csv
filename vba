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
    Set excelWorksheet = excelWorkbook.Worksheets(1)
    
    ' Loop através dos elementos no XML
    Set xmlNodeList = xmlDoc.SelectNodes("//*")
    
    ' Escreva os títulos das informações do XML como cabeçalhos
    colCounter = 1
    For Each xmlNode In xmlNodeList
        excelWorksheet.Cells(1, colCounter).Value = xmlNode.nodeName
        colCounter = colCounter + 1
    Next xmlNode
    
    ' Preencha os valores das informações do XML
    rowCounter = 2
    For Each xmlNode In xmlNodeList
        colCounter = 1
        For Each childNode In xmlNode.ChildNodes
            excelWorksheet.Cells(rowCounter, colCounter).Value = childNode.Text
            colCounter = colCounter + 1
        Next childNode
        rowCounter = rowCounter + 1
    Next xmlNode
End Sub
