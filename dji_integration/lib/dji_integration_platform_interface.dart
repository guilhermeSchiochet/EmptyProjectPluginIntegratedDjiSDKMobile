import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dji_integration_method_channel.dart';

abstract class DjiIntegrationPlatform extends PlatformInterface {
  /// Constructs a DjiIntegrationPlatform.
  DjiIntegrationPlatform() : super(token: _token);

  static final Object _token = Object();

  static DjiIntegrationPlatform _instance = MethodChannelDjiIntegration();

  /// The default instance of [DjiIntegrationPlatform] to use.
  ///
  /// Defaults to [MethodChannelDjiIntegration].
  static DjiIntegrationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DjiIntegrationPlatform] when
  /// they register themselves.
  static set instance(DjiIntegrationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
