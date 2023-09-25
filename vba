Sub ExtrairNomeEDataDeArquivosPDF()
    ' Cria um objeto RegExp para lidar com expressões regulares
    Dim objRegEx As Object
    Set objRegEx = CreateObject("VBScript.RegExp")
    
    ' Configura as propriedades do objeto RegExp para a expressão regular
    objRegEx.Global = True           ' Define para procurar todas as correspondências no texto
    objRegEx.IgnoreCase = True       ' Define para ignorar a diferença entre maiúsculas e minúsculas
    objRegEx.Pattern = "(\d{14})\s*-\s*([A-Z_]+)_(\d{6})\.pdf"  ' Define a expressão regular
    
    ' Especifica o caminho da pasta onde estão os arquivos PDF
    Dim pastaOrigem As String
    pastaOrigem = "C:\Caminho\Para\Os\Seus\Arquivos\PDF" ' Substitua pelo caminho da sua pasta
    
    ' Obtém o nome do primeiro arquivo PDF na pasta
    Dim nomeArquivo As String
    nomeArquivo = Dir(pastaOrigem & "\*.pdf")
    
    ' Loop para processar cada arquivo PDF na pasta
    Do While nomeArquivo <> ""
        ' Verifica se o nome do arquivo corresponde à expressão regular
        If objRegEx.Test(nomeArquivo) Then
            ' Executa a expressão regular no nome do arquivo para extrair as informações
            Dim correspondencia As Object
            Set correspondencia = objRegEx.Execute(nomeArquivo)
            
            ' Extrai as partes correspondentes do nome do arquivo
            Dim numero As String
            Dim nome As String
            Dim data As String
            
            numero = correspondencia(0).SubMatches(0)
            nome = correspondencia(0).SubMatches(1)
            data = correspondencia(0).SubMatches(2)
            
            ' Exibe os resultados ou realiza outras ações com eles
            Debug.Print "Número: " & numero
            Debug.Print "Nome: " & nome
            Debug.Print "Data: " & data
        End If
        
        ' Obtém o nome do próximo arquivo PDF na pasta
        nomeArquivo = Dir
    Loop
    
    ' Libera o objeto RegExp
    Set objRegEx = Nothing
End Sub
