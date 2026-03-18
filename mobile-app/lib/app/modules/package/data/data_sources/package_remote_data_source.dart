import 'package:dio/dio.dart';

import '../../../../../core/exceptions/server_exception.dart';
import '../../domain/entities/package/package.entity.dart';
import 'network_manager/package_network_manager.dart';

abstract class PackageRemoteDataSource {
  Future<List<Package>?> getPackages({CancelToken? cancelToken});
}

class PackageRemoteDataSourceImpl implements PackageRemoteDataSource {
  final PackageNetworkManager networkManager;

  PackageRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<List<Package>?> getPackages({CancelToken? cancelToken}) async {
    try {
      final response = await networkManager.getPackages();
      return response.data;
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
