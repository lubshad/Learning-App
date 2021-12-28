import 'package:learning_app/presentation/screens/my_order_details/my_order_details_controller.dart';
import 'package:learning_app/presentation/screens/my_orders/components/order_list_card.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'components/bill_details.dart';
import 'components/order_items.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    myOrderDetailsController.getData();
    return AnimatedBuilder(
      animation: myOrderDetailsController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          loading: myOrderDetailsController.isLoading,
          appError: myOrderDetailsController.appError,
          retry: myOrderDetailsController.getData,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: bgLightBlue,
              title: Text(
                AppLocalizations.of(context)!.order_details,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (myOrderDetailsController.myOrderListEntity != null)
                    OrderListCard(
                        myOrderListEntity:
                            myOrderDetailsController.myOrderListEntity!),
                  defaultSpacerSmall,
                  OrderItems(
                    products: myOrderDetailsController.products,
                  ),
                  defaultSpacerSmall
                ],
              ),
            ),
            bottomNavigationBar: BillDetails(
              billDetailsEntity: myOrderDetailsController.billDetailsEntity,
              myOrderListEntity: myOrderDetailsController.myOrderListEntity,
            ),
          ),
        );
      },
    );
  }
}
