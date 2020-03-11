# Pass in string of file. Need to set the Get Extract File to return string first.

do |file:nil|
    
    # Add Concur Headers in File
	file = file.lines
	headers = "extract|employeeID|firstName|lastName|email|loginID|purchaseOrderNumber|purchaseOrderStatus|purchaseOrderName|purchaseOrderDesc|purchaseOrderRequestedBy|purchaseOrderCreationDate|purchaseOrderFirstOrderDate|purchaseOrderDeliveryDate|purchaseOrderNeededByDate|purchaseOrderDiscountPerc|purchaseOrderDiscountTermsDays|purchaseOrderNetPaymentTermsDays|purchaseOrderOrderDate|purchaseOrderShipping|purchaseOrderTax|purchaseOrderTotal|purchaseOrderCurrencyName|purchaseOrderPolicyName|purchaseOrderChangeOrderIndicator|purchaseOrderRequestNum|purchaseOrderReceiptType|purchaseOrderCustom1|purchaseOrderCustom2|purchaseOrderCustom3|purchaseOrderCustom4|purchaseOrderCustom5|purchaseOrderCustom6|purchaseOrderCustom7|purchaseOrderCustom8|purchaseOrderCustom9|purchaseOrderCustom10|purchaseOrderCustom11|purchaseOrderCustom12|purchaseOrderCustom13|purchaseOrderCustom14|purchaseOrderCustom15|purchaseOrderCustom16|purchaseOrderCustom17|purchaseOrderCustom18|purchaseOrderCustom19|purchaseOrderCustom20|purchaseOrderCustom21|purchaseOrderCustom22|purchaseOrderCustom23|purchaseOrderCustom24|purchaseOrderLineNumber|purchaseOrderExternalID|purchaseOrderLineItemExpenseType|purchaseOrderLineItemAccountCode|purchaseOrderLineItemSupplierPartID|purchaseOrderLineItemQuantity|purchaseOrderLineItemUnitPrice|purchaseOrderLineItemTax|purchaseOrderLineItemTotal|purchaseOrderLineItemCreationDate|purchaseOrderLineItemUOM|purchaseOrderLineItemDescription|purchaseOrderLineItemIsReceiptRequired|purchaseOrderLineItemIsReceived|purchaseOrderLineItemIsReceivedDate|purchaseOrderLineItemReceivedQuantity|purchaseOrderLineItemIsRequestedBy|purchaseOrderLineItemIsRequestedDeliveryDate|purchaseOrderLineItemCustom1|purchaseOrderLineItemCustom2|purchaseOrderLineItemCustom3|purchaseOrderLineItemCustom4|purchaseOrderLineItemCustom5|purchaseOrderLineItemCustom6|purchaseOrderLineItemCustom7|purchaseOrderLineItemCustom8|purchaseOrderLineItemCustom9|purchaseOrderLineItemCustom10|purchaseOrderLineItemCustom11|purchaseOrderLineItemCustom12|purchaseOrderLineItemCustom13|purchaseOrderLineItemCustom14|purchaseOrderLineItemCustom15|purchaseOrderLineItemCustom16|purchaseOrderLineItemCustom17|purchaseOrderLineItemCustom18|purchaseOrderLineItemCustom19|purchaseOrderLineItemCustom20|purchaseOrderLineItemAllocationPercentage|purchaseOrderAllocationCustom1|purchaseOrderAllocationCustom2|purchaseOrderAllocationCustom3|purchaseOrderAllocationCustom4|purchaseOrderAllocationCustom5|purchaseOrderAllocationCustom6|purchaseOrderAllocationCustom7|purchaseOrderAllocationCustom8|purchaseOrderAllocationCustom9|purchaseOrderAllocationCustom10|purchaseOrderAllocationCustom11|purchaseOrderAllocationCustom12|purchaseOrderAllocationCustom13|purchaseOrderAllocationCustom14|purchaseOrderAllocationCustom15|purchaseOrderAllocationCustom16|purchaseOrderAllocationCustom17|purchaseOrderAllocationCustom18|purchaseOrderAllocationCustom19|purchaseOrderAllocationCustom20|purchaseOrderVendorCode|purchaseOrderShipFromAddressCode|purchaseOrderShipFromAddress1|purchaseOrderShipFromAddress2|purchaseOrderShipFromAddress3|purchaseOrderShipFromCity|purchaseOrderShipFromState|purchaseOrderShipFromZipCode|purchaseOrderShipFromCountryCode|purchaseOrderShipFromFirstName|purchaseOrderShipFromLastName|purchaseOrderShipFromPhoneNum|purchaseOrderShipFromEmail|purchaseOrderShipFromPOFirstName|purchaseOrderShipFromPOLastName|purchaseOrderShipFromPOEmail|purchaseOrderShipFromPOPhoneNum|purchaseOrderShipToAddressCode|purchaseOrderShipToAddress1|purchaseOrderShipToAddress2|purchaseOrderShipToAddress3|purchaseOrderShipToCity|purchaseOrderShipToState|purchaseOrderShipToZipCode|purchaseOrderShipToCountryCode|purchaseOrderBillToAddressCode|purchaseOrderBillToAddress1|purchaseOrderBillToAddress2|purchaseOrderBillToAddress3|purchaseOrderBillToCity|purchaseOrderBillToState|purchaseOrderBillToZipCode|purchaseOrderBillToCountryCode \n"
	file[0] = headers
	file = file.join
    file = file.gsub("\r", "")
    # Parse File
    csv = CSV.parse(file, :liberal_parsing => true, :headers => true, col_sep: '|', :header_converters => lambda {|h| h.try(:downcase).try(:gsub,' ', '_') } )
    file = csv.map {|row| row.to_hash }

    # Group PO Lines by Purchase Order Number
    grouped_purchaseOrders = []
    if !file.blank?
        file.group_by{|e| e["purchaseordernumber"]}.each do |purchaseordernumber, lines|
            grouped_purchaseOrders << {"purchaseordernumber":purchaseordernumber, "lines":lines}
        end
    end

    return{"implicit:array:implicit:object":grouped_purchaseOrders}
