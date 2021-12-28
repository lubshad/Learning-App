import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/route/routes.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/utils/initiate_app_utils.dart';
import 'package:learning_app/utils/user_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locale = setupLocale();
    return GetMaterialApp(
      title: 'Learning App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: themeData(context),
      themeMode: ThemeMode.light,
      initialRoute: RouteList.initial,
      getPages: Routes.getPages(),
    );
  }
}
