Firebase Cloud Messaging For Client base Web Application
===================================

The Firebase Cloud Messaging  demonstrates how to:
- Request permission to send app notifications to the user.
- Receive FCM messages using the Firebase Cloud Messaging using JavaScript.

Introduction
------------

[Read more about Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/)

Getting Started
---------------

1. Create your project in the Firebase Console by following 
[**Step 1: Create a Firebase Project**](https://firebase.google.com/docs/web/setup/#create-firebase-project)
1. Register a web app by following 
[**Step 2: Register your app with Firebase**](https://firebase.google.com/docs/web/setup/#create-firebase-project).
     1. You don't need to add Hosting right now, and you can skip the "Add Firebase SDK" step in the console's "Add Firebase to your web app" flow.
     1. Remember to click "Register App" or "Continue to console" at the bottom of the "Add Firebase to your web app" flow.
1. Open Project and go to **Project settings > Cloud Messaging** and there in section **Web configuration** click **Generate key pair** button.
1. Copy Firebase configuration setting into `index.html` & firebase messaging sw js file

1. Use the generated Instance ID token (IID Token) to send an HTTP request to FCM that delivers the message to the web application, inserting appropriate values for [`YOUR-SERVER-KEY`](https://console.firebase.google.com/project/_/settings/cloudmessaging) and `YOUR-IID-TOKEN`.

NOTE: If your payload has a `notification` object, `setBackgroundMessageHandler` will not trigger. Read [here](https://firebase.google.com/docs/cloud-messaging/js/receive) for more information.

Service worker will not work on file server . it will be work on https server or local server

Testing url Will be - http://localhost/firebase/index.html

### send FcM using cURL CLI
```
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
```

### App focus
When the app has the browser focus, the received message is handled through
the `onMessage` callback in `index.html`. When the app does not have browser
focus then the `setBackgroundMessageHandler` callback in `firebase-messaging-sw.js`
is where the received message is handled.

The browser gives your app focus when both:

1. Your app is running in the currently selected browser tab.
2. The browser tab's window currently has focus, as defined by the operating system.

Support
-------

https://firebase.google.com/support/

License
-------

© Google, 2016. Licensed under an [Apache-2](../LICENSE) license.