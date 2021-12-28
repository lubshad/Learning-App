import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learning_app/domain/entities/my_order_list_entity.dart';
import 'package:learning_app/presentation/widgets/pagination_indicator.dart';

import 'order_list_card.dart';

class MyOrdersList extends StatefulWidget {
  const MyOrdersList({
    Key? key,
    required this.orderList,
    required this.loadMore,
    required this.isLoadingMore,
    required this.moreItemsAvailable,
  }) : super(key: key);

  final List<MyOrderListEntity> orderList;
  final VoidCallback loadMore;
  final bool isLoadingMore;
  final bool moreItemsAvailable;

  @override
  State<MyOrdersList> createState() => _MyOrdersListState();
}

class _MyOrdersListState extends State<MyOrdersList> {
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent) {
        widget.loadMore();
      }
    });
  }

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: widget.orderList.isEmpty
          ? Center(child: Text(AppLocalizations.of(context)!.no_order_found))
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  ...List.generate(
                      widget.orderList.length,
                      (index) => OrderListCard(
                            myOrderListEntity: widget.orderList[index],
                          )),
                  PaginationIndicator(
                    isLoading: widget.isLoadingMore,
                    moreItemsAvailable: widget.moreItemsAvailable,
                  )
                ],
              ),
            ),
    );
  }
}
