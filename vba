Sub ConectarOracle()
    Dim conn As Object
    Dim rs As Object
    Dim strSQL As String
    Dim strConn As String
    
    ' String de conexão Oracle (modifique os parâmetros conforme necessário)
    strConn = "Provider=OraOLEDB.Oracle;" & _
              "Data Source=SeuDataSource;" & _  ' Nome do Data Source (TNS)
              "User ID=SeuUsuario;" & _         ' Usuário do banco
              "Password=SuaSenha;"              ' Senha do banco

    ' Cria o objeto de conexão
    Set conn = CreateObject("ADODB.Connection")
    
    On Error GoTo ErrorHandler
    
    ' Abre a conexão
    conn.Open strConn
    
    ' Exemplo de uma consulta SQL
    strSQL = "SELECT * FROM SUA_TABELA"
    
    ' Cria um objeto Recordset para armazenar os resultados da consulta
    Set rs = conn.Execute(strSQL)
    
    ' Exibe os dados no Immediate Window (Ctrl + G para abrir)
    Do While Not rs.EOF
        Debug.Print rs.Fields(0).Value  ' Exibe o valor da primeira coluna
        rs.MoveNext
    Loop
    
    ' Fecha o Recordset e a conexão
    rs.Close
    conn.Close
    
    Exit Sub

ErrorHandler:
    MsgBox "Erro ao conectar ao banco de dados: " & Err.Description
    If Not conn Is Nothing Then conn.Close
End Sub
