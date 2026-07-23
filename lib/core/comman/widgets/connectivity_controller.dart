import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  Future<void> init() async {
    final List<ConnectivityResult> result = await Connectivity()
        .checkConnectivity();
    _isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(_isInternetConnected);
  }

  void _isInternetConnected(List<ConnectivityResult> result) {
    isConnected.value = result.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi,
    );
  }
}
