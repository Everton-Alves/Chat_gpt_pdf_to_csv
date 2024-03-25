Function ExtrairTextoDepoisDaBarra(texto As String) As String
    Dim posicao_barra As Integer
    Dim texto_extrair As String
    
    ' Encontrar a posição da última barra "/"
    posicao_barra = InStrRev(texto, "/")
    
    ' Verificar se a barra foi encontrada
    If posicao_barra > 0 Then
        ' Extrair o texto após a barra
        texto_extrair = Mid(texto, posicao_barra + 1)
        
        ' Remover espaços em branco nos lados
        texto_extrair = Trim(texto_extrair)
        
        ' Retornar o texto extraído
        ExtrairTextoDepoisDaBarra = texto_extrair
    Else
        ' Se não houver barra, retornar uma string vazia
        ExtrairTextoDepoisDaBarra = ""
    End If
End Function
