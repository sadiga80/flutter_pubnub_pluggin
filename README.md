# flutter_pubnub

A Flutter plugin for pubnub. Supports iOS and Android.

## Usage
To use this plugin, add 
```flutter_pubnub: git: url: ssh://git@github.com/AdvancedThreatAnalytics/flutter_pubnub```
as as a dependency in your pubspec.yaml file.

This plugin uses `firebase` for recieving push notifications.

## Android Integration

To add `firebase` into the Android part of your app, follow these steps:

Using the Firebase Console add an Android app to your project: Follow the assistant, download the generated google-services.json file and place it inside android/app.

Add the classpath to the [project]/android/build.gradle file.

```
dependencies {
    // Add the google services classpath
   classpath 'com.google.gms:google-services:4.3.0'
   } 
```
   
    
Add the apply plugin to the [project]/android/app/build.gradle file.

```apply plugin: 'com.google.gms.google-services'```

If want to be notified in your app (via onResume and onLaunch, see below) when the user clicks on a notification in the system tray include the following intent-filter within the <activity> tag of your android/app/src/main/AndroidManifest.xml:
 
 ``` 
 <intent-filter>
      <action android:name="MOBILESOC_NOTIFICATION_CLICK" />
      <category android:name="android.intent.category.DEFAULT" />
  </intent-filter>
  ```
## iOS Integration 

To add `firebase` into the iOS part of your app, follow these steps:

Using the Firebase Console add an iOS app to your project: Follow the assistant, download the generated `GoogleService-Info.plist` file, open `ios/Runner.xcworkspace` with Xcode, and within Xcode place the file inside `ios/Runner`. 

In Xcode, select Runner in the Project Navigator. In the Capabilities Tab turn on `Push Notifications` and `Background Modes`, and enable `Background fetch` and `Remote notifications` under `Background Modes`.

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

