Sub ConvertPDFtoExcel()

    ' Define variables
    Dim AcroApp As Acrobat.AcroApp
    Dim AcroAVDoc As Acrobat.AcroAVDoc
    Dim AcroPDDoc As Acrobat.AcroPDDoc
    Dim AcroPDPage As Acrobat.AcroPDPage
    Dim AcroHiliteList As Acrobat.AcroHiliteList
    Dim AcroTextSelect As Acrobat.AcroTextSelect
    Dim i As Long
    Dim j As Long
    Dim sText As String
    Dim sFileName As String
    Dim oFile As Object
    Dim oFSO As Object
    Dim oTS As Object
    Dim arrData() As String

    ' Set file name
    sFileName = "C:\path\to\file.pdf"

    ' Open the PDF file
    Set AcroApp = CreateObject("AcroExch.App")
    Set AcroAVDoc = CreateObject("AcroExch.AVDoc")
    If AcroAVDoc.Open(sFileName, "") Then
        Set AcroPDDoc = AcroAVDoc.GetPDDoc
        ReDim arrData(1 To AcroPDDoc.GetNumPages, 1 To 5)
        
        ' Loop through pages
        For i = 1 To AcroPDDoc.GetNumPages
            Set AcroPDPage = AcroPDDoc.AcquirePage(i - 1)
            Set AcroHiliteList = CreateObject("AcroExch.HiliteList")
            Set AcroTextSelect = CreateObject("AcroExch.TextSelect")
            AcroTextSelect.Page = AcroPDPage
            AcroTextSelect.SelectAll
            AcroHiliteList.Add 0, 0
            AcroTextSelect.Highlight AcroHiliteList
            sText = AcroTextSelect.GetText(1)
            arrData(i, 1) = i
            arrData(i, 2) = sText
            AcroPDPage.Release
        Next i
        
        ' Close the PDF file
        AcroPDDoc.Close
        AcroAVDoc.Close True
        AcroApp.Exit
        Set AcroPDDoc = Nothing
        Set AcroAVDoc = Nothing
        Set AcroApp = Nothing
        
        ' Write data to Excel file
        Set oFSO = CreateObject("Scripting.FileSystemObject")
        Set oFile = oFSO.CreateTextFile("C:\path\to\output.txt")
        For i = 1 To UBound(arrData, 1)
            For j = 1 To UBound(arrData, 2)
                oFile.Write arrData(i, j)
                oFile.Write vbTab
            Next j
            oFile.Write vbNewLine
        Next i
        oFile.Close
        Set oFile = Nothing
        Set oFSO = Nothing
        
    Else
        MsgBox "Error opening PDF file"
    End If

End Sub
