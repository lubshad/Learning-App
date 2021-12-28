import 'package:learning_app/presentation/screens/checkout_screen/checkout_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
    required this.checkoutController,
  }) : super(key: key);

  final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.payment_method,
              style: Theme.of(context).textTheme.headline6,
            ),
            defaultSpacerSmall,
            ...checkoutController.paymentMethods
                .map((e) => RadioListTile(
                      value: e,
                      groupValue: checkoutController.selectedPaymentMethod,
                      onChanged: checkoutController.changePaymentMethod,
                      title: Text(e.text),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
