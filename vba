    ' Ajustar os botões de macro da planilha copiada
    Dim shp As Shape
    Dim nomeMacro As String
    
    With wbNovo.Sheets("vencimentos")
        For Each shp In .Shapes
            If shp.Type = msoFormControl Then
                If shp.FormControlType = xlButtonControl Then
                    nomeMacro = shp.OnAction
                    ' Ajusta para que a macro seja local ao novo arquivo
                    If InStr(1, nomeMacro, "!") > 0 Then
                        nomeMacro = Split(nomeMacro, "!")(1)
                    End If
                    shp.OnAction = "'" & wbNovo.Name & "'!" & nomeMacro
                End If
            End If
        Next shp
    End With
