import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../../../core/utils/encryption/encryption.dart';
import '../../../domain/entities/package/package.entity.dart';

class PackageStorageManager {
  late final String _packageKey;
  late final Box _box;

  PackageStorageManager(String packageKey) {
    _packageKey = packageKey;
    _box = Hive.box(_packageKey);
  }

  void cachePackages(List<Package> packages) {
    _box.put(
      _packageKey,
      jsonEncode(packages.map((p) => p.toJson()).toList()).encrypt(),
    );
  }

  List<Package>? getPackages() {
    final cache = _box.get(_packageKey);

    if (cache != null) {
      return (jsonDecode(cache.toString().decrypt()) as List)
          .map((data) => Package.fromJson(data as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<int> clear() async {
    return await _box.clear();
  }
}
