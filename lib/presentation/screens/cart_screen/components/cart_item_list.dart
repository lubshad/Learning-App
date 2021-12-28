import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    Key? key,
    required this.cartScreenController,
  }) : super(key: key);

  final CartScreenController cartScreenController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: cartScreenController.cartProductsList.isEmpty
            ? Center(child: Text(AppLocalizations.of(context)!.cart_empty))
            : AnimatedList(
                key: cartScreenController.cartListKey,
                itemBuilder: (context, index, animation) {
                  return CartItemCard(
                    index: index,
                    animation: animation,
                  );
                },
                initialItemCount: cartScreenController.cartProductsList.length,
              ));
  }
}
