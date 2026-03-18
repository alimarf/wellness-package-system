import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Password': 'Password',
          'Email': 'Email',
        },
        'id_ID': {
          'Password': 'Kata Sandi',
          'Email': 'Email',
        }
      };
}
