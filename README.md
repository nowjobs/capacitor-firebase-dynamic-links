# capacitor-firebase-dynamic-links

[![npm version](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links.svg)](https://badge.fury.io/js/%40joinflux%2Fcapacitor-firebase-dynamic-links)

Capacitor plugin for [Firebase Dynamic Links](https://firebase.google.com/docs/dynamic-links)

## Installation

```
npm i @joinflux/capacitor-firebase-dynamic-links
```

### Versioning

- Version 0.2.0 or lower will target the latest Capacitor version
  - Capacitor 3 is recommended for this version
- Version 1.x.x will target Capacitor 4
- Version 2.x.x will target Capacitor 5

### Android

Unknown, at the moment we have not tested the implementation on Android.

### iOS

Nothing more needed

### Web

None

## Configuration

| Name                     | Type     | Description                                                                                                                   |
| ------------------------ | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| universalLinksNotificationName | string | (IOS only) Overrides the default notification name used by Capacitor. Override this if you have other plugins (e.g. Apps Flyer) that also use deep links. See more info below |

Provide configuration in root `capacitor.config.json`

```json
{
  "plugins": {
    "FirebaseDynamicLinks": {
      "universalLinksNotificationName": "firebaseOpenUniversalLink"
    }
  }
}
```

or in `capacitor.config.ts`

```ts
const config: CapacitorConfig = {
  plugins: {
    FirebaseDynamicLinks: {
      universalLinksNotificationName: 'firebaseOpenUniversalLink',
    },
  },
};
```

### (IOS only) Additional set up for `universalLinksNotificationName`

If you use this configuration, you need to intercept Firebase Dynamic links in your `AppDelegate.swift` file. For example:

``` swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    ...omitted for brevity

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // To get Firebase dynamic links to play along nicely with Apps Flyer,
        // we intercept them and use a custom notification name
        let url = userActivity.webpageURL?.absoluteString
        if (url != nil && isFirebaseDynamicLink(url: url!)) {
            // The notification name has to match what you've specified in your Capacitor config
            NotificationCenter.default.post(name: Notification.Name("firebaseOpenUniversalLink"), object: [
                "url": userActivity.webpageURL
            ])
            return true
        }

        // Called when the app was launched with an activity, including Universal Links.
        // Feel free to add additional processing here, but if you want the App API to support
        // tracking app url opens, make sure to keep this call
        return ApplicationDelegateProxy.shared.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }

    func isFirebaseDynamicLink(url: String) -> Bool {
        return url.hasPrefix("https://your-firebase-links.page.link")
    }
}
```

## Methods

### AddListener

Add this method when the app starts to listen for the dynamic link.

```js
CapacitorFirebaseDynamicLinks.addListener(
  'deepLinkOpen',
  (data: { url: string }) => {
    // Implement your navigation handler
  },
);
```
