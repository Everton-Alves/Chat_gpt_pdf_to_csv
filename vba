Sub ExecutarScriptPython()
    Dim numero As Integer
    
    ' Definir o número desejado
    numero = 456
    
    ' Caminho para o interpretador Python
    Dim pythonPath As String
    pythonPath = "Caminho_para_o_python.exe" ' Substitua pelo caminho correto para o interpretador Python

    ' Caminho para o script Python
    Dim scriptPath As String
    scriptPath = "Caminho_para_o_script_python.py" ' Substitua pelo caminho correto para o script Python

    ' Comando para executar o script Python com o número como parâmetro
    Dim command As String
    command = pythonPath & " " & scriptPath & " " & numero

    ' Executar o script Python
    Shell(command, vbNormalFocus)
End Sub
