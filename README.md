# flutter_pubnub

A Flutter plugin for pubnub. Supports iOS and Android.

## Usage
To use this plugin, add 
```flutter_pubnub: git: url: ssh://git@github.com/AdvancedThreatAnalytics/flutter_pubnub```
as as a dependency in your pubspec.yaml file.

### Methods to use 

Create a `pubnub` class which will be a instance of the `flutter_pubnub` pluggin. And initialize it using `Configure` method.

```
void configure() async {
    final List<String> channels = ['channel 1', 'channel 2'];
    final String pubKey = 'your pubnub key';
    final String subKey = 'your subscription key';
    final String authKey =
        'your authorization key';
    String fcmToken;

    if (Platform.isAndroid) {
      FirebaseMessaging fcm = FirebaseMessaging();
      fcmToken = await fcm.getToken();
    }

    fpn.configure(
      publishKey: pubKey,
      subscribeKey: subKey,
      channels: channels,
      authKey: authKey,
      fcmToken: fcmToken,
      onMessage: onMessageHandler,
      onLaunch: onLaunchHandler,
      onResume: onResumeHandler,
    );

    fpn.requestNotificationPermissions();
  }
  ```
