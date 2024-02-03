
import 'dji_integration_platform_interface.dart';

class DjiIntegration {
  late DjiIntegrationPlatform _djiIntegrationPlatform;

  DjiIntegration() {
    _djiIntegrationPlatform = DjiIntegrationPlatform.instance;
  }

  Future<String?> getPlatformVersion() {
    return _djiIntegrationPlatform.getPlatformVersion();
  }

  Future<void> initRegisterAndConnectionToDrone () async {
    await _djiIntegrationPlatform.initRegisterAndConnectionToDrone();
  }
}
