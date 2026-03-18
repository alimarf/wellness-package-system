import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/main_repository.dart';

class SaveLatestVersion {
  final MainRepository repository;

  SaveLatestVersion(this.repository);

  Future<
      Either<RepositoryResponse<String>,
          RepositoryResponse<String>>> execute(
      {CancelToken? cancelToken,
      required String latestVersion}) {
    return repository.saveLatestVersion(
        cancelToken: cancelToken, latestVersion: latestVersion);
  }
}
