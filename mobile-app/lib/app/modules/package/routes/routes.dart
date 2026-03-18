// ignore_for_file: constant_identifier_names

part of 'pages.dart';

abstract class PackageRoutes {
  PackageRoutes._();
  static const PACKAGES = _PackagePaths.PACKAGES;
}

abstract class _PackagePaths {
  _PackagePaths._();
  static const PACKAGES = '/packages';
}
