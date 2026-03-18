import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/base/repository_response/repository_response.dart';
import '../../data/repositories/package_repository.dart';
import '../entities/package/package.entity.dart';

class GetPackages {
  final PackageRepository repository;

  GetPackages(this.repository);

  Future<
    Either<RepositoryResponse<List<Package>>, RepositoryResponse<List<Package>>>
  >
  execute() {
    return repository.getPackages();
  }
}
