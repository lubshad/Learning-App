// import 'package:learning_app/domain/entities/category_entity.dart';
// import 'package:learning_app/presentation/screens/category_details_screen/category_details_controller.dart';
// import 'package:learning_app/presentation/theme/theme.dart';
// import 'package:learning_app/presentation/widgets/network_resource.dart';
// import 'package:learning_app/presentation/widgets/product_grid_view.dart';
// import 'package:learning_app/presentation/widgets/sorting_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryDetailsScreen extends StatelessWidget {
//   const CategoryDetailsScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CategoryDetailsController categoryDetailsController = Get.find();
//     CategoryEntity categoryEntity = Get.arguments;
//     categoryDetailsController.getData();

//     categoryDetailsController.scrollController.addListener(() {
//       // consoleLog("pixel");
//       // consoleLog(scrollController.position.pixels);
//       // consoleLog("maxscroll");
//       // consoleLog(scrollController.position.maxScrollExtent);
//       // consoleLog("extend_after");
//       // consoleLog(scrollController.position.extentAfter);
//       if (categoryDetailsController.scrollController.position.extentAfter
//               .toInt() ==
//           0) {
//         categoryDetailsController.loadMore();
//       }
//     });
//     return AnimatedBuilder(
//       animation: categoryDetailsController,
//       builder: (BuildContext context, Widget? child) {
//         return DefaultTabController(
//           length: categoryDetailsController.subCategories.length,
//           initialIndex: categoryDetailsController.selectedIndex,
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: bgLightBlue,
//               title: Text(categoryEntity.name),
//               actions: [
//                 SortingButton(
//                   sort: categoryDetailsController.sortProducts,
//                   selectedType: categoryDetailsController.selectedSortType,
//                 )
//               ],
//               bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(kToolbarHeight),
//                 child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: TabBar(
//                       onTap: categoryDetailsController.changeCategory,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: defaultPadding,
//                           vertical: defaultPadding * .5),
//                       isScrollable: true,
//                       tabs: categoryDetailsController.tabs,
//                     )),
//               ),
//             ),
//             body: NetworkResource(
//               appError: categoryDetailsController.appError,
//               loading: categoryDetailsController.isLoading,
//               retry: categoryDetailsController.getAllCategoryProducts,
//               child: ProductGridView(
//                   scrollController: categoryDetailsController.scrollController,
//                   moreItemsAvailable:
//                       categoryDetailsController.moreItemsAvailable,
//                   products: categoryDetailsController.products,
//                   isLoadingMore: categoryDetailsController.isLoadingMore),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
