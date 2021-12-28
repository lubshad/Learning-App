// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/domain/params/get_link_params.dart';
import 'package:learning_app/domain/params/webview_arguments.dart';
import 'package:learning_app/domain/usecases/get_link_type.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:learning_app/utils/url_launcher_services.dart';

const String notificationTopic = kDebugMode ? "test" : "learning_app";

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 6));
  handlePayload(message.data["link"]);
  consoleLog('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
  enableVibration: true,
  showBadge: true,
);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

setupNotification() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (Platform.isIOS) {
    firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        announcement: false);
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  consoleLog(settings.authorizationStatus);

  firebaseMessaging.getInitialMessage().then((RemoteMessage? message) async {
    if (message != null) {
      await Future.delayed(const Duration(seconds: 6));
      handlePayload(message.data["link"]);
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification!;
    AndroidNotification android = message.notification!.android!;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@drawable/ic_notification',
              playSound: true,
              enableVibration: true,
              channelShowBadge: true,
              priority: Priority.high,
            ),
          ));
    }
    handlePayload(message.data["link"]);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    handlePayload(message.data["link"]);
  });

  fcmSubscribe();
}

void fcmSubscribe({String topic = notificationTopic}) {
  firebaseMessaging.subscribeToTopic(topic);
}

void fcmUnSubscribe({String topic = notificationTopic}) {
  firebaseMessaging.unsubscribeFromTopic(topic);
}

Future<String> getToken() async {
  String? token = await firebaseMessaging.getToken();
  return token!;
}

handlePayload(String link) async {
  consoleLog(link);
  String? catId;
  String? stockId;
  String? name;
  String? offerId;
  String? type;
  String? subcatId;
  String? orderId;
  GetLinkType getLinkType = Get.find();
  final response = await getLinkType(GetLinkParams(link: link));
  response.fold((l) => l.handleError(), (r) {
    consoleLog(r.toJson());
    if (r.status == 1) {
      orderId = r.data?.orderId;
      catId = r.data?.catId;
      stockId = r.data?.stockId;
      name = r.data?.name;
      type = r.data?.type;
      subcatId = r.data?.subcatId;
      offerId = r.data?.offerId;
      handleType(
        name: name,
        type: type,
        catId: catId,
        subcatId: subcatId,
        stockId: stockId,
        offerId: offerId,
        link: link,
        orderId: orderId,
      );
    }
  });
}

handleType(
    {String? type, catId, subcatId, stockId, offerId, link, name, orderId}) {
  if (type == "product_details") {
    ProductEntity productEntity = ProductEntity(stockId: stockId);
    Get.toNamed(RouteList.productDetailsScreen, arguments: productEntity);
  }
  if (type == "my-orders") {
    Get.toNamed(RouteList.myOrderDetails, arguments: orderId);
  }
  if (type == "product_list" || type == "category") {}
  if (type == "department") {}
  if (type == "offer") {
    Get.toNamed(RouteList.offersProducts);
  }
  if (type == "home") {}
  if (type == "internal") {
    Get.toNamed(RouteList.webView,
        arguments: WebViewArguments(title: name, url: link));
  }
  if (type == "external") {
    UrlLauncherServices.launchInBrowser(link);
  }
}
