' Classe CodigoComRange
Option Explicit

Private pCodigo As String
Private pRange As Range

Public Property Get Codigo() As String
    Codigo = pCodigo
End Property

Public Property Let Codigo(ByVal Value As String)
    pCodigo = Value
End Property

Public Property Get Range() As Range
    Set Range = pRange
End Property

Public Property Set Range(ByVal Value As Range)
    Set pRange = Value
End Property

Public Sub Initialize(ByVal codigo As String, ByVal rng As Range)
    Me.Codigo = codigo
    Set Me.Range = rng
End Sub
