import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:learning_app/common/constants.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/screens/course_details_screen/components/student_feedback.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';

import 'course_content.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    final document = parse(courseDetails.description);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CourseContent(courseDetails: courseDetails),
        defaultSpacer,
        const HeaderWithPadding(text: "Description"),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            parsedString,
            style: Theme.of(context).textTheme.caption,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        StudentFeedback(courseDetails: courseDetails),
        defaultSpacer,
        Reviews(),
      ],
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWithPadding(text: "Reviews"),
        defaultSpacer,
        ListTile(
          leading: const CircleAvatar(
            // radius: defaultPadding * 3,
            backgroundImage: CachedNetworkImageProvider(
              "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
              maxWidth: 50,
              maxHeight: 50,
            ),
            // radius: 20,
          ),
          title: Row(
            children: [
              const Text("Jonathan Drew  -  "),
              Text(
                "3 days ago",
                style: Theme.of(context).textTheme.bodyText1BlueBold(),
              )
            ],
          ),
          subtitle: Column(
            children: [
              defaultSpacerSmall,
              Row(
                children: [
                  ...List.generate(
                      5,
                      (index) =>
                          RatingIcon(rating: 4, index: index.toDouble())),
                ],
              ),
              defaultSpacerSmall,
              const Text(
                loremIpsum,
                maxLines: 3,
              )
            ],
          ),
        ),
        const Divider(),
        Align(
            alignment: Alignment.center,
            child: TextButton(onPressed: () {}, child: const Text("View All")))
      ],
    );
  }
}
