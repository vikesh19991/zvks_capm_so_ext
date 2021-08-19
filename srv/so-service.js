const cds = require("@sap/cds");

module.exports = cds.service.impl(async (SalesOrderSRV) => {
  //Get Entity Set
  const {
    SalesOrderItemSet,
    // ScheduleLineSet
  } = cds.entities("zvks.srv.so_service.SalesOrderSRV");

  //   const {
  //     SalesOrderSet,
  //     ScheduleLineSet
  //   } = cds.entities;

  //   const {
  //     SalesOrderSet,
  //     ScheduleLineSet
  //   } = this.entities;

  //----------------------------------------------------------
  // SalesOrderItem - GET
  //----------------------------------------------------------
  SalesOrderSRV.on("READ", SalesOrderItemSet, async (request) => {
    //Use Cloud-SDK
    return await getSalesOrderItemUsingSDK()
      .then((SalesOrderItemS4HTable) => {
        var SalesOrderItemSetLine = {};
        var SalesOrderItemSetTable = [];

        for (let SalesOrderItemS4HLine of SalesOrderItemS4HTable) {
        //   console.log('SalesOrderItemS4HLine---------');
        //   console.log(SalesOrderItemS4HLine);

          SalesOrderItemSetLine.SalesOrder             = SalesOrderItemS4HLine.salesOrder;
          SalesOrderItemSetLine.SalesOrderItem         = SalesOrderItemS4HLine.salesOrderItem;
          SalesOrderItemSetLine.SalesOrderItemCategory = SalesOrderItemS4HLine.salesOrderItemCategory;
          SalesOrderItemSetLine.SalesOrderItemText     = SalesOrderItemS4HLine.salesOrderItemText;
          SalesOrderItemSetLine.Material               = SalesOrderItemS4HLine.material;
          SalesOrderItemSetLine.RequestedQuantity      = SalesOrderItemS4HLine.requestedQuantity;
          SalesOrderItemSetLine.RequestedQuantityUnit  = SalesOrderItemS4HLine.requestedQuantityUnit;
          SalesOrderItemSetLine.NetAmount              = SalesOrderItemS4HLine.netAmount;
          SalesOrderItemSetLine.TransactionCurrency    = SalesOrderItemS4HLine.transactionCurrency;
          SalesOrderItemSetTable.push(SalesOrderItemSetLine);
        }

        console.log('SalesOrderItemSetTable---------');
        console.log(SalesOrderItemSetTable);

        return SalesOrderItemSetTable;
      })
      .catch((error) => {
        console.log(error);
        request.error(500, "ERROR", request.target.name, [error.toString()]);
    });

    //Using CDS-SDK

});

  // --------------------------------------------------------------
  // local functions
  // --------------------------------------------------------------
  function getSalesOrderItemUsingSDK() {
    const {
      SalesOrderItem,
    } = require("@sap/cloud-sdk-vdm-sales-order-service");

    const SalesOrderItemS4HTable = SalesOrderItem.requestBuilder()
      .getAll()
      //.filter(SalesOrder.TOTAL_NET_AMOUNT.greaterThan(2000))
      .top(2)
      .select(
        SalesOrderItem.SALES_ORDER,
        SalesOrderItem.SALES_ORDER_ITEM,
        SalesOrderItem.SALES_ORDER_ITEM_CATEGORY,
        SalesOrderItem.SALES_ORDER_ITEM_TEXT,
        SalesOrderItem.MATERIAL,
        SalesOrderItem.REQUESTED_QUANTITY,
        SalesOrderItem.REQUESTED_QUANTITY_UNIT,
        SalesOrderItem.NET_AMOUNT,
        SalesOrderItem.TRANSACTION_CURRENCY
      )
      .execute({
        //For Local Testing
        url: "http://mo-ddd0724d9.mo.sap.corp:8080/", //S4H ~ SMICM
        username: "I521254",
        password: "Password01!",
        //For BTP
        //destinationName: "S4H",
      });

    return SalesOrderItemS4HTable;
  }

});
