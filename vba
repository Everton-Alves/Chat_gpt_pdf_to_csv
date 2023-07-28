Function RemoverZerosEsquerda(ByVal texto As String) As String
    Dim i As Integer
    For i = 1 To Len(texto)
        If Mid(texto, i, 1) <> "0" Then
            Exit For
        End If
    Next i
    RemoverZerosEsquerda = Mid(texto, i)
End Function
