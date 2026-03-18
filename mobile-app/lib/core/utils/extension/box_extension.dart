import 'package:hive/hive.dart';

extension BoxExtensions on Box {
  Future<int> deleteByKeyPattern(String pattern) async {
    final keys = this.keys.where(
      (key) => key.toString().startsWith(pattern)
    ).toList();
    
    for (var key in keys) {
      await delete(key);
    }
    
    return keys.length;
  }
  
  Future<int> deleteByKeyRegExp(RegExp regExp) async {
    final keys = this.keys.where(
      (key) => regExp.hasMatch(key.toString())
    ).toList();
    
    for (var key in keys) {
      await delete(key);
    }
    
    return keys.length;
  }

  Future<int> deleteByPrefix(String prefix) async {
    final keysToDelete = keys.where(
      (key) => key.toString().startsWith(prefix)
    ).toList();
    
    for (var key in keysToDelete) {
      await delete(key);
    }
    
    return keysToDelete.length;
  }
}