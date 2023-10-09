
import 'dji_integration_platform_interface.dart';

class DjiIntegration {
  Future<String?> getPlatformVersion() {
    return DjiIntegrationPlatform.instance.getPlatformVersion();
  }
}
