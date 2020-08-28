<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxwpg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>

	</div>
	<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" 
		DataSourceID="AccessDataSource1" 
		oncustomfieldvaluecells="ASPxPivotGrid1_CustomFieldValueCells">
		<Fields>

			<dxwpg:PivotGridField ID="fieldProductName" AreaIndex="0" 
				FieldName="ProductName">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0" 
				FieldName="CompanyName">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldOrderYear" Area="ColumnArea" AreaIndex="0" 
				FieldName="OrderDate" GroupInterval="DateYear" GroupIndex="0" 
				InnerGroupIndex="0" UnboundFieldName="fieldOrderYear" Caption="Year">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldOrderMonth" Area="ColumnArea" AreaIndex="1" 
				FieldName="OrderDate" GroupInterval="DateQuarter" GroupIndex="0" 
				InnerGroupIndex="1" UnboundFieldName="fieldOrderMonth" Caption="Quarter">
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0" 
				FieldName="ProductAmount">
			</dxwpg:PivotGridField>

		</Fields>
		<Groups>
			<dxwpg:PivotGridWebGroup Caption="Date" />
		</Groups>
	</dxwpg:ASPxPivotGrid>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/nwind.mdb" 
		SelectCommand="SELECT * FROM [CustomerReports]">
	</asp:AccessDataSource>
	</form>
</body>
</html>