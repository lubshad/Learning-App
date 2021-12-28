import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortingButton extends StatelessWidget {
  const SortingButton(
      {Key? key, required this.sort, required this.selectedType})
      : super(key: key);

  final Function(SortType) sort;
  final SortType selectedType;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortType>(
        icon: const Icon(Icons.sort_sharp),
        onSelected: (value) => sort(value),
        itemBuilder: (context) => SortType.values
            .map(
              (e) => CheckedPopupMenuItem(
                value: e,
                checked: selectedType == e ? true : false,
                child: Text(e.typeToString(context)),
              ),
            )
            .toList());
  }
}

enum SortType { lowToHigh, highToLow, newArrivals, ascending, descending }

extension SortTypeExtension on SortType {
  String typeToString(BuildContext context) {
    switch (this) {
      case SortType.highToLow:
        return AppLocalizations.of(context)!.high_to_low;
      case SortType.lowToHigh:
        return AppLocalizations.of(context)!.low_to_high;
      case SortType.newArrivals:
        return AppLocalizations.of(context)!.new_arrivals;
      case SortType.ascending:
        return AppLocalizations.of(context)!.ascending;
      case SortType.descending:
        return AppLocalizations.of(context)!.descending;
    }
  }

  String typeToApiInput() {
    switch (this) {
      case SortType.highToLow:
        return "high";
      case SortType.lowToHigh:
        return "low";
      case SortType.newArrivals:
        return "latest";
      case SortType.ascending:
        return "asc";
      case SortType.descending:
        return "desc";
    }
  }
}
