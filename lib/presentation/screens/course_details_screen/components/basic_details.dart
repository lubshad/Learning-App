import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/screens/course_details_screen/course_details_controller.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/default_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class BasicDetails extends StatelessWidget {
  const BasicDetails({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    final document = parse(courseDetails.description);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding * .5),
                  decoration:
                      BoxDecoration(border: Border.all(color: goldColor)),
                  child: Text(
                    "Best Seller",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: goldColor, fontWeight: FontWeight.bold),
                  ))),
          defaultSpacerSmall,
          Text(
            courseDetails.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6BoldPrimary(),
          ),
          defaultSpacerSmall,
          Text(
            parsedString,
            style: Theme.of(context).textTheme.caption,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(
            height: defaultPadding,
          ),
          Row(
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
            ],
          ),
          defaultSpacerSmall,
          Text(
            courseDetails.rating == null
                ? "(43,200 rating) 25,000 students"
                : courseDetails.rating.toString(),
            style: Theme.of(context).textTheme.caption,
          ),
          defaultSpacer,
          Row(
            children: [
              Text(
                "Created By",
                style: Theme.of(context).textTheme.bodyText1BoldBlack(),
              ),
              defaultSpacerHorizontalSmall,
              Text(
                courseDetails.createdBy,
                style: Theme.of(context).textTheme.bodyText1BlueBold(),
              )
            ],
          ),
          defaultSpacerSmall,
          IconTextDetails(
            text: "Last Update  :  ",
            iconData: Icons.update,
            details: timeago.format(courseDetails.updatedAt),
          ),
          // defaultSpacerSmall,
          IconTextDetails(
            text: "Validity  :  ",
            iconData: Icons.date_range,
            details: "${courseDetails.courseValidity} months",
          ),
          defaultSpacer,
          Row(
            children: [
              Text(
                "INR ${courseDetails.price}",
                style: Theme.of(context).textTheme.headline6BoldPrimary(),
              ),
              defaultSpacerHorizontalSmall,
              Text(
                "INR ${courseDetails.actualPrice}",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: greyColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          defaultSpacerSmall,
          Row(
            children: [
              const Icon(
                Icons.av_timer_rounded,
                color: Colors.red,
                size: defaultPadding,
              ),
              defaultSpacerHorizontalSmall,
              Text(
                courseDetails.offers,
                style: Theme.of(context).textTheme.bodyText1BoldRed(),
              ),
            ],
          ),
          defaultSpacer,
          DefaultButton(text: "Buy Now", onPressed: () {}, isLoading: false),
          defaultSpacer,
          const Text("What Will You Learn?"),
          defaultSpacer,
          ...List.generate(
              courseDetails.courseChapter.length,
              (index) => IconTextDetails(
                  text: courseDetails.courseChapter[index].chapterTitle,
                  details: "",
                  iconData: Icons.verified)),
          TextButton(
            child: const Text("Show more"),
            onPressed: () {
              Get.find<ProductDetailsController>().showMoreDetails();
            },
          ),
        ],
      ),
    );
  }
}

class IconTextDetails extends StatelessWidget {
  const IconTextDetails({
    Key? key,
    required this.text,
    required this.details,
    required this.iconData,
  }) : super(key: key);

  final String text;
  final String details;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: defaultPadding,
          color: Colors.grey,
        ),
        defaultSpacerHorizontalSmall,
        Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          details,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
