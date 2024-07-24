'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

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
//# sourceMappingURL=plugin.cjs.js.map
