import 'dart:async';

import 'package:flutter/material.dart';

class DoubleBackToCloseApp extends StatefulWidget {
  final SnackBar snackBar;
  final Widget child;
  const DoubleBackToCloseApp({
    Key? key,
    required this.snackBar,
    required this.child,
  }) : super(key: key);

  @override
  DoubleBackToCloseAppState createState() => DoubleBackToCloseAppState();
}

class DoubleBackToCloseAppState extends State<DoubleBackToCloseApp> {
  /// Completer untuk check apakah snackbar sudah ditutup atau belum.
  /// Dan jika sudah ditutup maka aplikasi akan keluar
  var _closedCompleter = Completer<SnackBarClosedReason>()
    ..complete(SnackBarClosedReason.remove);
  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;
  bool get _isSnackBarVisible => !_closedCompleter.isCompleted;
  bool get _willHandlePopInternally =>
      ModalRoute.of(context)?.willHandlePopInternally ?? false;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    if (_isSnackBarVisible || _willHandlePopInternally) {
      return true;
    } else {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.hideCurrentSnackBar();
      _closedCompleter = scaffoldMessenger
          .showSnackBar(widget.snackBar)
          .closed
          .wrapInCompleter();
      return false;
    }
  }
}

extension<T> on Future<T> {
  Completer<T> wrapInCompleter() {
    final completer = Completer<T>();
    then(completer.complete).catchError(completer.completeError);
    return completer;
  }
}