import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/cart_screen/cart_screen_controller.dart';
import 'package:learning_app/presentation/screens/course_details_screen/components/price_ranges.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:learning_app/presentation/widgets/quantity_change_buttons.dart';
import 'package:learning_app/utils/debug_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

class UpdateCartBottomSheet extends StatefulWidget {
  const UpdateCartBottomSheet({
    Key? key,
    required this.position,
  }) : super(key: key);

  final int position;

  @override
  State<UpdateCartBottomSheet> createState() => _UpdateCartBottomSheetState();
}

class _UpdateCartBottomSheetState extends State<UpdateCartBottomSheet> {
  @override
  void initState() {
    super.initState();
    qtyController.text =
        cartScreenController.cartProductsList[widget.position].qty.toString();
  }

  final qtyController = TextEditingController();
  final CartScreenController cartScreenController = Get.find();

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    setState(() {});
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    setState(() {});
  }

  void updateCart() async {
    consoleLog(qtyController.text);
    if (qtyController.text != "0") {
      makeButtonLoading();
      cartScreenController.updateCartProducts(
          widget.position, qtyController.text);
    }
    showMessage(AppLocalizations.of(context)!.qty_error);
  }

  void decreaseQuantity() {
    int newQty;
    try {
      newQty = int.parse(qtyController.text) - 1;
    } catch (e) {
      newQty = 1;
    }
    if (newQty > 0) {
      qtyController.text = newQty.toString();
    }
  }

  void increaseQuantity() {
    int newQty;
    try {
      newQty = int.parse(qtyController.text) + 1;
    } catch (e) {
      newQty = 1;
    }
    qtyController.text = newQty.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(defaultPadding),
          topRight: Radius.circular(defaultPadding)),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgLightBlue,
          actions: [
            IconButton(onPressed: Get.back, icon: const Icon(Icons.close))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding * .5),
            child: Column(
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: cartScreenController
                          .cartProductsList[widget.position].imageUrl!,
                      width: defaultPadding * 4,
                      height: defaultPadding * 4,
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/no_image.png",
                      ),
                    ),
                    defaultSpacerHorizontalSmall,
                    Expanded(
                      flex: 1,
                      child: Text(cartScreenController
                          .cartProductsList[widget.position].name!),
                    ),
                  ],
                ),
                defaultSpacerSmall,
                PriceRanges(
                    priceRanges: cartScreenController
                        .cartProductsList[widget.position].priceRange!)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding * .5),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: QuantityChangeButtons(
                    quantityController: qtyController,
                    decreaseQty: decreaseQuantity,
                    increaseQty: increaseQuantity,
                  )),
              defaultSpacerHorizontal,
              Expanded(
                flex: 3,
                child: DefaultButton(
                  text: AppLocalizations.of(context)!.update_cart,
                  onPressed: updateCart,
                  isLoading: buttonLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
