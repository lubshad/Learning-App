import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/custom_search_deligate.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: bgLightBlue,
        title: Text(
          AppLocalizations.of(context)!.search,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDeligate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      // body: Column(
      //   children: [
      //     Card(
      //       margin: const EdgeInsets.symmetric(vertical: defaultPadding * .5),
      //       child: InkWell(
      //         onTap: () =>
      //             showSearch(context: context, delegate: CustomSearchDeligate()),
      //         child: Padding(
      //           padding: const EdgeInsets.all(defaultPadding * .6),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: const [Text("Search"), Icon(Icons.search)],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
