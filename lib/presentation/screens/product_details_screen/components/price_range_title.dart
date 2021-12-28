import 'package:flutter/material.dart';

class PriceRangeTitle extends StatelessWidget {
  const PriceRangeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "Range",
              style: Theme.of(context).textTheme.headline6,
            )),
        Expanded(
            flex: 3,
            child: Text(
              "Price",
              style: Theme.of(context).textTheme.headline6,
            )),
      ],
    );
  }
}