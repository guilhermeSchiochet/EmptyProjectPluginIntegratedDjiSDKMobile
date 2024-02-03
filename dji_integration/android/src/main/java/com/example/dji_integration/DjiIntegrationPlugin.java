    package com.example.dji_integration;

    import android.app.Application;
    import android.content.Context;
    import android.util.Log;

    import androidx.annotation.NonNull;

    import com.secneo.sdk.Helper;

    import dji.v5.common.error.IDJIError;
    import dji.v5.common.register.DJISDKInitEvent;
    import dji.v5.manager.SDKManager;
    import dji.v5.manager.interfaces.SDKManagerCallback;
    import io.flutter.embedding.engine.plugins.FlutterPlugin;
    import io.flutter.plugin.common.MethodCall;
    import io.flutter.plugin.common.MethodChannel;
    import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
    import io.flutter.plugin.common.MethodChannel.Result;

    /** DjiIntegrationPlugin */
    public class DjiIntegrationPlugin implements FlutterPlugin, MethodCallHandler {
        private final String TAG = getClass().getSimpleName();

        private MethodChannel channel;

        private Context applicationContext;

        @Override
        public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
            Helper.install((Application) flutterPluginBinding.getApplicationContext());

            this.channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "dji_integration");
            this.channel.setMethodCallHandler(this);

            this.applicationContext = flutterPluginBinding.getApplicationContext();
        }

        @Override
        public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
            if (call.method.equals("getPlatformVersion")) {
                result.success("Android " + android.os.Build.VERSION.RELEASE);
            } else if (call.method.equals("initRegisterAndConnectionToDrone")) {
                initRegisterAndConnectionToDrone();
            } else {
                result.notImplemented();
            }
        }

        @Override
        public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
            channel.setMethodCallHandler(null);
        }

        /*
            Attention! This method will not work yet; specific modifications are required in the project.
            Some configurations must be made in the build.gradle & AndroidManifest files.

            For more information, refer to:
            [DJI Documentation](https://developer.dji.com/doc/mobile-sdk-tutorial/en/)
         */
        public void initRegisterAndConnectionToDrone ()  {
            SDKManager.getInstance().init(
                applicationContext,
                new SDKManagerCallback() {
                    @Override
                    public void onInitProcess(DJISDKInitEvent event, int totalProcess) {
                        Log.i(TAG, "onInitProcess: ");
                        if (event == DJISDKInitEvent.INITIALIZE_COMPLETE) {
                            SDKManager.getInstance().registerApp();
                        }
                    }

                    @Override
                    public void onRegisterSuccess() {
                        Log.i(TAG, "onRegisterSuccess: ");
                    }

                    @Override
                    public void onRegisterFailure(IDJIError error) {
                        Log.i(TAG, "onRegisterFailure: ");
                    }

                    @Override
                    public void onProductConnect(int productId) {
                        Log.i(TAG, "onProductConnect: ");
                    }

                    @Override
                    public void onProductDisconnect(int productId) {
                        Log.i(TAG, "onProductDisconnect: ");
                    }

                    @Override
                    public void onProductChanged(int productId) {
                        Log.i(TAG, "onProductChanged: ");
                    }

                    @Override
                    public void onDatabaseDownloadProgress(long current, long total) {
                        Log.i(TAG, "onDatabaseDownloadProgress: " + (current / total));
                    }
                }
            );
        }
    }
