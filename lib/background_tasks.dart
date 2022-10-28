

import 'package:firebase_messaging/firebase_messaging.dart';

/// onFirebaseBackgroundMessage
/// See https://firebase.google.com/docs/cloud-messaging/flutter/receive#apple_platforms_and_android
/// 
/// Since the handler runs in its own isolate outside your applications context it is
/// not possible to update application state or execute any UI impacting logic. You
/// can, however, perform logic such as HTTP requests, perform IO operations (e.g.
/// updating local storage), communicate with other plugins etc.
/// 
/// It is also recommended to complete your logic as soon as possible. Running long, 
/// intensive tasks impacts device performance and may cause the OS to terminate the
/// process. If tasks run for longer than 30 seconds, the device may automatically 
/// kill the process.
/// 
/// 

@pragma('vm:entry-point')
Future<void> onFirebaseBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  print('${message.data}');
}