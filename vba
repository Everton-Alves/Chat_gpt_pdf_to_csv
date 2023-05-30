Sub ExecutarScriptPython()
    Dim numero As Integer
    
    ' Definir o número desejado
    numero = 456

    ' Importar o módulo py
    Dim py As Object
    Set py = VBA.CreateObject("pythontools.console")

    ' Executar o script Python passando o número como parâmetro
    py.ExecStatement "import sys"
    py.ExecStatement "sys.argv = ['', '" & CStr(numero) & "']"
    py.ExecScript "caminho_para_o_script_python.py"

    ' Liberar o objeto py
    Set py = Nothing
End Sub

