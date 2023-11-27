import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotificacion() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );        

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}

Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails  androidNotificationDetails = AndroidNotificationDetails(
    'channelId', 
    'channelName',
    importance: Importance.max,
    priority: Priority.high
    );
  
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(1, 'Titulo de notificación', 'Esta es una notificación de prueba.', notificationDetails);

  //Esto es para poner notificaciones en IOS
  // const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();
 
  
  
}