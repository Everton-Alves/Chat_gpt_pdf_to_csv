Sub SalvarAnexosPDF()
    Dim objNamespace As Outlook.NameSpace
    Dim objFolder As Outlook.MAPIFolder
    Dim objItem As Object
    Dim objAttachment As Outlook.Attachment
    Dim saveFolder As String
    Dim savePath As String
    Dim pdfExtension As String
    
    ' Defina a extensão do arquivo PDF
    pdfExtension = ".pdf"
    
    ' Especifique o caminho onde você deseja salvar os anexos PDF
    saveFolder = "C:\Caminho\Para\Salvar\PDFs\"
    
    ' Obtenha a referência ao namespace do Outlook
    Set objNamespace = Application.GetNamespace("MAPI")
    
    ' Selecione a pasta desejada (por exemplo, Caixa de Entrada)
    Set objFolder = objNamespace.GetDefaultFolder(olFolderInbox)
    
    ' Percorra todos os itens na pasta
    For Each objItem In objFolder.Items
        If TypeOf objItem Is MailItem Then
            ' Percorra todos os anexos no e-mail
            For Each objAttachment In objItem.Attachments
                ' Verifique se o anexo é um arquivo PDF
                If Right(objAttachment.FileName, Len(pdfExtension)) = pdfExtension Then
                    ' Construa o caminho completo para salvar o PDF
                    savePath = saveFolder & objItem.Subject & pdfExtension
                    ' Salve o anexo PDF
                    objAttachment.SaveAsFile savePath
                    ' Exiba uma mensagem informando sobre o salvamento
                    MsgBox "Anexo PDF salvo em: " & savePath
                End If
            Next objAttachment
        End If
    Next objItem
End Sub
