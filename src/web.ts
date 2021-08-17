import { registerPlugin, WebPlugin } from "@capacitor/core";
import { CapacitorFirebaseDynamicLinksPlugin } from "./definitions";

export class CapacitorFirebaseDynamicLinksWeb
  extends WebPlugin
  implements CapacitorFirebaseDynamicLinksPlugin
{
  constructor() {
    super({
      name: "CapacitorFirebaseDynamicLinks",
      platforms: ["web"],
    });
  }
}

const CapacitorFirebaseDynamicLinks =
  registerPlugin<CapacitorFirebaseDynamicLinksWeb>(
    "CapacitorFirebaseDynamicLinks",
    {
      web: () => new CapacitorFirebaseDynamicLinksWeb(),
    }
  );
export { CapacitorFirebaseDynamicLinks };
