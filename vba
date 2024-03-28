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
    pattern = "(\b[A-Za-z]+\s*\d+\b)|(\b\d+-\d+\b)|(\b\d{2}\.\d{2}\.\d{4}\b)"
    
    ' Configure o padrão regex
    With regex
        .Global = True
        .MultiLine = True
        .IgnoreCase = True
        .Pattern = pattern
    End With
    
    ' Execute a correspondência na string de entrada
    Set matches = regex.Execute(inputString)
    
    ' Exiba as partes extraídas
    For Each Match In matches
        For i = 0 To Match.SubMatches.Count - 1
            If Match.SubMatches(i) <> "" Then
                MsgBox "Parte " & i + 1 & ": " & Match.SubMatches(i)
            End If
        Next i
    Next Match
End Sub
