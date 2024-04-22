Function TextoApósUltimoEspaco(texto As String) As String
    Dim posEspaco As Long
    
    posEspaco = InStrRev(texto, " ")
    
    If posEspaco > 0 Then
        TextoApósUltimoEspaco = Mid(texto, posEspaco + 1)
    Else
        TextoApósUltimoEspaco = texto
    End If
End Function
