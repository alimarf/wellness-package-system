import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../core/base/base_repository.dart';
import '../../../../../core/base/repository_response/repository_response.dart';
import '../../../../../core/services/network_info_manager.dart';
import '../data_sources/main_local_data_source.dart';

abstract class MainRepository {
  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveStorageVersion(
          {required String storageVersion, CancelToken? cancelToken});
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getStorageVersion({CancelToken? cancelToken});
  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveDarkModeConfig(
          {required String darkModeConfig, CancelToken? cancelToken});
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getDarkModeConfig({CancelToken? cancelToken});

  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveLatestVersion(
          {required String latestVersion, CancelToken? cancelToken});
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getLatestVersion({CancelToken? cancelToken});
}

class MainRepositoryImpl implements MainRepository, BaseRepository {
  final MainLocalDataSource localDataSource;

  MainRepositoryImpl({
    required this.localDataSource,
  });

  @override
  NetworkInfoManager get networkInfoManager => Get.find();

  @override
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getStorageVersion({CancelToken? cancelToken}) async {
    try {
      final result = await localDataSource.getStorageVersion();
      return Right(RepositoryResponse(data: result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveStorageVersion(
          {required String storageVersion, CancelToken? cancelToken}) async {
    try {
      localDataSource.cacheStorageVersion(storageVersion);
      return Right(RepositoryResponse(data: storageVersion));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getDarkModeConfig({CancelToken? cancelToken}) async {
    try {
      final result = await localDataSource.getDarkModeConfig();
      return Right(RepositoryResponse(data: result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveDarkModeConfig(
          {required String darkModeConfig, CancelToken? cancelToken}) async {
    try {
      localDataSource.cacheDarkModeConfig(darkModeConfig);
      return Right(RepositoryResponse(data: darkModeConfig));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<RepositoryResponse<String?>, RepositoryResponse<String?>>>
      getLatestVersion({CancelToken? cancelToken}) async {
    try {
      final result = await localDataSource.getLatestVersion();
      return Right(RepositoryResponse(data: result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<RepositoryResponse<String>, RepositoryResponse<String>>>
      saveLatestVersion(
          {required String latestVersion, CancelToken? cancelToken}) async {
    try {
      localDataSource.cacheLatestVersion(latestVersion);
      return Right(RepositoryResponse(data: latestVersion));
    } catch (e) {
      rethrow;
    }
  }
}
