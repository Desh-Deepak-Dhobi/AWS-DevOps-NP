fields @timestamp, @message
| filter @message like "ERROR"
| sort @timestamp desc
| limit 20
