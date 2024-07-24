var capacitorFirebaseDynamicLinks = (function (exports, core) {
    'use strict';

    class FirebaseDynamicLinksWeb extends core.WebPlugin {
        constructor() {
            super();
        }
    }
    const FirebaseDynamicLinks = core.registerPlugin("FirebaseDynamicLinks", {
        web: () => new FirebaseDynamicLinksWeb(),
    });

    exports.FirebaseDynamicLinks = FirebaseDynamicLinks;
    exports.FirebaseDynamicLinksWeb = FirebaseDynamicLinksWeb;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
