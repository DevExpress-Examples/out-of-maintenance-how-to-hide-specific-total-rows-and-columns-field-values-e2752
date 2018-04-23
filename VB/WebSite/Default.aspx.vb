Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraPivotGrid

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Private unnecessaryYearTotals() As Object = { 1994, 1995 }
	Protected Sub ASPxPivotGrid1_CustomFieldValueCells(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxPivotGrid.PivotCustomFieldValueCellsEventArgs)
		Dim fieldYear As PivotGridField = ASPxPivotGrid1.Fields("fieldOrderYear")
		If fieldYear.Area = PivotArea.ColumnArea OrElse fieldYear.Area = PivotArea.RowArea Then
			Dim isColumn As Boolean = fieldYear.Area = PivotArea.ColumnArea
			For i As Integer = e.GetCellCount(isColumn) - 1 To 0 Step -1
				Dim cell As FieldValueCell = e.GetCell(isColumn, i)
				If unnecessaryYearTotals.Contains(cell.Value) AndAlso cell.ValueType = PivotGridValueType.Total Then
					e.Remove(cell)
				End If
			Next i
		End If
	End Sub
End Class
