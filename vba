Sub XMLToExcel()
    Dim xmlFilePath As String
    Dim xmlDoc As Object
    Dim xmlNodeList As Object
    Dim xmlNode As Object
    Dim excelApp As Object
    Dim excelWorkbook As Object
    Dim excelWorksheet As Object
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
    
    ' Crie um novo livro no Excel
    Set excelWorkbook = excelApp.Workbooks.Add
    Set excelWorksheet = excelWorkbook.Sheets(1)
    
    ' Defina o cabeçalho das colunas baseado nas tags do XML
    colCounter = 1
    For Each xmlNode In xmlDoc.SelectNodes("/root/element[1]/*") ' Substitua pelo caminho correto
        excelWorksheet.Cells(1, colCounter).Value = xmlNode.nodeName
        colCounter = colCounter + 1
    Next xmlNode
    
    ' Preencha os dados nas colunas
    Set xmlNodeList = xmlDoc.SelectNodes("/root/element") ' Substitua pelo caminho correto
    For rowCounter = 2 To xmlNodeList.Length + 1
        colCounter = 1
        For Each xmlNode In xmlNodeList(rowCounter - 1).ChildNodes
            excelWorksheet.Cells(rowCounter, colCounter).Value = xmlNode.Text
            colCounter = colCounter + 1
        Next xmlNode
    Next rowCounter
    
    ' Salve o arquivo Excel
    excelWorkbook.SaveAs "C:\Caminho\Para\Novo\Arquivo.xlsx"
    
    ' Feche o objeto XML e o Excel
    Set xmlDoc = Nothing
    excelWorkbook.Close
    excelApp.Quit
    Set excelApp = Nothing
End Sub
