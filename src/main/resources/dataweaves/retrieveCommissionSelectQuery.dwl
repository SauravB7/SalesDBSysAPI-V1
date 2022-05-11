%dw 2.0
output application/java
---
"SELECT * FROM " ++ p('db.schema') ++ "." ++ p('db.table.orderCommissions') ++ " WHERE ORDER_ID = '" ++ vars.orderId ++ "'" 