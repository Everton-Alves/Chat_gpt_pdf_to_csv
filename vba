Sub OrganizarDadosEmOrdem(nomePlanilha As String, intervalo As String)
    Dim ws As Worksheet
    Dim rng As Range
    
    ' Definir a planilha
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets(nomePlanilha)
    On Error GoTo 0
    
    ' Verificar se a planilha foi encontrada
    If ws Is Nothing Then
        MsgBox "A planilha " & nomePlanilha & " não foi encontrada.", vbExclamation
        Exit Sub
    End If
    
    ' Definir o intervalo a ser organizado
    On Error Resume Next
    Set rng = ws.Range(intervalo)
    On Error GoTo 0
    
    ' Verificar se o intervalo é válido
    If rng Is Nothing Then
        MsgBox "O intervalo " & intervalo & " é inválido.", vbExclamation
        Exit Sub
    End If
    
    ' Organizar o intervalo em ordem crescente
    rng.Sort Key1:=rng.Cells(1, 1), Order1:=xlAscending, Header:=xlNo
    
    ' Informar ao usuário que a organização foi concluída
    MsgBox "Os dados foram organizados em ordem crescente.", vbInformation
End Sub
