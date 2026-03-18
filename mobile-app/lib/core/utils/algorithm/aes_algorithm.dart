import 'package:encrypt/encrypt.dart';

import '../../config/app_config.dart';

final initializationVector = IV.fromBase64(AppConfig.instance.initializationVector);
final secretKey = Key.fromBase64(AppConfig.instance.secretKey);
final staticKey = AppConfig.instance.staticKey;

extension EncryptionExtension on String {
  String encrypt() {
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc, padding: 'PKCS7'));
    return encrypter.encrypt(this, iv: initializationVector).base64;
  }

  String decrypt() {
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc, padding: 'PKCS7'));
    return encrypter.decrypt64(this, iv: initializationVector);
  }

  String toKey(){
    String encodedString = "${staticKey}_$this";
    return encodedString.encrypt();
  }
}

extension EncryptionIntExtension on int {
  String encrypt() {
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc, padding: 'PKCS7'));
    return encrypter.encrypt('$this', iv: initializationVector).base64;
  }

  String decrypt() {
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc, padding: 'PKCS7'));
    return encrypter.decrypt64('$this', iv: initializationVector);
  }
}