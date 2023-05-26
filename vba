Sub InserirHifen()
    Dim cel As Range
    Dim str As String
    Dim penultimo As String
    
    ' Defina a célula de destino onde está a string
    Set cel = Range("A1") ' Altere para a célula desejada
    
    ' Obtenha o valor da célula como uma string
    str = CStr(cel.Value)
    
    ' Verifique se a string tem pelo menos dois caracteres
    If Len(str) >= 2 Then
        ' Obtenha o penúltimo número da string
        penultimo = Mid(str, Len(str) - 1, 1)
        
        ' Insira o hífen antes do penúltimo número
        cel.Value = Left(str, Len(str) - 2) & "-" & penultimo & Right(str, 1)
    End If
End Sub
