%dw 2.0
output application/java
---
if(vars.orderType == 'online')
	"SELECT * FROM " ++ p('db.schema') ++ "." ++ p('db.table.salesOnline') ++ " WHERE ORDER_ID='" ++ vars.orderId ++ "'"
else if(vars.orderType == 'offline')
	"SELECT * FROM " ++ p('db.schema') ++ "." ++ p('db.table.salesOffline') ++ " WHERE ORDER_ID='" ++ vars.orderId ++ "'"
else null