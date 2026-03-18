import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/get_packages/response/get_package_response.entity.dart';


part 'package_network_manager.g.dart';

@RestApi()
abstract class PackageNetworkManager {
  factory PackageNetworkManager(Dio dio) = _PackageNetworkManager;

  @GET('/api/mobile/packages')
  Future<GetPackageResponse> getPackages();
}
