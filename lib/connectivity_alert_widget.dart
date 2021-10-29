library connectivity_alert_widget;

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

typedef ConnectivityCallback = Function(ConnectivityResult);

class ConnectivityAlertWidget extends StatefulWidget {
  ConnectivityAlertWidget({
    required this.onlineWidget,
    required this.offlineWidget,
    this.onConnectivityResult,
  });

  /// Widget that is shown when the app is online
  final Widget onlineWidget;

  /// Widget that is shown when the app is offline
  final Widget offlineWidget;

  /// Callback called when theres change on the connectivity status
  final ConnectivityCallback? onConnectivityResult;

  @override
  _ConnectivityAlertWidgetState createState() =>
      _ConnectivityAlertWidgetState();
}

class _ConnectivityAlertWidgetState extends State<ConnectivityAlertWidget> {
  late bool isOnline;
  StreamSubscription<ConnectivityResult>? _subscription;

  @override
  void initState() {
    isOnline = true;

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (widget.onConnectivityResult != null) {
        widget.onConnectivityResult!(result);
      }

      setState(() {
        if (result == ConnectivityResult.none) {
          isOnline = false;
        } else {
          isOnline = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isOnline ? widget.onlineWidget : widget.offlineWidget;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
