%dw 2.0
import java!com::xyz::dates::DateUtils
output application/json
---
if(not isEmpty(payload)) ({
    "order": {
        "orderId": payload.ORDER_ID,
        "customerId": payload.CUSTOMER_ID,
        "orderStatus": payload.ORDER_STATUS,
        "purchaseTimestamp": DateUtils::convertSqlTimeStamptToString(payload.PURCHASE_TMSTMP, "MM/dd/yyyy hh:mm:ss"),
        "approvedAt": DateUtils::convertSqlTimeStamptToString(payload.APPROVED_TMSTMP, "MM/dd/yyyy hh:mm:ss"),
        "deliveredCarrierDate": if(not isEmpty(payload.DELIVERED_CARRIER_DT)) payload.DELIVERED_CARRIER_DT as String {format: "MM-dd-yyyy"} else null,
        "deliveredCustomerDate": if(not isEmpty(payload.DELIVERED_CUSTOMER_DT))payload.DELIVERED_CUSTOMER_DT as String {format: "MM-dd-yyyy"} else null,
        "estimatedDelivery": if(not isEmpty(payload.ESTIMATED_DELIVERY))payload.ESTIMATED_DELIVERY as String {format: "MM-dd-yyyy"} else null,
        "orderValue": payload.ORDER_VALUE,
        "orderType": vars.orderType,
        "regionCd": payload.REGION_CD
    }
})
else ({
	"transactionNotification": {
	    "transactionCode": "E",
	    "transactionStatus": "Not Found",
	    "remarks": [{
	            "messageCode": "UAP-APP-201",
	            "messageText": "Order Details not found in DB."
	        }
	    ]
	}
})