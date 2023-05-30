Sub ExecutarScriptPython()
    Dim numero As Integer
    
    ' Definir o número desejado
    numero = 456

    ' Crie um objeto WshShell
    Dim shell As Object
    Set shell = CreateObject("WScript.Shell")

    ' Caminho para o script Python
    Dim scriptPath As String
    scriptPath = "caminho_para_o_script_python.py" ' Substitua pelo caminho correto para o script Python

    ' Comando para executar o script Python com o número como parâmetro
    Dim command As String
    command = "python " & scriptPath & " " & CStr(numero)

    ' Executar o comando no prompt de comando
    shell.Run command, vbHide

    ' Liberar o objeto shell
    Set shell = Nothing
End Sub
