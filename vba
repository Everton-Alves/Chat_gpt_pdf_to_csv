Sub ConverterMesParaFormatoYYYYMM()
    ' Crie um dicionário para mapear os nomes dos meses
    Dim meses As Object
    Set meses = CreateObject("Scripting.Dictionary")

    ' Adicione os mapeamentos ao dicionário
    meses.Add "Janeiro", "01"
    meses.Add "Fevereiro", "02"
    meses.Add "Março", "03"
    meses.Add "Abril", "04"
    meses.Add "Maio", "05"
    meses.Add "Junho", "06"
    meses.Add "Julho", "07"
    meses.Add "Agosto", "08"
    meses.Add "Setembro", "09"
    meses.Add "Outubro", "10"
    meses.Add "Novembro", "11"
    meses.Add "Dezembro", "12"

    ' Mês a ser convertido (substitua conforme necessário)
    Dim mesOriginal As String
    mesOriginal = "Janeiro de 2023"

    ' Extrai o nome do mês do texto original
    Dim nomeMes As String
    nomeMes = Split(mesOriginal, " ")(0)

    ' Obtém o valor correspondente no dicionário
    Dim valorMes As String
    If meses.Exists(nomeMes) Then
        valorMes = meses(nomeMes)
        MsgBox "O mês " & mesOriginal & " em formato YYYY-MM é: 2023-" & valorMes, vbInformation
    Else
        MsgBox "Mês não reconhecido.", vbExclamation
    End If
End Sub
