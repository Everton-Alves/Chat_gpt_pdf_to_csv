Function NumeroParaLetra(ByVal numero As Integer) As String
    NumeroParaLetra = Split(Cells(1, numero).Address, "$")(1)
End Function
