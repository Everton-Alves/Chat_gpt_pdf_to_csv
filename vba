Sub RemoverValoresNulos()
    Dim MeuVetor() As Variant
    Dim NovoVetor() As Variant
    Dim i As Long
    Dim j As Long
    
    ' Preencha o vetor com alguns valores, incluindo nulos
    MeuVetor = Array(1, 2, Null, 4, Null, 6, 7, Null, 9)
    
    ' Inicialize o novo vetor
    ReDim NovoVetor(1 To UBound(MeuVetor))
    
    ' Loop para copiar os valores não nulos para o novo vetor
    j = 1
    For i = 1 To UBound(MeuVetor)
        If Not IsNull(MeuVetor(i)) Then
            NovoVetor(j) = MeuVetor(i)
            j = j + 1
        End If
    Next i
    
    ' Redimensione o novo vetor para o tamanho correto
    ReDim Preserve NovoVetor(1 To j - 1)
    
    ' Agora, NovoVetor contém os valores do vetor original sem nulos
    
    ' Imprima o novo vetor para verificar
    For i = 1 To UBound(NovoVetor)
        Debug.Print NovoVetor(i)
    Next i
End Sub
