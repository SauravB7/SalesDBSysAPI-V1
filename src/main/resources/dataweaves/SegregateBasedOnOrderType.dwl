%dw 2.0
output application/json
---
payload.orders map ((order, indexOfOrder) -> {
    ORDER_ID: order.orderId,
    CUSTOMER_ID: order.customerId,
    ORDER_STATUS: upper(order.orderStatus),
    PURCHASE_TMSTMP: order.purchaseTimestamp,
    APPROVED_TMSTMP: order.approvedAt,
    DELIVERED_CARRIER_DT: order.deliveredCarrierDate,
    DELIVERED_CUSTOMER_DT: order.deliveredCustomerDate,
    ESTIMATED_DELIVERY_DT: order.estimatedDelivery,
    ORDER_VALUE: order.orderValue,
    REGION_CD: upper(order.regionCd)
})