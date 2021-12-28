import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/filter_screen/filter_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'components/filter_items_list.dart';
import 'components/filter_type_list.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterController filterController = Get.find();
    return AnimatedBuilder(
      animation: filterController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: bgLightBlue,
            title: Text(
              AppLocalizations.of(context)!.filter,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: FilterTypeList(filterController: filterController),
              ),
              const VerticalDivider(),
              Expanded(
                  flex: 3,
                  child: FilterItemsList(
                    filterController: filterController,
                  ))
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: AppBar().preferredSize.height,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DefaultButton(
                      backgroundColor: greyColor,
                      borderRadius: 0,
                      height: double.infinity,
                      text: "Reset",
                      onPressed: filterController.clearFilters,
                      isLoading: false),
                ),
                Expanded(
                  flex: 3,
                  child: DefaultButton(
                      borderRadius: 0,
                      height: double.infinity,
                      text: "Apply",
                      onPressed: filterController.setFilters,
                      isLoading: false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
