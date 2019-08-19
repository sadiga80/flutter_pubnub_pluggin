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
  
```  dependencies {
    // Add the google services classpath
   classpath 'com.google.gms:google-services:4.3.0'
    } ```

