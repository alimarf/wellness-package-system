import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/main_repository.dart';

class GetLatestVersion {
  final MainRepository repository;

  GetLatestVersion(this.repository);

  Future<
      Either<RepositoryResponse<String?>,
          RepositoryResponse<String?>>> execute(
      {CancelToken? cancelToken}) {
    return repository.getLatestVersion(
        cancelToken: cancelToken);
  }
}
