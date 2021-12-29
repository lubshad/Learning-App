import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const defaultSpacer = SizedBox(height: defaultPadding);
const defaultSpacerSmall = SizedBox(height: defaultPadding / 2);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(width: defaultPadding / 2);

const sliverSpacer = SliverToBoxAdapter(
  child: defaultSpacer,
);

//const colours
const bgLightBlue = Color(0xFFF2F6F9);
const whiteColor = Colors.white;
const primaryColor = Color(0xFF047bd5);
const blackColor = Colors.black;
const errorColor = Color(0xFFB71C1C);
const goldColor = Color(0xFFd4af37);
const successColor = Colors.green;
const greyColor = Colors.grey;
const warningColor = Colors.yellow;
const blueColor = Colors.blue;
const defaultGradiant =
    LinearGradient(colors: [Colors.blue, Colors.greenAccent]);
const greenGradiant =
    LinearGradient(colors: [Colors.greenAccent, Colors.lightGreen]);

const defaultAnimationDuration = Duration(milliseconds: 500);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(1.1, 1.1),
    blurRadius: 5,
  ),
];

setSystemOverlay() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //  DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    // systemNavigationBarColor: Colors.white,
    // systemNavigationBarDividerColor: Colors.grey,
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

// generateAnimatedRoute(RouteSettings settings) {
//   final routes = Routes.getRoutes(settings);
//   final WidgetBuilder builder = routes[settings.name]!;
//   return FadeScaleRouteBuilder(
//     builder: builder,
//   );
// }

class FadeScale extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    var curve = Curves.ease;
    var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }
}

ThemeData themeData(context) {
  return ThemeData.light().copyWith(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        selectedLabelStyle: TextStyle(color: primaryColor),
      ),
      textTheme: GoogleFonts.rubikTextTheme(),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: blackColor,
        labelColor: whiteColor,
        indicator: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor))),
      chipTheme: Theme.of(context).chipTheme.copyWith(
          secondaryLabelStyle: const TextStyle(color: whiteColor),
          secondarySelectedColor: primaryColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: blackColor)))),
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          titleTextStyle: Theme.of(context).textTheme.headline6),
      platform: TargetPlatform.iOS,
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(
            horizontal: defaultPadding * .5, vertical: defaultPadding * .5),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding * .5)),
        shadowColor: Colors.black38,
      ),
      scaffoldBackgroundColor: bgLightBlue,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultPadding / 2))));
}

extension ThemeExtension on TextTheme {
  TextStyle headline6BoldBlack() =>
      headline6!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle headline6BoldPrimary() =>
      headline6!.copyWith(fontWeight: FontWeight.bold, color: primaryColor);
  TextStyle headline6Primary() => headline6!.copyWith(color: primaryColor);
  TextStyle headline5BoldBlack() =>
      headline5!.copyWith(fontWeight: FontWeight.bold, color: blackColor);
  TextStyle bodyText1White() => bodyText1!.copyWith(color: whiteColor);
  TextStyle bodyText1BoldGrey() =>
      bodyText1!.copyWith(color: greyColor, fontWeight: FontWeight.bold);
  TextStyle bodyText1BlueBold() =>
      bodyText1!.copyWith(color: blueColor, fontWeight: FontWeight.bold);
  TextStyle bodyText1BoldRed() =>
      bodyText1!.copyWith(color: errorColor, fontWeight: FontWeight.bold);
  TextStyle bodyText1BoldBlack() =>
      bodyText1!.copyWith(fontWeight: FontWeight.bold);
  TextStyle bodySubtitle1White() => subtitle1!.copyWith(color: whiteColor);
}
