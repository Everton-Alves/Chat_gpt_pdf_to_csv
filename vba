Sub XMLToExcel()
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
    
    ' Crie uma nova instância do Excel
    Set excelApp = CreateObject("Excel.Application")
    excelApp.Visible = True
    
    ' Adicione um novo livro de trabalho e planilha
    Set excelWorkbook = excelApp.Workbooks.Add
    Set excelWorksheet = excelWorkbook.Worksheets(1)
    
    ' Defina a primeira linha para começar a preencher os dados
    rowCounter = 1
    
    ' Loop através dos elementos desejados no XML
    Set xmlNodeList = xmlDoc.SelectNodes("//*") ' Seleciona todos os elementos no XML
    For Each xmlNode In xmlNodeList
        colCounter = 1
        ' Loop através dos atributos ou elementos filho do nó atual
        For Each childNode In xmlNode.ChildNodes
            excelWorksheet.Cells(rowCounter, colCounter).Value = childNode.Text
            colCounter = colCounter + 1
        Next childNode
        rowCounter = rowCounter + 1
    Next xmlNode
End Sub
