import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/data/models/home_response_model.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:html/parser.dart' show parse;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/presentation/route/route_constants.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';

class CourceCard extends StatelessWidget {
  const CourceCard({Key? key, required this.cource}) : super(key: key);

  final Cource cource;

  @override
  Widget build(BuildContext context) {
    final document = parse(cource.description);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return SizedBox(
      height: 400,
      width: 300,
      child: Card(
        // color: Colors.transparent,
        // elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultPadding * .5),
          onTap: () {
            Get.toNamed(RouteList.productDetailsScreen, arguments: cource);
          },
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding * .5),
                    topRight: Radius.circular(defaultPadding * .5),
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: ApiConstants.defaultWebUrl + cource.listingImage,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("4.7",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: goldColor)),
                        defaultSpacerHorizontalSmall,
                        ...List.generate(
                            5,
                            (index) => RatingIcon(
                                rating: 3.7, index: index.toDouble())),
                        defaultSpacerHorizontalSmall,
                        Text("(43,200)"),
                      ],
                    ),
                    defaultSpacerSmall,
                    Text(
                      cource.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    defaultSpacerSmall,
                    Text(
                      parsedString,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(),
                    Text(cource.currencyCode + " " + cource.price.toString()),
                    defaultSpacerSmall,
                    DefaultButton(
                        height: defaultPadding * 2,
                        text: "Buy Now",
                        onPressed: () {},
                        isLoading: false)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingIcon extends StatelessWidget {
  const RatingIcon({
    Key? key,
    required this.rating,
    required this.index,
  }) : super(key: key);

  final double rating;
  final double index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.star,
          color: rating > index ? goldColor : Colors.grey,
          size: defaultPadding * .8,
        ));
  }
}
