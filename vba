Sub VerificarIgualdade()

Dim nLinhas As Integer
Dim i As Integer

' Defina o número de linhas a verificar
nLinhas = 10

' Verifique se as células das colunas "B", "D", "E" e "G" possuem o mesmo valor em cada linha
For i = 1 To nLinhas
    If Cells(i, "B").Value = Cells(i, "D").Value And _
       Cells(i, "D").Value = Cells(i, "E").Value And _
       Cells(i, "E").Value = Cells(i, "G").Value Then
        Debug.Print "As células das colunas B, D, E e G da linha " & i & " possuem o mesmo valor."
    End If
Next i

End Sub
