import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/main_repository.dart';

class SaveDarkModeConfig {
  final MainRepository repository;

  SaveDarkModeConfig(this.repository);

  Future<
      Either<RepositoryResponse<String>,
          RepositoryResponse<String>>> execute(
      {CancelToken? cancelToken,
      required String darkModeConfig}) {
    return repository.saveDarkModeConfig(
        cancelToken: cancelToken, darkModeConfig: darkModeConfig);
  }
}
