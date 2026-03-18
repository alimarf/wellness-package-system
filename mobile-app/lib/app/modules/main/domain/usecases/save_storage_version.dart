import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/main_repository.dart';

class SaveStorageVersion {
  final MainRepository repository;

  SaveStorageVersion(this.repository);

  Future<
      Either<RepositoryResponse<String>,
          RepositoryResponse<String>>> execute(
      {CancelToken? cancelToken,
      required String storageVersion}) {
    return repository.saveStorageVersion(
        cancelToken: cancelToken, storageVersion: storageVersion);
  }
}
