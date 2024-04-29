Sub ObterPrimeiraLinhaDoRange(rng As Range)
    Dim primeiraLinha As Range
    
    ' Obtenha a primeira linha do range
    Set primeiraLinha = rng.Resize(1).Offset(-1)
    
    ' Agora "primeiraLinha" contém o range da primeira linha do range original
    ' Você pode fazer o que quiser com esse range
    
    ' Exemplo: Imprimir a primeira linha na janela de imediato
    primeiraLinha.Select
End Sub
