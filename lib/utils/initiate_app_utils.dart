import 'package:learning_app/di/di.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_messaging.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  DependencyInjection.init();
  setSystemOverlay();
  await setupNotification();
}
