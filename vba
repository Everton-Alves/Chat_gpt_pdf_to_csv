Sub ExtrairPartes()
    Dim regex As Object
    Dim matches As Object
    Dim inputString As String
    Dim pattern As String
    Dim i As Integer
    
    ' Defina a string de entrada
    inputString = "462159-ADVM - AS 65 36309-9 - 29.02.2024"
    
    ' Crie um objeto RegExp
    Set regex = CreateObject("VBScript.RegExp")
    
    ' Defina o padrão regex para encontrar as partes desejadas
    pattern = "\b[A-Za-z]+\s+\d+(?:\s*-\s*\d+)?|\b\d+-\d+|\b\d{2}\.\d{2}\.\d{4}"
    
    ' Configure o padrão regex
    With regex
        .Global = True
        .MultiLine = True
        .IgnoreCase = True
        .pattern = pattern
    End With
    
    ' Execute a correspondência na string de entrada
    Set matches = regex.Execute(inputString)
    
    ' Exiba as partes extraídas
    For Each Match In matches
        MsgBox Match.Value
    Next Match
End Sub
