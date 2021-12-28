import 'package:learning_app/domain/entities/product_entity.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:learning_app/presentation/screens/search_screen/components/search_result_item.dart';
import 'package:learning_app/presentation/screens/search_screen/search_controller.dart';
import 'package:learning_app/presentation/widgets/pagination_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.searchResult,
    required this.loadMore,
    required this.isLoadingMore,
    required this.moreItemsAvailable,
  }) : super(key: key);

  final List<ProductEntity> searchResult;
  final VoidCallback loadMore;
  final bool isLoadingMore;
  final bool moreItemsAvailable;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    SearchController searchController = Get.find();
    return searchResult.isEmpty
        ? searchController.searchKey.length > 2
            ? Center(child: Text(AppLocalizations.of(context)!.no_items_found))
            : const SizedBox.shrink()
        : SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  ...List.generate(
                      searchResult.length,
                      (index) => SearchResultItem(
                            productEntity: searchResult[index],
                          )),
                  PaginationIndicator(
                    isLoading: isLoadingMore,
                    moreItemsAvailable: moreItemsAvailable,
                  )
                ],
              ),
            ),
          );
  }
}
