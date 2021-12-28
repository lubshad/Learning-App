import 'package:flutter/material.dart';

import 'loading_widget.dart';

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator(
      {Key? key, required this.isLoading, required this.moreItemsAvailable})
      : super(key: key);

  final bool isLoading;
  final bool moreItemsAvailable;

  @override
  Widget build(BuildContext context) {
    return !moreItemsAvailable
        ? const Text(
            "No more items!",
            textAlign: TextAlign.center,
          )
        : isLoading
            ? const LoadingWidgetBounce()
            : const SizedBox(
                width: 0,
                height: 0,
              );
  }
}
