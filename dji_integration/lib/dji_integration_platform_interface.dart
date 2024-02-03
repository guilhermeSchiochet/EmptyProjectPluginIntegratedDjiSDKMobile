import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dji_integration_method_channel.dart';

abstract class DjiIntegrationPlatform extends PlatformInterface {

  DjiIntegrationPlatform() : super(token: _token);

  static final Object _token = Object();

  static DjiIntegrationPlatform _instance = MethodChannelDjiIntegration();

  static DjiIntegrationPlatform get instance => _instance;

  static set instance(DjiIntegrationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initRegisterAndConnectionToDrone() {
    throw UnimplementedError('initRegisterAndConnectionToDrone() has not been implemented.');
  }
}
