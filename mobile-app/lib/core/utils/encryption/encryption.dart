import 'dart:convert';

import 'package:encrypt/encrypt.dart';

import '../../config/app_config.dart';

extension StringEncryptionExtension on String {
  String encrypt() {
    final key = Key.fromUtf8(AppConfig.instance.storageKey);
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);

    final encrypted = encrypter.encrypt(this);

    return encrypted.base64;
  }

  String decrypt() {
    final key = Key.fromUtf8(AppConfig.instance.storageKey);
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);

    return encrypter.decrypt(Encrypted.fromBase64(this));
  }
}

extension BytesEncryptionExtension on List<int> {
  List<int> decryptBytes() {
    final chiperText = base64.encode(this);
    final key = Key.fromUtf8(AppConfig.instance.storageKey);
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(chiperText));

    return decrypted
        .substring(1, decrypted.length - 1)
        .split(', ')
        .map((number) => int.parse(number))
        .toList();
  }
}
