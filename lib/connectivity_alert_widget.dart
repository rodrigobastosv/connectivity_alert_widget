library connectivity_alert_widget;

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

typedef ConnectivityCallback = Function(ConnectivityResult);

class ConnectivityAlertWidget extends StatefulWidget {
  ConnectivityAlertWidget({
    @required this.onlineWidget,
    @required this.offlineWidget,
    this.onConnectivityResult,
  })  : assert(onlineWidget != null),
        assert(offlineWidget != null);

  final Widget onlineWidget;
  final Widget offlineWidget;
  final ConnectivityCallback onConnectivityResult;

  @override
  _ConnectivityAlertWidgetState createState() =>
      _ConnectivityAlertWidgetState();
}

class _ConnectivityAlertWidgetState extends State<ConnectivityAlertWidget> {
  bool isOnline;
  StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState() {
    isOnline = true;

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      widget.onConnectivityResult(result);
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
    _subscription.cancel();
    super.dispose();
  }
}
