import 'package:connectivity_alert_widget/connectivity_alert_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Connectivity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConnectivityAlertWidget(
              onlineWidget:
                  Icon(Icons.network_wifi, color: Colors.green, size: 280),
              offlineWidget:
                  Icon(Icons.signal_wifi_off, color: Colors.red, size: 280),
              onConnectivityResult: (connectivity) => print(connectivity),
            ),
          ],
        ),
      ),
    );
  }
}
