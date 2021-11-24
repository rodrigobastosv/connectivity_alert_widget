<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

A package to simplify the task of showing users whether they are online or offline  
 
## Using
  
The package has the ConnectivityAlertWidget, to use it only pass the widget to show when online and the widget to show when offline.
The package abstract all of the hard work.

```dart
ConnectivityAlertWidget(
  onlineWidget: Icon(Icons.network_wifi, color: Colors.green, size: 280),
  offlineWidget: Icon(Icons.signal_wifi_off, color: Colors.red, size: 280),
  onConnectivityResult: (connectivity) => print(connectivity),
)
```

You can choose anything to be your onlineWidget or offlineWidget but it's recomended to use something that easily inform the user
about her current online status.

![Example](https://media.giphy.com/media/ZF35k5v5o8NDJKDRzy/giphy.gif)

If you want to do anything when there's connectivity changes, you can implement onConnectivityResult, as it gives you a callback to be executed on every connectivity change.
