import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityChangeButtons extends StatelessWidget {
  const QuantityChangeButtons({
    Key? key,
    required this.increaseQty,
    required this.decreaseQty,
    required this.quantityController,
  }) : super(key: key);

  final TextEditingController quantityController;
  final VoidCallback increaseQty;
  final VoidCallback decreaseQty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIconButton(icon: Icons.remove, onPressed: decreaseQty),
        SizedBox(
            height: defaultPadding * 2,
            width: defaultPadding * 3,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4)
              ],
              decoration:
                  const InputDecoration(contentPadding: EdgeInsets.zero),
              controller: quantityController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
            )),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        //   child: Text(quantity.toString()),
        // ),
        RoundedIconButton(onPressed: increaseQty, icon: Icons.add),
      ],
    );
  }
}
