# capacitor-firebase-dynamic-links

[![npm version](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links.svg)](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links)

Capacitor plugin for [Firebase Dynamic Links](https://firebase.google.com/docs/dynamic-links)

## Installation

```
npm i @joinflux/capacitor-firebase-dynamic-links
```


### iOS Configuration

1. Import the Firebase module in your `UIApplicationDelegate`:

```
import Firebase
```

2. Configure a FirebaseApp shared instance, typically in your app's `application:didFinishLaunchingWithOptions:` method:

```
FirebaseApp.configure()
```

For advanced options please refer https://firebase.google.com/docs/dynamic-links/ios/create


### Web

None

## Methods

### CapacitorFirebaseDynamicLinks.addListener('deepLinkOpen', (data: { url: string })

Add this method when the app starts to listen for the dynamic link.

```js
CapacitorFirebaseDynamicLinks.addListener('deepLinkOpen', (data: { url: string }) => {
  // Implement your navigation handler
})
```
