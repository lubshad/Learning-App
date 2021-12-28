// import 'package:learning_app/presentation/screens/offers_products/offers_products_controller.dart';
// import 'package:learning_app/presentation/theme/theme.dart';
// import 'package:learning_app/presentation/widgets/network_resource.dart';
// import 'package:learning_app/presentation/widgets/product_grid_view.dart';
// import 'package:learning_app/presentation/widgets/sorting_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OffersProducts extends StatelessWidget {
//   const OffersProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     OffersProductsController offersProductsController = Get.find();
//     offersProductsController.getData();

//     ScrollController scrollController =
//         ScrollController(debugLabel: "product_grid_view");
//     scrollController.addListener(() {
//       if (scrollController.position.pixels >
//           scrollController.position.maxScrollExtent) {
//         offersProductsController.loadMore();
//       }
//     });
//     return AnimatedBuilder(
//       animation: offersProductsController,
//       builder: (BuildContext context, Widget? child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: bgLightBlue,
//             title: const Text(
//               "Discount offers",
//             ),
//             actions: [
//               SortingButton(
//                 selectedType: offersProductsController.selectedSortType,
//                 sort: offersProductsController.sortProducts,
//               )
//             ],
//           ),
//           body: NetworkResource(
//             appError: offersProductsController.appError,
//             loading: offersProductsController.isLoading,
//             retry: offersProductsController.retry,
//             child: ProductGridView(
//               scrollController: scrollController,
//               moreItemsAvailable: offersProductsController.moreItemsAvailable,
//               isLoadingMore: offersProductsController.isLoadingMore,
//               products: offersProductsController.offersProducts,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
