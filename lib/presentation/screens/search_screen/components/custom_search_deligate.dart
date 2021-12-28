import 'package:learning_app/presentation/screens/search_screen/components/search_result.dart';
import 'package:learning_app/presentation/screens/search_screen/search_controller.dart';
import 'package:learning_app/presentation/widgets/network_resource.dart';
import 'package:learning_app/presentation/widgets/sorting_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDeligate extends SearchDelegate {
  SearchController searchController = Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      AnimatedBuilder(
        animation: searchController,
        builder: (BuildContext context, Widget? child) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              if (searchController.filters.isNotEmpty)
                IconButton(
                    onPressed: searchController.toFilterScreen,
                    icon: const Icon(Icons.filter_alt_outlined)),
              if (searchController.searchResult.isNotEmpty)
                SortingButton(
                  selectedType: searchController.sortType,
                  sort: searchController.changeSortType,
                )
            ],
          );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchController.clearSearch();
    searchController.searchProduct(query);

    return AnimatedBuilder(
      animation: searchController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: searchController.appError,
          loading: searchController.isLoading,
          retry: searchController.retry,
          child: SearchResult(
            moreItemsAvailable: searchController.moreItemsAvailable,
            isLoadingMore: searchController.isLoadingMore,
            loadMore: searchController.loadMore,
            searchResult: searchController.searchResult,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchController.clearSearch();
    searchController.searchProduct(query);
    return AnimatedBuilder(
      animation: searchController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: searchController.appError,
          loading: searchController.isLoading,
          retry: searchController.retry,
          child: SearchResult(
            moreItemsAvailable: searchController.moreItemsAvailable,
            isLoadingMore: searchController.isLoadingMore,
            loadMore: searchController.loadMore,
            searchResult: searchController.searchResult,
          ),
        );
      },
    );
  }
}
