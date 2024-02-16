Sub ExtrairInformacoesEmails()

    ' Configurar variáveis
    Dim OutlookApp As Object
    Dim OutlookNamespace As Object
    Dim Folder As Object
    Dim Item As Object
    Dim olMail As Object
    Dim ExcelApp As Object
    Dim ExcelWorkbook As Object
    Dim ExcelWorksheet As Object
    Dim DateRangeStart As Date
    Dim DateRangeEnd As Date
    Dim OutputWorkbook As String
    
    ' Definir o range de datas
    On Error Resume Next
    DateRangeStart = Application.InputBox("Digite a data inicial (DD/MM/AAAA):", Type:=1)
    DateRangeEnd = Application.InputBox("Digite a data final (DD/MM/AAAA):", Type:=1)
    On Error GoTo 0
    
    ' Verificar se o usuário cancelou a operação
    If DateRangeStart = 0 Or DateRangeEnd = 0 Then
        MsgBox "Operação cancelada pelo usuário.", vbExclamation
        Exit Sub
    End If
    
    ' Configurar a aplicação Outlook
    Set OutlookApp = CreateObject("Outlook.Application")
    Set OutlookNamespace = OutlookApp.GetNamespace("MAPI")
    
    ' Selecionar a pasta de e-mails
    Set Folder = OutlookNamespace.PickFolder
    
    ' Verificar se o usuário cancelou a operação
    If Folder Is Nothing Then
        MsgBox "Operação cancelada pelo usuário.", vbExclamation
        Exit Sub
    End If
    
    ' Configurar a aplicação Excel
    Set ExcelApp = CreateObject("Excel.Application")
    ExcelApp.Visible = True
    
    ' Criar um novo workbook
    Set ExcelWorkbook = ExcelApp.Workbooks.Add
    
    ' Adicionar uma nova planilha
    Set ExcelWorksheet = ExcelWorkbook.Sheets(1)
    
    ' Definir cabeçalhos
    ExcelWorksheet.Cells(1, 1).Value = "Data de Envio"
    ExcelWorksheet.Cells(1, 2).Value = "Destinatário"
    ExcelWorksheet.Cells(1, 3).Value = "Cópia"
    ExcelWorksheet.Cells(1, 4).Value = "Nome"
    ExcelWorksheet.Cells(1, 5).Value = "Custodiante"
    ExcelWorksheet.Cells(1, 6).Value = "Agência"
    ExcelWorksheet.Cells(1, 7).Value = "Conta"
    
    ' Loop através dos e-mails na pasta selecionada
    For Each Item In Folder.Items
        If Item.Class = olMail Then
            Set olMail = Item
            If olMail.ReceivedTime >= DateRangeStart And olMail.ReceivedTime <= DateRangeEnd Then
                ' Verificar se o e-mail possui o título desejado
                If InStr(1, olMail.Subject, "Pedido de extrato", vbTextCompare) > 0 Then
                    ' Obter informações do corpo do e-mail
                    Dim body As String
                    body = olMail.Body
                    
                    ' Extrair informações usando padrões específicos
                    Dim nome As String
                    Dim custodiante As String
                    Dim agencia As String
                    Dim conta As String
                    
                    nome = ExtrairInformacao(body, "Nome:")
                    custodiante = ExtrairInformacao(body, "Custodiante:")
                    agencia = ExtrairInformacao(body, "Agência:")
                    conta = ExtrairInformacao(body, "Conta:")
                    
                    ' Adicionar informações à planilha
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 1).End(xlUp).Row + 1, 1).Value = olMail.ReceivedTime
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 2).End(xlUp).Row + 1, 2).Value = olMail.To
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 3).End(xlUp).Row + 1, 3).Value = olMail.CC
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 4).End(xlUp).Row + 1, 4).Value = nome
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 5).End(xlUp).Row + 1, 5).Value = custodiante
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 6).End(xlUp).Row + 1, 6).Value = agencia
                    ExcelWorksheet.Cells(ExcelWorksheet.Cells(Rows.Count, 7).End(xlUp).Row + 1, 7).Value = conta
                End If
            End If
        End If
    Next Item
    
    ' Salvar o workbook
    OutputWorkbook = ThisWorkbook.Path & "\saida.xlsx"
    ExcelWorkbook.SaveAs OutputWorkbook
    
    ' Limpar objetos
    Set OutlookApp = Nothing
    Set OutlookNamespace = Nothing
    Set Folder = Nothing
    Set Item = Nothing
    Set olMail = Nothing
    Set ExcelApp = Nothing
    Set ExcelWorkbook = Nothing
    Set ExcelWorksheet = Nothing
    
    MsgBox "Operação concluída com sucesso. Excel gerado em: " & OutputWorkbook, vbInformation

End Sub

Function ExtrairInformacao(body As String, keyword As String) As String
    Dim startIdx As Integer
    Dim endIdx As Integer
    
    startIdx = InStr(1, body, keyword) + Len(keyword)
    endIdx = InStr(startIdx, body, vbCrLf)
    
    ExtrairInformacao = Trim(Mid(body, startIdx, endIdx - startIdx))
End Function
