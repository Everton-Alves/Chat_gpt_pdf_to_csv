Sub Convert_PDF_to_CSV()
    Dim AcroApp As Acrobat.AcroApp
    Dim AcroDoc As Acrobat.AcroPDDoc
    Dim AcroPage As Acrobat.AcroPDPage
    Dim Content As String
    Dim i As Integer
    Dim j As Integer
    Dim CSVFile As String
    Dim Line As String
    
    Set AcroApp = CreateObject("AcroExch.App")
    Set AcroDoc = CreateObject("AcroExch.PDDoc")
    
    If AcroDoc.Open("path_to_your_PDF_file.pdf") Then
        CSVFile = "path_to_your_CSV_file.csv"
        Open CSVFile For Output As #1
        For i = 0 To AcroDoc.GetNumPages() - 1
            Set AcroPage = AcroDoc.AcquirePage(i)
            Content = AcroPage.GetWordText
            For j = 1 To Len(Content)
                If Mid(Content, j, 1) = vbCr Then
                    Line = Replace(Line, ",", " ")
                    Print #1, Line
                    Line = ""
                ElseIf Mid(Content, j, 1) = vbLf Then
                Else
                    Line = Line & Mid(Content, j, 1)
                End If
            Next j
            Set AcroPage = Nothing
        Next i
        Close #1
    End If
    
    AcroDoc.Close
    AcroApp.Exit
    Set AcroPage = Nothing
    Set AcroDoc = Nothing
    Set AcroApp = Nothing
End Sub
