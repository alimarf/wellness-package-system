import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../core/base/base_repository.dart';
import '../../../../../core/base/repository_response/repository_response.dart';
import '../../../../../core/exceptions/server_exception.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/network_info_manager.dart';
import '../../domain/entities/package/package.entity.dart';
import '../data_sources/package_local_data_source.dart';
import '../data_sources/package_remote_data_source.dart';

abstract class PackageRepository {
  Future<
      Either<RepositoryResponse<List<Package>>,
          RepositoryResponse<List<Package>>>> getPackages({
    CancelToken? cancelToken,
  });
}

class PackageRepositoryImpl implements PackageRepository, BaseRepository {
  final PackageRemoteDataSource remoteDataSource;
  final PackageLocalDataSource localDataSource;

  PackageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  NetworkInfoManager get networkInfoManager => Get.find();

  @override
  Future<
      Either<RepositoryResponse<List<Package>>,
          RepositoryResponse<List<Package>>>> getPackages({
    CancelToken? cancelToken,
  }) async {
    try {
      final list = await remoteDataSource.getPackages(cancelToken: cancelToken);
      final packages = list ?? [];
      localDataSource.cachePackages(packages);
      return Right(RepositoryResponse(data: packages));
    } on NetworkException catch (e) {
      final cached = localDataSource.getPackages();
      return Left(RepositoryResponse(
        failure: NetworkFailure(e.message),
        data: cached,
      ));
    } on SocketException {
      final cached = localDataSource.getPackages();
      return Left(RepositoryResponse(
        failure: ConnectionFailure('Connection failed'.tr),
        data: cached,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
