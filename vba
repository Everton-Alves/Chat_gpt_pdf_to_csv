Sub ProcessarDados()
    Dim ws As Worksheet
    Dim LastRow As Long
    Dim U_Array() As Variant
    Dim V_Array() As Variant
    Dim X_Array() As Variant
    Dim i As Long
    
    ' Defina a planilha na qual você deseja trabalhar
    Set ws = ThisWorkbook.Sheets("NomeDaSuaPlanilha")
    
    ' Encontre a última linha com dados na coluna U
    LastRow = ws.Cells(ws.Rows.Count, "U").End(xlUp).Row
    
    ' Redimensione os arrays com base na última linha
    ReDim U_Array(1 To LastRow)
    ReDim V_Array(1 To LastRow)
    ReDim X_Array(1 To LastRow)
    
    ' Preencha os arrays com os valores das colunas U, V e X
    For i = 1 To LastRow
        U_Array(i) = ws.Cells(i, "U").Value
        V_Array(i) = ws.Cells(i, "V").Value
        X_Array(i) = ws.Cells(i, "X").Value
    Next i
    
    ' Aplicar regras aos valores de X com base em V
    For i = 1 To LastRow
        If V_Array(i) = "Aplicação" Then
            X_Array(i) = Abs(X_Array(i)) ' Torna X positivo
        Else
            X_Array(i) = -Abs(X_Array(i)) ' Torna X negativo
        End If
    Next i
    
    ' Ordenar os vetores com base nos valores de U
    Call BubbleSort(U_Array, V_Array, X_Array, LastRow)
    
    ' Retornar os valores de U, V e X após ordenação
    For i = 1 To LastRow
        ws.Cells(i, "U").Value = U_Array(i)
        ws.Cells(i, "V").Value = V_Array(i)
        ws.Cells(i, "X").Value = X_Array(i)
    Next i
End Sub

Sub BubbleSort(U() As Variant, V() As Variant, X() As Variant, LastRow As Long)
    Dim i As Long, j As Long
    Dim tempU As Variant, tempV As Variant, tempX As Variant
    
    For i = 1 To LastRow - 1
        For j = i + 1 To LastRow
            If U(i) > U(j) Then
                ' Troca os valores nos arrays
                tempU = U(i)
                tempV = V(i)
                tempX = X(i)
                U(i) = U(j)
                V(i) = V(j)
                X(i) = X(j)
                U(j) = tempU
                V(j) = tempV
                X(j) = tempX
            End If
        Next j
    Next i
End Sub
