package com.joinflux.flux.capacitorfirebasedynamiclinks;

import android.content.Intent;
import android.net.Uri;
import com.getcapacitor.JSObject;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.dynamiclinks.FirebaseDynamicLinks;
import com.google.firebase.dynamiclinks.PendingDynamicLinkData;

import android.util.Log;

import androidx.annotation.NonNull;

import static android.content.ContentValues.TAG;

@CapacitorPlugin()
public class CapacitorFirebaseDynamicLinks extends Plugin {

    private static final String EVENT_DEEP_LINK = "deepLinkOpen";

    public void load () {
        Log.println(1, "DynamicLinks", "plugin loaded");
    }

    @Override
    protected void handleOnNewIntent(Intent intent) {
        super.handleOnNewIntent(intent);

        FirebaseDynamicLinks.getInstance()
                .getDynamicLink(intent)
                .addOnSuccessListener(getActivity(), new OnSuccessListener<PendingDynamicLinkData>() {
                    @Override
                    public void onSuccess(PendingDynamicLinkData pendingDynamicLinkData) {
                        Uri deepLink = null;
                        if (pendingDynamicLinkData != null) {
                            deepLink = pendingDynamicLinkData.getLink();
                        }

                        if (deepLink != null) {
                            JSObject ret = new JSObject();
                            ret.put("slug", deepLink.getPath());
                            ret.put("query", deepLink.getQuery());
                            notifyListeners(EVENT_DEEP_LINK, ret, true);
                        }
                    }
                })
                .addOnFailureListener(getActivity(), new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        Log.w(TAG, "getDynamicLink:onFailure", e);
                    }
                });
    }
}
