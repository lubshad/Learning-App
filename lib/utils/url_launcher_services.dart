import 'dart:io';

import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherServices {
  static caller(String phone) async {
    String url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    await launch(url);
  }

  static locator({
    required String lat,
    required String long,
  }) async {
    String url = "https://www.google.com/maps?q=loc:$lat,$long";

    final String encodedURl = Uri.encodeFull(url);

    if (await canLaunch(encodedURl)) {
      consoleLog(true);
      await launch(encodedURl);
    } else {
      consoleLog('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }

  static primalcodesLauncher() async {
    const url = 'https://primalcodes.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static primalcodesBniLauncher() async {
    const url = 'http://primalcodes.com/bni/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static watsappLaucher(BuildContext context,
      {required String phone, required String message}) async {
    String url = '';
    if (Platform.isAndroid) {
      // add the [https]
      // url = "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      url =
          "https://wa.me/${AppLocalizations.of(context)!.country_code}$phone/?text=$message"; // new line

    } else {
      // add the [https]
      url =
          "https://api.whatsapp.com/send?phone=${AppLocalizations.of(context)!.country_code}$phone"; // new line
      // "https://api.whatsapp.com/send?phone=+91$phone=$message"; // new line
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
