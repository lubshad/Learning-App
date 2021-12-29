import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  get defaultPadding => null;

  @override
  Widget build(BuildContext context) {
    final document = parse(courseDetails.description);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(courseDetails.ratingCount.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: goldColor)),
              defaultSpacerHorizontalSmall,
              ...List.generate(
                  5,
                  (index) => RatingIcon(
                      rating: courseDetails.ratingCount.toDouble(),
                      index: index.toDouble())),
              defaultSpacerHorizontalSmall,
              Text(courseDetails.rating == null
                  ? "(43,200)"
                  : courseDetails.rating.toString()),
            ],
          ),
          defaultSpacerSmall,
          Text(
            courseDetails.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          defaultSpacerSmall,
          Text(
            parsedString,
            style: Theme.of(context).textTheme.caption,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }
}
