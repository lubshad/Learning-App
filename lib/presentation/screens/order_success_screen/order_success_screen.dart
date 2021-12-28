import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:learning_app/presentation/core/navigation_screen/screens.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSuccesssScreen extends StatelessWidget {
  const OrderSuccesssScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: bgLightBlue, automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 10,
              ),
              Image.asset(
                "assets/ic_order_success.png",
                height: defaultPadding * 10,
                width: defaultPadding * 10,
              ),
              const Spacer(
                flex: 3,
              ),
              Text(
                AppLocalizations.of(context)!.order_success_message,
                style: Theme.of(context).textTheme.headline5BoldBlack(),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 15,
              ),
              DefaultButton(
                  text: AppLocalizations.of(context)!.continue_shopping,
                  onPressed: () {
                    Get.until((route) => Get.currentRoute == RouteList.initial);
                    Get.find<NavigationScreenController>()
                        .changeScreen(Screens.home.index);
                  },
                  isLoading: false),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
