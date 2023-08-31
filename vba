Sub ExtractCPFandCNPJ()
    Dim regex As Object
    Set regex = CreateObject("VBScript.RegExp")
    
    ' Padrão de CPF (11 dígitos numéricos)
    regex.Pattern = "cpf_(\d{11})"
    
    ' Substitua o caminho e nome do arquivo pelo seu arquivo real
    Dim fileName As String
    fileName = "posição consolidada de renda fixa - abertura mensal_cpf_012345678900"
    
    Dim matches As Object
    Dim match As Object
    
    If regex.Test(fileName) Then
        Set matches = regex.Execute(fileName)
        For Each match In matches
            Debug.Print "CPF: " & match.SubMatches(0)
        Next match
    End If
    
    ' Padrão de CNPJ (14 dígitos numéricos)
    regex.Pattern = "cnpj_(\d{14})"
    
    If regex.Test(fileName) Then
        Set matches = regex.Execute(fileName)
        For Each match In matches
            Debug.Print "CNPJ: " & match.SubMatches(0)
        Next match
    End If
End Sub
