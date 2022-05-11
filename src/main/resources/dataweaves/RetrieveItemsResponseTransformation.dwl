%dw 2.0
output application/json
---
if(not isEmpty(payload)) ({
    orderItems: {
          orderId: vars.orderId,
          items: payload map (item, indexOfItem) -> ({
              productId: item.PRODUCT_ID,
              itemQty: item.ITEM_QUANTITY,
              sellerId: item.SELLER_ID,
              shippingLimitDate: item.SHIPPING_LIMIT_DT as String {format: "MM/dd/yyyy"},
              pricePerItem: item.PRICE,
              freightValue: item.FREIGHT_VALUE
          })
      }
})
else ({
	"transactionNotification": {
	    "transactionCode": "E",
	    "transactionStatus": "Not Found",
	    "remarks": [{
	            "messageCode": "UAP-APP-201",
	            "messageText": "Order Items not found in DB."
	        }
	    ]
	}
})