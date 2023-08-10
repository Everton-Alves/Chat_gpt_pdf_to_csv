Sub TransformXMLToColumns()
    Dim xmlFilePath As String
    Dim xmlDoc As Object
    Dim xmlNodeList As Object
    Dim xmlNode As Object
    Dim rowCounter As Long
    Dim colCounter As Long
    
    ' Defina o caminho para o arquivo XML
    xmlFilePath = "C:\Caminho\Para\Seu\Arquivo.xml"
    
    ' Crie um novo objeto XML e carregue o arquivo
    Set xmlDoc = CreateObject("MSXML2.DOMDocument")
    xmlDoc.async = False
    xmlDoc.Load (xmlFilePath)
    
    ' Defina a primeira linha para começar a preencher os dados
    rowCounter = 1
    
    ' Loop através dos elementos desejados no XML (ajuste conforme necessário)
    Set xmlNodeList = xmlDoc.SelectNodes("/root/element")
    For Each xmlNode In xmlNodeList
        colCounter = 1
        ' Loop através dos atributos ou elementos filho do nó atual (ajuste conforme necessário)
        For Each childNode In xmlNode.ChildNodes
            Cells(rowCounter, colCounter).Value = childNode.Text
            colCounter = colCounter + 1
        Next childNode
        rowCounter = rowCounter + 1
    Next xmlNode
End Sub
