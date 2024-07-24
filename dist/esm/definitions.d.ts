import { PluginListenerHandle } from "@capacitor/core";
export interface FirebaseDynamicLinksPlugin {
    addListener(eventName: "deepLinkOpen", listenerFunc: (data: DeepLinkOpen) => void): PluginListenerHandle;
}
export interface DeepLinkOpen {
    slug: string;
    query: string;
}
