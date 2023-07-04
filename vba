Sub DescompactarZipComSenha()
    Dim ZipFileName As String
    Dim DestFolder As String
    Dim ShellApp As Object
    Dim ZipFile As Object
    Dim ZipFolder As Object
    Dim Password As String
    
    ' Defina o caminho do arquivo zip e a senha
    ZipFileName = "C:\Caminho\para\seu\arquivo.zip"
    DestFolder = "C:\Caminho\para\destino\da\descompactacao\"
    Password = "123"
    
    ' Criar objetos Shell
    Set ShellApp = CreateObject("Shell.Application")
    Set ZipFile = ShellApp.Namespace(ZipFileName)
    
    ' Verificar se o arquivo zip existe e é válido
    If ZipFile Is Nothing Then
        MsgBox "Arquivo zip não encontrado ou inválido.", vbExclamation
        Exit Sub
    End If
    
    ' Definir destino para descompactar o arquivo zip
    If Right(DestFolder, 1) <> "\" Then
        DestFolder = DestFolder & "\"
    End If
    
    ' Criar pasta de destino, se não existir
    If Not FolderExists(DestFolder) Then
        MkDir DestFolder
    End If
    
    ' Descompactar o arquivo zip com a senha fornecida
    Set ZipFolder = ShellApp.Namespace(DestFolder)
    ZipFolder.CopyHere ZipFile.Items, 4 ' 4 significa substituir os arquivos existentes
    
    ' Aguardar até que o processo de descompactação seja concluído
    On Error Resume Next
    Do Until ZipFolder.Items.Count = ZipFile.Items.Count
        Application.Wait (Now + TimeValue("0:00:01"))
    Loop
    On Error GoTo 0
    
    ' Liberar os objetos
    Set ZipFile = Nothing
    Set ZipFolder = Nothing
    Set ShellApp = Nothing
    
    MsgBox "Descompactação concluída!", vbInformation
End Sub

Function FolderExists(FolderPath As String) As Boolean
    FolderExists = (Dir(FolderPath, vbDirectory) <> "")
End Function
