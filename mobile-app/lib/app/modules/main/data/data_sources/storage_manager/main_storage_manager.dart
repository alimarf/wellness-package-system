
import 'package:hive/hive.dart';

import '../../../../../../core/utils/encryption/encryption.dart';

class MainStorageManager {
  late final String _mainKey;
  late final Box _box;

  MainStorageManager(String mainKey) {
    _mainKey = mainKey;
    _box = Hive.box(_mainKey);
  }

  void cacheStorageVersion(String storageVersion) {
    _box.put('$_mainKey-storage-version', storageVersion.encrypt());
  }

  String? getStorageVersion() {
    final cache = _box.get('$_mainKey-storage-version');

    if (cache != null) {
      return cache.toString().decrypt();
    } else {
      return null;
    }
  }

  void cacheDarkModeConfig(String darkModeConfig) {
    _box.put('$_mainKey-dark-mode-config', darkModeConfig.encrypt());
  }

  String? getDarkModeConfig() {
    final cache = _box.get('$_mainKey-dark-mode-config');

    if (cache != null) {
      return cache.toString().decrypt();
    } else {
      return null;
    }
  }

  void cacheBiometricsConfig(String biometricsConfig) {
    _box.put('$_mainKey-biometrics-config', biometricsConfig.encrypt());
  }

  String? getBiometricsConfig() {
    final cache = _box.get('$_mainKey-biometrics-config');

    if (cache != null) {
      return cache.toString().decrypt();
    } else {
      return null;
    }
  }

  void cacheLatestVersion(String version) {
    _box.put('$_mainKey-version', version.encrypt());
  }

  String? getLatestVersion() {
    final cache = _box.get('$_mainKey-version');

    if (cache != null) {
      return cache.toString().decrypt();
    } else {
      return null;
    }
  }

  Future<int> clear() async {
    return await _box.clear();
  }
}
