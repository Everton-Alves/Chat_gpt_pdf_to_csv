Sub PDFtoExcel()

Dim AcroApp As Object
Dim AcroAVDoc As Object
Dim AcroPDDoc As Object
Dim jso As Object
Dim i As Integer

Set AcroApp = CreateObject("AcroExch.App")
Set AcroAVDoc = CreateObject("AcroExch.AVDoc")

If AcroAVDoc.Open("C:\Users\YourUserName\Documents\BankStatement.pdf", "") Then
    Set AcroPDDoc = AcroAVDoc.GetPDDoc
    Set jso = AcroPDDoc.GetJSObject
    For i = 0 To jso.numPages - 1
        Cells(i + 1, 1) = jso.getPageText(i)
    Next i
    AcroAVDoc.Close True
End If

AcroApp.Exit
Set AcroAVDoc = Nothing
Set AcroApp = Nothing

End Sub
