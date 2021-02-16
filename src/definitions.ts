import { PluginListenerHandle } from "@capacitor/core";

declare module "@capacitor/core" {
  interface PluginRegistry {
    CapacitorFirebaseDynamicLinks: CapacitorFirebaseDynamicLinksPlugin;
  }
}

export interface CapacitorFirebaseDynamicLinksPlugin {
  addListener(eventName: 'deepLinkOpen', listenerFunc: (data: DeepLinkOpen) => void): PluginListenerHandle;
}

export interface DeepLinkOpen {
  slug: string
  query: string
}
