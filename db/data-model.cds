namespace zvks.db.data_model;

//To do: 
// 1. Skiping the data-model and creating project directly on API
// 1. Create a Composition between SO Items and Schedule Lines
// 2. Read Item and Header together using SDK
// 3. Uset Material API to Read Material Details API_MATERIAL_STOCK_SRV/A_MaterialStock(AAA)?$format=json

using { API_SALES_ORDER_SRV as API_SO } from '../srv/external/API_SALES_ORDER_SRV.csn';
//Development URI: "http://mo-ddd0724d9.mo.sap.corp:8080/sap/opu/odata/sap/API_SALES_ORDER_SRV/"

entity SalesOrderItems as projection on API_SO.A_SalesOrderItem {
    key SalesOrder, 
    key SalesOrderItem,
        SalesOrderItemCategory,
        SalesOrderItemText,
        Material,               
        RequestedQuantity,
        RequestedQuantityUnit,
        NetAmount,
        TransactionCurrency
        //to_ScheduleLine
};

entity ScheduleLines as projection on API_SO.A_SalesOrderScheduleLine{
    key SalesOrder, 
    key SalesOrderItem,
    key ScheduleLine,
        DelivBlockReasonForSchedLine,
        ConfdOrderQtyByMatlAvailCheck,
        DeliveredQtyInOrderQtyUnit,
        OpenConfdDelivQtyInOrdQtyUnit,
        OrderQuantityUnit
};

/**
    "SalesOrder" : "407",
    "SalesOrderItem" : "10",
    "HigherLevelItem" : "0",
    "SalesOrderItemCategory" : "TAN",
    "SalesOrderItemText" : "Test Material",
    "PurchaseOrderByCustomer" : "",
    "Material" : "10324",
    "MaterialByCustomer" : "",
    "PricingDate" : "\/Date(1598400000000)\/",
    "RequestedQuantity" : "1",
    "RequestedQuantityUnit" : "PC",
    "ItemGrossWeight" : "1.000",
    "ItemNetWeight" : "1.000",
    "ItemWeightUnit" : "KG",
    "ItemVolume" : "0.000",
    "ItemVolumeUnit" : "",
    "TransactionCurrency" : "USD",
    "NetAmount" : "100.00",
    "MaterialGroup" : "01",
    "MaterialPricingGroup" : "",
    "Batch" : "",
    "ProductionPlant" : "1001",
    "StorageLocation" : "",
    "DeliveryGroup" : "0",
    "ShippingPoint" : "1001",
    "ShippingType" : "",
    "DeliveryPriority" : "2",
    "IncotermsClassification" : "FOB",
    "IncotermsTransferLocation" : "destination",
    "IncotermsLocation1" : "destination",
    "IncotermsLocation2" : "",
    "CustomerPaymentTerms" : "0001",
    "SalesDocumentRjcnReason" : "",
    "ItemBillingBlockReason" : "",
    "WBSElement" : "",
    "ReferenceSDDocument" : "346",
    "ReferenceSDDocumentItem" : "10",
    "SDProcessStatus" : "C",
    "DeliveryStatus" : "C",
    "OrderRelatedBillingStatus" : "",
 */

/**
        {
          "__metadata" : {
            "id" : "http://mo-ddd0724d9.mo.sap.corp:8080/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrderScheduleLine(SalesOrder='407',SalesOrderItem='10',ScheduleLine='1')",
            "uri" : "http://mo-ddd0724d9.mo.sap.corp:8080/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrderScheduleLine(SalesOrder='407',SalesOrderItem='10',ScheduleLine='1')",
            "type" : "API_SALES_ORDER_SRV.A_SalesOrderScheduleLineType"
          },
          "SalesOrder" : "407",
          "SalesOrderItem" : "10",
          "ScheduleLine" : "1",
          "OrderQuantityUnit" : "PC",
          "ConfdOrderQtyByMatlAvailCheck" : "0",
          "DeliveredQtyInOrderQtyUnit" : "0",
          "OpenConfdDelivQtyInOrdQtyUnit" : "0",
          "DelivBlockReasonForSchedLine" : ""
        },
        {
          "__metadata" : {
            "id" : "http://mo-ddd0724d9.mo.sap.corp:8080/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrderScheduleLine(SalesOrder='407',SalesOrderItem='10',ScheduleLine='2')",
            "uri" : "http://mo-ddd0724d9.mo.sap.corp:8080/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrderScheduleLine(SalesOrder='407',SalesOrderItem='10',ScheduleLine='2')",
            "type" : "API_SALES_ORDER_SRV.A_SalesOrderScheduleLineType"
          },
          "SalesOrder" : "407",
          "SalesOrderItem" : "10",
          "ScheduleLine" : "2",
          "OrderQuantityUnit" : "PC",
          "ConfdOrderQtyByMatlAvailCheck" : "1",
          "DeliveredQtyInOrderQtyUnit" : "0",
          "OpenConfdDelivQtyInOrdQtyUnit" : "1",
          "DelivBlockReasonForSchedLine" : ""
        }
 */
