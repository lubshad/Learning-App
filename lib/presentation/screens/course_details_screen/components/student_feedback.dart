import 'package:flutter/material.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/presentation/screens/cart_screen/components/cart_item_card.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/header_with_padding.dart';

class StudentFeedback extends StatelessWidget {
  const StudentFeedback({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderWithPadding(text: "Student Feedback"),
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
                defaultSpacerHorizontal,
                // Text(courseDetails.rating == null
                //     ? "(43,200)"
                //     : courseDetails.rating.toString()),
              ],
            ),
          ],
        ),
        defaultSpacer,
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          dense: true,
          leading: SizedBox(width: 80, child: Text("Excellent")),
          title: LinearProgressIndicator(
            minHeight: defaultPadding * .3,
            value: .8,
          ),
          trailing: Text("80 %"),
        ),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          dense: true,
          leading: SizedBox(width: 80, child: Text("Very Good")),
          title: LinearProgressIndicator(
            minHeight: defaultPadding * .3,
            value: .7,
          ),
          trailing: Text("70 %"),
        ),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          dense: true,
          leading: SizedBox(width: 80, child: Text("Avarage")),
          title: LinearProgressIndicator(
            minHeight: defaultPadding * .3,
            value: .6,
          ),
          trailing: Text("60 %"),
        ),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          dense: true,
          leading: SizedBox(width: 80, child: Text("Poor")),
          title: LinearProgressIndicator(
            minHeight: defaultPadding * .3,
            value: .5,
          ),
          trailing: Text("50 %"),
        ),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          dense: true,
          leading: SizedBox(width: 80, child: Text("Terrible")),
          title: LinearProgressIndicator(
            minHeight: defaultPadding * .3,
            value: .4,
          ),
          trailing: Text("40 %"),
        ),
      ],
    );
  }
}
