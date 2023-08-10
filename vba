Sub ReadXMLtoExcel()
    Dim xmlFilePath As String
    Dim xmlDoc As Object
    Dim xmlNodeList As Object
    Dim xmlNode As Object
    Dim ws As Worksheet
    Dim rowCounter As Long
    Dim colCounter As Long
    
    ' Defina o caminho para o arquivo XML
    xmlFilePath = "C:\Caminho\Para\Seu\Arquivo.xml"
    
    ' Crie um novo objeto XML e carregue o arquivo
    Set xmlDoc = CreateObject("MSXML2.DOMDocument")
    xmlDoc.async = False
    xmlDoc.Load (xmlFilePath)
    
    ' Loop através de cada elemento raiz no XML (cada tabela)
    For Each xmlNode In xmlDoc.ChildNodes
        ' Crie uma nova planilha para a tabela
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = xmlNode.nodeName
        
        ' Defina o contador de colunas para a primeira coluna
        colCounter = 1
        
        ' Loop através dos elementos filhos do nó atual (tags)
        For Each childNode In xmlNode.ChildNodes
            ' Preencha o cabeçalho da coluna com o nome da tag
            ws.Cells(1, colCounter).Value = childNode.nodeName
            
            ' Preencha os valores abaixo da coluna
            rowCounter = 2
            For Each valueNode In childNode.ChildNodes
                ws.Cells(rowCounter, colCounter).Value = valueNode.Text
                rowCounter = rowCounter + 1
            Next valueNode
            
            ' Avance para a próxima coluna
            colCounter = colCounter + 1
        Next childNode
    Next xmlNode
End Sub
