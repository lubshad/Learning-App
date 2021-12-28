import 'package:learning_app/presentation/screens/my_orders/my_orders_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'components/my_orders_list.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyOrdersController myOrdersController = Get.find();
    myOrdersController.getData();
    return AnimatedBuilder(
      animation: myOrdersController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: bgLightBlue,
              title: Text(
                AppLocalizations.of(context)!.my_orders,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: NetworkResource(
              appError: myOrdersController.appError,
              loading: myOrdersController.isLoading,
              retry: myOrdersController.getData,
              child: MyOrdersList(
                moreItemsAvailable: myOrdersController.moreItemsAvailable,
                orderList: myOrdersController.orderList,
                isLoadingMore: myOrdersController.isLoadingMore,
                loadMore: myOrdersController.loadMore,
              ),
            ));
      },
    );
  }
}
