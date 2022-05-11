%dw 2.0
output application/json
---
if(not isEmpty(payload))
({
    "commission": {
        "orderId": payload.ORDER_ID,
        "orderValue": payload.ORDER_VALUE,
        "regionCd": payload.REGION_CD,
        "commissionAmount": payload.COMMISSION_AMOUNT
    }
})
else
({
	"transactionNotification": {
		"transactionCode": "E",
        "transactionStatus": "Error",
        "remarks": [{
           "messageCode": "UAP-APP-500",
           "messageText": "Commission Details For Given Order ID Not Present in Database."
        }]
    }
})