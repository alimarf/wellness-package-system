import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/main_repository.dart';

class GetStorageVersion {
  final MainRepository repository;

  GetStorageVersion(this.repository);

  Future<
      Either<RepositoryResponse<String?>,
          RepositoryResponse<String?>>> execute(
      {CancelToken? cancelToken}) {
    return repository.getStorageVersion(
        cancelToken: cancelToken);
  }
}
