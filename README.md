# capacitor-firebase-dynamic-links

[![npm version](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links.svg)](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links)

Capacitor plugin for [Firebase Dynamic Links](https://firebase.google.com/docs/dynamic-links)

## Installation

```
npm i @joinflux/capacitor-firebase-dynamic-links
```

### Android

Unknown, at the moment we have not tested the implementation on Android.

### iOS

Nothing more needed

### Web

None

## Methods

### AddListener

Add this method when the app starts to listen for the dynamic link.

```js
CapacitorFirebaseDynamicLinks.addListener('deepLinkOpen', (data: { url: string }) => {
  // Implement your navigation handler
})
```
