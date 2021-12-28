// import 'package:learning_app/l10n/localization.dart';
// import 'package:learning_app/presentation/widgets/pagination_indicator.dart';
// import 'package:learning_app/presentation/widgets/product_card.dart';
// import 'package:flutter/material.dart';

// import 'package:learning_app/domain/entities/product_entity.dart';
// import 'package:learning_app/presentation/theme/theme.dart';

// class ProductGridView extends StatelessWidget {
//   const ProductGridView({
//     Key? key,
//     required this.products,
//     required this.isLoadingMore,
//     required this.moreItemsAvailable,
//     required this.scrollController,
//   }) : super(key: key);

//   final List<ProductEntity> products;
//   final bool isLoadingMore;
//   final bool moreItemsAvailable;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context) {
//     return products.isEmpty
//         ? Center(child: Text(AppLocalizations.of(context)!.no_items_found))
//         : CustomScrollView(controller: scrollController, slivers: [
//             SliverPadding(
//               sliver: SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) => ProductCard(
//                     productEntity: products[index],
//                   ),
//                   childCount: products.length,
//                 ),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   // mainAxisSpacing: defaultPadding * .5,
//                   childAspectRatio: .7,
//                 ),
//               ),
//               padding: const EdgeInsets.all(
//                 defaultPadding * .5,
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: PaginationIndicator(
//                 isLoading: isLoadingMore,
//                 moreItemsAvailable: moreItemsAvailable,
//               ),
//             )
//           ]);
//   }
// }
