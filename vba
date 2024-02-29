Function ExecutarQuery() As Scripting.Dictionary
    Dim conn As Object
    Dim rs As Object
    Dim strSQL As String
    Dim resultado As New Scripting.Dictionary ' Certifique-se de ter a referência para a biblioteca 'Microsoft Scripting Runtime'

    ' Inicializa a conexão
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = "sua_string_de_conexao_aqui"
    conn.Open

    ' Inicializa o objeto Recordset
    Set rs = CreateObject("ADODB.Recordset")

    ' Sua consulta SQL aqui
    strSQL = "SELECT name, real_name FROM sua_tabela"

    ' Executa a consulta
    rs.Open strSQL, conn

    ' Itera sobre os resultados
    Do Until rs.EOF
        ' Adiciona os valores ao dicionário
        resultado.Add rs.Fields("name").Value, rs.Fields("real_name").Value

        ' Move para o próximo registro
        rs.MoveNext
    Loop

    ' Fecha a conexão e o recordset
    rs.Close
    conn.Close

    ' Retorna o dicionário com os resultados
    Set ExecutarQuery = resultado
End Function
