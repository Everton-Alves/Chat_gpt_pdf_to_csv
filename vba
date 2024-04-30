Sub Teste()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets("Planilha1")
    
    Dim codigosComRange() As CodigoComRange
    codigosComRange = ObterCodigosComRange(ws)
    
    Dim i As Long
    For i = LBound(codigosComRange) To UBound(codigosComRange)
        If Not codigosComRange(i) Is Nothing Then
            Debug.Print "Código: " & codigosComRange(i).Codigo
            Debug.Print "Range: " & codigosComRange(i).Range.Address
            Debug.Print
        End If
    Next i
End Sub
