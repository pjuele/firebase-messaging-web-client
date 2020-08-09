#!/bin/bash
curl -X POST -H "Authorization: key=<your_server_key>" -H "Content-Type: application/json" \
   -d '{
  "data": {
    "notification": {
        "title": "FCM Message",
        "body": "This is an FCM Message",
        "icon": "/milesaway.svg",
    }
  },
  "to": "your_token"
}' https://fcm.googleapis.com/fcm/send
