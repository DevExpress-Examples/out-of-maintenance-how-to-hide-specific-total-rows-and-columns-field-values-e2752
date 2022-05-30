<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxwpg" %>

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
        DataSourceID="SqlDataSource1" 
        oncustomfieldvaluecells="ASPxPivotGrid1_CustomFieldValueCells" ClientIDMode="AutoID" IsMaterialDesign="False">
        <Fields>

            <dxwpg:PivotGridField ID="fieldProductName" AreaIndex="0" 
                FieldName="ProductName">
                <DataBindingSerializable>
                    <dxwpg:DataSourceColumnBinding ColumnName="ProductName" />
                </DataBindingSerializable>
            </dxwpg:PivotGridField>
            <dxwpg:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="0">
                <DataBindingSerializable>
                    <dxwpg:DataSourceColumnBinding ColumnName="CompanyName" />
                </DataBindingSerializable>
            </dxwpg:PivotGridField>
            <dxwpg:PivotGridField ID="fieldOrderYear" Area="ColumnArea" AreaIndex="0" GroupIndex="0" 
                InnerGroupIndex="0" UnboundFieldName="fieldOrderYear" Caption="Year">
                <DataBindingSerializable>
                    <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                </DataBindingSerializable>
            </dxwpg:PivotGridField>
            <dxwpg:PivotGridField ID="fieldOrderQuarter" Area="ColumnArea" AreaIndex="1" 
                FieldName="OrderDate" GroupIndex="0" 
                InnerGroupIndex="1" UnboundFieldName="fieldOrderMonth" Caption="Quarter" Name="fieldOrderQuarter">
                <DataBindingSerializable>
                    <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateQuarter" />
                </DataBindingSerializable>
            </dxwpg:PivotGridField>
            <dxwpg:PivotGridField ID="fieldProductAmount" Area="DataArea" AreaIndex="0">
                <DataBindingSerializable>
                    <dxwpg:DataSourceColumnBinding ColumnName="ProductAmount" />
                </DataBindingSerializable>
            </dxwpg:PivotGridField>

        </Fields>
        <OptionsData DataProcessingEngine="Optimized" />
        <Groups>
            <dxwpg:PivotGridWebGroup Caption="Date" />
        </Groups>
    </dxwpg:ASPxPivotGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [CustomerReports]"></asp:SqlDataSource>
    </form>
</body>
</html>
