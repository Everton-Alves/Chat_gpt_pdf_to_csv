Option Explicit

Sub MoverEmailsIndesejaveis()
    Dim olApp As Object
    Dim olNs As Object
    Dim olFolder As Object
    Dim olInbox As Object
    Dim olMail As Object
    Dim ws As Worksheet
    Dim i As Long
    Dim lastRow As Long
    Dim titleCriteria As String
    Dim senderCriteria As String
    Dim destinationFolderName As String
    
    ' Defina o nome da planilha que contém as informações dos filtros
    Set ws = ThisWorkbook.Sheets("Filtros")
    
    ' Obtenha a última linha da coluna A na planilha "Filtros"
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Crie uma referência ao aplicativo Outlook
    Set olApp = CreateObject("Outlook.Application")
    
    ' Obtenha o namespace do Outlook
    Set olNs = olApp.GetNamespace("MAPI")
    
    ' Defina a pasta de entrada (Inbox)
    Set olInbox = olNs.GetDefaultFolder(6)
    
    ' Percorra os filtros na planilha e mova os e-mails correspondentes para as pastas específicas
    For i = 2 To lastRow ' Inicie a partir da segunda linha para ignorar o cabeçalho
        titleCriteria = ws.Cells(i, "A").Value
        senderCriteria = ws.Cells(i, "B").Value
        destinationFolderName = ws.Cells(i, "C").Value
        
        ' Defina a pasta de destino
        Set olFolder = olInbox.Folders(destinationFolderName)
        
        ' Percorra os e-mails na pasta de entrada (Inbox)
        For Each olMail In olInbox.Items
            ' Verifique se o título e o remetente do e-mail correspondem aos critérios fornecidos na planilha
            If InStr(1, olMail.Subject, titleCriteria, vbTextCompare) > 0 And InStr(1, olMail.SenderEmailAddress, senderCriteria, vbTextCompare) > 0 Then
                ' Mova o e-mail para a pasta de destino
                olMail.Move olFolder
            End If
        Next olMail
    Next i
    
    ' Limpe as referências
    Set olApp = Nothing
    Set olNs = Nothing
    Set olInbox = Nothing
    Set olFolder = Nothing
    Set olMail = Nothing
End Sub
