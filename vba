Sub EnviarEmail()

Dim olApp As Object
Dim olMail As Object
Dim SigString As String
Dim Signature As String

' Criar objeto do Outlook
Set olApp = CreateObject("Outlook.Application")
Set olMail = olApp.CreateItem(0)

' Inserir o corpo do email
With olMail
    .To = "destinatario@exemplo.com"
    .Subject = "Assunto do email"
    .HTMLBody = "<html><body>" & _
                "Texto do email" & _
                "</body></html>"
End With

' Inserir a assinatura
SigString = Environ("appdata") & _
            "\Microsoft\Assinaturas\Nome_da_Assinatura.htm"
If Dir(SigString) <> "" Then
    Signature = GetBoiler(SigString)
    olMail.HTMLBody = olMail.HTMLBody & Signature
End If

' Enviar o email
olMail.Send

' Liberar objetos da memória
Set olMail = Nothing
Set olApp = Nothing

End Sub

Function GetBoiler(ByVal sFile As String) As String

' Esta função lê o conteúdo do arquivo de assinatura

Dim fso As Object
Dim ts As Object

Set fso = CreateObject("Scripting.FileSystemObject")
Set ts = fso.GetFile(sFile).OpenAsTextStream(1, -2)
GetBoiler = ts.ReadAll
ts.Close

End Function
