%dw 2.0
output application/java
---
flatten(payload.orderItems map(order, indexOfOrder) -> (
    order.items map (item, indexOfItem) -> {
        ORDER_ID: order.orderId,
        PRODUCT_ID: item.productId,
        ITEM_QUANTITY: item.itemQty,
        SELLER_ID: item.sellerId,
        PRICE: item.pricePerItem,
        FREIGHT_VALUE: item.freightValue,
        SHIPPING_LIMIT_DT: item.shippingLimitDate
    }
))