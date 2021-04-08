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

        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUrlOpened(notification:)), name: Notification.Name(CAPNotifications.URLOpen.name()), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUniversalLink(notification:)), name: Notification.Name(CAPNotifications.UniversalLinkOpen.name()), object: nil)
    }
    
    
    @objc func handleUrlOpened(notification: NSNotification) {
        guard let object = notification.object as? [String:Any?] else {
            return
        }

        if DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: object["url"] as! URL) != nil {
            let params = (object["url"] as? NSURL)?.query ?? ""
            let path = (object["url"] as? NSURL)?.path ?? ""
            self.sendNotification(path: path, params: params)
        }
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
