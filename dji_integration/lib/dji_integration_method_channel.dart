import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dji_integration_platform_interface.dart';

/// An implementation of [DjiIntegrationPlatform] that uses method channels.
class MethodChannelDjiIntegration extends DjiIntegrationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dji_integration');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
