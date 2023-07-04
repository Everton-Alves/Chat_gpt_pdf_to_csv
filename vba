Sub DescompactarArquivoZip()
    Dim objShell As Object
    Dim objFolder As Object
    Dim objFile As Object
    Dim zipPath As String
    Dim unzipPath As String
    Dim password As String
    
    ' Caminho do arquivo ZIP protegido por senha
    zipPath = "C:\Caminho\para\arquivo.zip"
    
    ' Caminho onde o arquivo será descompactado
    unzipPath = "C:\Caminho\para\descompactar"
    
    ' Senha do arquivo ZIP
    password = "123"
    
    Set objShell = CreateObject("Shell.Application")
    Set objFolder = objShell.NameSpace(unzipPath)
    
    ' Verifica se o caminho de descompactação existe, caso contrário, cria a pasta
    If Not objFolder Is Nothing Then
        MkDir unzipPath
    End If
    
    ' Descompacta o arquivo ZIP
    Set objFile = objShell.NameSpace(zipPath & Chr(34))
    
    If Not objFile Is Nothing Then
        objFolder.CopyHere objFile.Items, 16
        
        ' Aguarda até que a extração seja concluída
        Do Until objFolder.Items.Count = objFile.Items.Count
            Application.Wait (Now + TimeValue("0:00:01"))
        Loop
    End If
    
    ' Libera os objetos
    Set objShell = Nothing
    Set objFolder = Nothing
    Set objFile = Nothing
    
    MsgBox "A descompactação foi concluída."
End Sub
