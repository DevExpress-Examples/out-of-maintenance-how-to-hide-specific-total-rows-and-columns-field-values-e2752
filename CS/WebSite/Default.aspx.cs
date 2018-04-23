using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    object[] unnecessaryYearTotals = new object[] { 1994, 1995 };
    protected void ASPxPivotGrid1_CustomFieldValueCells(object sender, DevExpress.Web.ASPxPivotGrid.PivotCustomFieldValueCellsEventArgs e)
    {
        PivotGridField fieldYear = ASPxPivotGrid1.Fields["fieldOrderYear"];
        if (fieldYear.Area == PivotArea.ColumnArea || fieldYear.Area == PivotArea.RowArea)
        {
            bool isColumn = fieldYear.Area == PivotArea.ColumnArea;
            for (int i = e.GetCellCount(isColumn) - 1; i >= 0; i--)
            {
                FieldValueCell cell = e.GetCell(isColumn, i);
                if (unnecessaryYearTotals.Contains(cell.Value) && cell.ValueType == PivotGridValueType.Total)
                    e.Remove(cell);
            }
        }
    }
}
