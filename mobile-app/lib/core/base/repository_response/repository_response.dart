import '../../failure/failure.dart';

class RepositoryResponse<T> {
  final Failure? failure;
  final T? data;
  final int? storedAt;

  RepositoryResponse({this.data, this.failure, this.storedAt});
}
