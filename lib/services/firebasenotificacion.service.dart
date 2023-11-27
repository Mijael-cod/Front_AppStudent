// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:proyecto/services/notificaciones.service.dart';


// FirebaseMessaging messaging = FirebaseMessaging.instance;

// Future<void> setupPushNotifications() async {
//   // Solicita permisos de notificación si es necesario
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('Usuario autorizado para recibir notificaciones push');
//   } else {
//     print('Usuario NO autorizado para recibir notificaciones push');
//   }

//   // Maneja los mensajes entrantes cuando la aplicación está en primer plano
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;

//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'channelId',
//               'channelName',
//               importance: Importance.max,
//               priority: Priority.high,
//             ),
//           ));
//     }
//   });

//   // Maneja los mensajes entrantes cuando la aplicación está en segundo plano o terminada
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Un nuevo mensaje fue abierto en la app: ${message.messageId}');
//   });
// }