import Foundation
import Capacitor
import FirebaseCore
import FirebaseDynamicLinks

typealias JSObject = [String:Any]

extension Notification.Name {
    public static let firebaseDynamicLink = Notification.Name(rawValue: "FirebaseDynamicLink")
}

@objc(CapacitorFirebaseDynamicLinks)
public class CapacitorFirebaseDynamicLinks: CAPPlugin {

    public override func load() {
        if (FirebaseApp.app() == nil) {
            FirebaseApp.configure()
        }

        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUrlOpened(notification:)), name: Notification.Name.capacitorOpenURL, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUniversalLink(notification:)), name: Notification.Name.firebaseDynamicLink, object: nil)
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
