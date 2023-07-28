Sub ExtrairInformacoesDoNomeDoArquivo()
    Dim fileNamePattern As String
    Dim regex As Object
    Dim matches As Object
    Dim accountNumber As String
    Dim fileDate As String
    
    ' Padrão de nome do arquivo com regex
    fileNamePattern = "MR_Cliente_([0-9-]+)_(\d{4}\d{2}\d{2})"
    
    ' Criar um objeto de expressão regular
    Set regex = CreateObject("VBScript.RegExp")
    With regex
        .Global = True
        .MultiLine = True
        .IgnoreCase = False
        .Pattern = fileNamePattern
    End With
    
    ' Nome do arquivo para testar
    Dim fileName As String
    fileName = "MR_Cliente_12345-6_20230630"
    
    ' Procurar por correspondências usando a expressão regular
    Set matches = regex.Execute(fileName)
    
    ' Verificar se houve correspondências
    If matches.Count > 0 Then
        ' O número da conta corrente estará na primeira captura (grupo 1)
        accountNumber = matches(0).SubMatches(0)
        
        ' A data do arquivo estará na segunda captura (grupo 2)
        fileDate = matches(0).SubMatches(1)
        
        ' Exibir os resultados
        MsgBox "Número da conta corrente: " & accountNumber & vbCrLf & "Data do arquivo: " & fileDate
    Else
        MsgBox "Padrão de nome de arquivo inválido."
    End If
End Sub
