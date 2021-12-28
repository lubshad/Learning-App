import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/screens/my_address_screen/my_address_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';

import 'comonents/address_list_item.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressController myAddressController = Get.find();
    myAddressController.getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgLightBlue,
          title: const Text("My Address"),
        ),
        body: AnimatedBuilder(
          animation: myAddressController,
          builder: (BuildContext context, Widget? child) {
            return NetworkResource(
              loading: myAddressController.isLoading,
              retry: myAddressController.retry,
              appError: myAddressController.appError,
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(defaultPadding * .5),
                  child: Column(children: [
                    ...List.generate(
                        myAddressController.addressList.length,
                        (index) => AddressListItem(
                              addressEntity:
                                  myAddressController.addressList[index],
                            )),
                  ]),
                ),
                // bottomNavigationBar: Padding(
                //   padding: const EdgeInsets.all(defaultPadding * .5),
                //   child: DefaultButton(
                //       text: AppLocalizations.of(context)!.change_address,
                //       onPressed: () {
                //         // Get.toNamed(RouteList.editAddressScreen,
                //         //     arguments: myAddressController.addressList[0]);
                //         Get.toNamed(RouteList.editAddressScreen,
                //             arguments: myAddressController.addressList[0]);
                //       },
                //       isLoading: false),
                // ),
              ),
            );
          },
        ));
  }
}
