import 'package:get/get.dart';

import '../services/network_info_manager.dart';

abstract class BaseRepository {
  final NetworkInfoManager networkInfoManager = Get.find<NetworkInfoManager>();
}
