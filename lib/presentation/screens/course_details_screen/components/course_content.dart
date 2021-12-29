import 'package:flutter/material.dart';
import 'package:learning_app/data/models/product_details_response_model.dart';
import 'package:learning_app/presentation/theme/theme.dart';

import 'basic_details.dart';

class CourseContent extends StatelessWidget {
  const CourseContent({
    Key? key,
    required this.courseDetails,
  }) : super(key: key);

  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Course Content",
                  style: Theme.of(context).textTheme.headline6,
                ),
                defaultSpacerSmall,
                IconTextDetails(
                    text: "${courseDetails.totalLessons} Lessons",
                    details: "",
                    iconData: Icons.folder),
                IconTextDetails(
                    text:
                        "${(courseDetails.totalDuration / 60).toStringAsFixed(2)} Hours",
                    details: "",
                    iconData: Icons.timer)
              ],
            )),
        ...List.generate(courseDetails.courseChapter.length, (index) {
          final module = courseDetails.courseChapter[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding * .1),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey.withOpacity(.1),
              title: Text("Module ${index + 1}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: primaryColor)),
              subtitle: Row(
                children: [
                  Expanded(child: Text(module.chapterTitle)),
                  Text(
                    "(${module.durationCount} mins / ${module.chaptersCount} part)",
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              children: [
                ...List.generate(module.chapters.length, (index) {
                  final chapter = module.chapters[index];
                  return ListTile(
                    style: ListTileStyle.list,
                    title: Text(chapter.libraryName),
                    leading: const Icon(Icons.play_arrow),
                    trailing: Text("${chapter.duration} mins"),
                  );
                })
              ],
            ),
          );
        })
      ],
    );
  }
}
