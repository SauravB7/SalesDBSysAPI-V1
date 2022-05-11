%dw 2.0
output application/java
---
payload.commissions map(commission, indexOfCommission) -> {
	ORDER_ID: commission.orderId,
	ORDER_VALUE: commission.orderValue,
	REGION_CD: upper(commission.regionCd),
	COMMISSION_AMOUNT: commission.commissionAmount
}