import 'package:learning_app/domain/params/webview_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DefaultWebView extends StatelessWidget {
  const DefaultWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewArguments arguments = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
          backgroundColor: whiteColor,
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: arguments.url,
        ));
  }
}
