import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dji_integration_platform_interface.dart';

class MethodChannelDjiIntegration extends DjiIntegrationPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('dji_integration');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> initRegisterAndConnectionToDrone() async {
    await methodChannel.invokeMethod<void>('initRegisterAndConnectionToDrone');
  }
}