import { registerPlugin, WebPlugin } from "@capacitor/core";
export class FirebaseDynamicLinksWeb extends WebPlugin {
    constructor() {
        super();
    }
}
const FirebaseDynamicLinks = registerPlugin("FirebaseDynamicLinks", {
    web: () => new FirebaseDynamicLinksWeb(),
});
export { FirebaseDynamicLinks };
//# sourceMappingURL=web.js.map