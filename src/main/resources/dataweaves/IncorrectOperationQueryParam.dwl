%dw 2.0
output application/json
---
{
    "transactionNotification": {
        "transactionCode": "E",
        "transactionStatus": "Error",
        "remarks": [{
                "messageCode": "UAP-APP-501",
                "messageText": "Please send correct value for Operation Query Parameter."
            }
        ]
    }
}