import Foundation
import Capacitor
import FirebaseCore
import FirebaseDynamicLinks

typealias JSObject = [String:Any]

@objc(CapacitorFirebaseDynamicLinks)
public class CapacitorFirebaseDynamicLinks: CAPPlugin {

    public override func load() {
        if (FirebaseApp.app() == nil) {
            FirebaseApp.configure()
        }

        var universalLinkNotificationName = Notification.Name.capacitorOpenUniversalLink

        let config = self.getConfig()
        let universalLinkConfig = config.getString("universalLinksNotificationName")
        if (universalLinkConfig != nil) {
            universalLinkNotificationName = Notification.Name(universalLinkConfig!)
        }

        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUrlOpened(notification:)), name: Notification.Name.capacitorOpenURL, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUniversalLink(notification:)), name: universalLinkNotificationName, object: nil)
    }

    @objc func handleUrlOpened(notification: NSNotification) {
        guard let object = notification.object as? [String:Any?] else {
            return
        }

        guard let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: object["url"] as! URL) else {
            return
        }

        let params = dynamicLink.url?.query ?? ""
        let path = dynamicLink.url?.path ?? ""
        self.sendNotification(path: path, params: params)
    }

    @objc func handleUniversalLink(notification: NSNotification) {
        guard let object = notification.object as? [String:Any?] else {
            return
        }

        DynamicLinks.dynamicLinks().handleUniversalLink(object["url"] as! URL) { (dynamiclink, error) in
            let params = dynamiclink?.url?.query ?? ""
            let path = dynamiclink?.url?.path ?? ""
            self.sendNotification(path: path, params: params)
        }
    }

    func sendNotification(path: String, params: String) {
        let data = ["slug": path, "query": params ]
        self.notifyListeners("deepLinkOpen", data: data, retainUntilConsumed: true)
    }
}