end

# Here's the expected outcome:

# {
#     "email": "karen.stephens@verogen.com",
#     "extract": "DETAIL",
#     "loginid": "karen.stephens@verogen.com",
#     "lastname": "Stephens",
#     "firstname": "Karen",
#     "employeeid": "26087",
#     "purchaseordertax": "0.00",
#     "purchaseorderdesc": null,
#     "purchaseordername": null,
#     "purchaseordertotal": "413.13",
#     "purchaseordernumber": "PO2000VER",
#     "purchaseorderstatus": "TRAN",
#     "purchaseordercustom1": "1",
#     "purchaseordercustom2": "N",
#     "purchaseordercustom3": null,
#     "purchaseordercustom4": null,
#     "purchaseordercustom5": null,
#     "purchaseordercustom6": null,
#     "purchaseordercustom7": null,
#     "purchaseordercustom8": null,
#     "purchaseordercustom9": null,
#     "purchaseordercustom10": null,
#     "purchaseordercustom11": null,
#     "purchaseordercustom12": null,
#     "purchaseordercustom13": null,
#     "purchaseordercustom14": null,
#     "purchaseordercustom15": null,
#     "purchaseordercustom16": null,
#     "purchaseordercustom17": null,
#     "purchaseordercustom18": null,
#     "purchaseordercustom19": null,
#     "purchaseordercustom20": null,
#     "purchaseordercustom21": null,
#     "purchaseordercustom22": null,
#     "purchaseordercustom23": null,
#     "purchaseordercustom24": null,
#     "purchaseordershipping": "0.00",
#     "purchaseorderorderdate": "2020-01-07",
#     "purchaseorderbilltocity": "SAN DIEGO",
#     "purchaseorderexternalid": "3",
#     "purchaseorderlinenumber": "3",
#     "purchaseorderpolicyname": "Default Invoice Po Policy",
#     "purchaseorderrequestnum": "3289",
#     "purchaseordershiptocity": "SAN DIEGO",
#     "purchaseordervendorcode": "22761",
#     "purchaseorderbilltostate": "CA",
#     "purchaseorderlineitemtax": null,
#     "purchaseorderlineitemuom": "EA",
#     "purchaseorderreceipttype": "NONE",
#     "purchaseorderrequestedby": "Karen,Stephens",
#     "purchaseordershiptostate": "CA",
#     "purchaseordercreationdate": "2019-12-18",
#     "purchaseordercurrencyname": "US, Dollar",
#     "purchaseorderdeliverydate": null,
#     "purchaseorderdiscountperc": null,
#     "purchaseorderneededbydate": "2019-12-18",
#     "purchaseordershipfromcity": "Chicago",
#     "purchaseorderbilltozipcode": "92121",
#     "purchaseorderlineitemtotal": "12.95",
#     "purchaseordershipfromemail": null,
#     "purchaseordershipfromstate": "IL",
#     "purchaseordershiptozipcode": "92121",
#     "purchaseorderbilltoaddress1": "11111 Flintkote Ave",
#     "purchaseorderbilltoaddress2": null,
#     "purchaseorderbilltoaddress3": null,
#     "purchaseorderfirstorderdate": "2020-01-07",
#     "purchaseordershiptoaddress1": "11111 Flintkote Ave",
#     "purchaseordershiptoaddress2": null,
#     "purchaseordershiptoaddress3": null,
#     "purchaseorderlineitemcustom1": "1",
#     "purchaseorderlineitemcustom2": "N",
#     "purchaseorderlineitemcustom3": null,
#     "purchaseorderlineitemcustom4": null,
#     "purchaseorderlineitemcustom5": null,
#     "purchaseorderlineitemcustom6": null,
#     "purchaseorderlineitemcustom7": null,
#     "purchaseorderlineitemcustom8": null,
#     "purchaseorderlineitemcustom9": null,
#     "purchaseordershipfrompoemail": "kng@verogen.com",
#     "purchaseordershipfromzipcode": "60675",
#     "purchaseorderlineitemcustom10": null,
#     "purchaseorderlineitemcustom11": null,
#     "purchaseorderlineitemcustom12": null,
#     "purchaseorderlineitemcustom13": null,
#     "purchaseorderlineitemcustom14": null,
#     "purchaseorderlineitemcustom15": null,
#     "purchaseorderlineitemcustom16": null,
#     "purchaseorderlineitemcustom17": null,
#     "purchaseorderlineitemcustom18": null,
#     "purchaseorderlineitemcustom19": null,
#     "purchaseorderlineitemcustom20": null,
#     "purchaseorderlineitemquantity": "1.00",
#     "purchaseordershipfromaddress1": "PO BOX 75723",
#     "purchaseordershipfromaddress2": null,
#     "purchaseordershipfromaddress3": null,
#     "purchaseordershipfromlastname": null,
#     "purchaseordershipfromphonenum": null,
#     "purchaseorderallocationcustom1": "1",
#     "purchaseorderallocationcustom2": "N",
#     "purchaseorderallocationcustom3": null,
#     "purchaseorderallocationcustom4": null,
#     "purchaseorderallocationcustom5": null,
#     "purchaseorderallocationcustom6": null,
#     "purchaseorderallocationcustom7": null,
#     "purchaseorderallocationcustom8": null,
#     "purchaseorderallocationcustom9": null,
#     "purchaseorderbilltoaddresscode": "BILL01",
#     "purchaseorderdiscounttermsdays": null,
#     "purchaseorderlineitemunitprice": "12.95",
#     "purchaseordershipfromfirstname": null,
#     "purchaseordershiptoaddresscode": "SHIP01",
#     "purchaseordershiptocountrycode": "US",
#     "purchaseorderallocationcustom10": null,
#     "purchaseorderallocationcustom11": null,
#     "purchaseorderallocationcustom12": null,
#     "purchaseorderallocationcustom13": null,
#     "purchaseorderallocationcustom14": null,
#     "purchaseorderallocationcustom15": null,
#     "purchaseorderallocationcustom16": null,
#     "purchaseorderallocationcustom17": null,
#     "purchaseorderallocationcustom18": null,
#     "purchaseorderallocationcustom19": null,
#     "purchaseorderallocationcustom20": null,
#     "purchaseorderbilltocountrycode_": "US",
#     "purchaseorderlineitemisreceived": "N",
#     "purchaseordershipfrompolastname": null,
#     "purchaseordershipfrompophonenum": null,
#     "purchaseorderlineitemaccountcode": "375",
#     "purchaseorderlineitemdescription": "Shipping",
#     "purchaseorderlineitemexpensetype": "Office Equipment",
#     "purchaseordernetpaymenttermsdays": "30",
#     "purchaseordershipfromaddresscode": "9622",
#     "purchaseordershipfromcountrycode": "US",
#     "purchaseordershipfrompofirstname": null,
#     "purchaseorderchangeorderindicator": "N",
#     "purchaseorderlineitemcreationdate": "2019-12-18",
#     "purchaseorderlineitemisrequestedby": null,
#     "purchaseorderlineitemisreceiveddate": null,
#     "purchaseorderlineitemsupplierpartid": null,
#     "purchaseorderlineitemreceivedquantity": null,
#     "purchaseorderlineitemisreceiptrequired": "Y",
#     "purchaseorderlineitemallocationpercentage": "100.00",
#     "purchaseorderlineitemisrequesteddeliverydate": null
#   }