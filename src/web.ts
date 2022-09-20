import { registerPlugin, WebPlugin } from "@capacitor/core";
import { FirebaseDynamicLinksPlugin } from "./definitions";

export class FirebaseDynamicLinksWeb
  extends WebPlugin
  implements FirebaseDynamicLinksPlugin
{
  constructor() {
    super();
  }
}

const FirebaseDynamicLinks =
  registerPlugin<FirebaseDynamicLinksWeb>(
    "FirebaseDynamicLinks",
    {
      web: () => new FirebaseDynamicLinksWeb(),
    }
  );
export { FirebaseDynamicLinks };
