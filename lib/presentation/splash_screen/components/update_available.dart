import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/expanded_elivated_button.dart';
import 'package:flutter/material.dart';

class UpdateAvailable extends StatelessWidget {
  const UpdateAvailable(
      {Key? key,
      required this.forceUpdate,
      required this.updateNow,
      required this.updateLater})
      : super(key: key);

  final bool forceUpdate;
  final Function updateNow;
  final Function updateLater;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Update Available !",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Text(
          "New version is available at store\nPlease update for better experience",
          textAlign: TextAlign.center,
        ),
        defaultSpacer,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            defaultSpacerHorizontalSmall,
            if (!forceUpdate)
              ExpandedElivatedButton(
                text: 'Later',
                onPressed: updateLater,
                color: Colors.red,
              ),
            if (!forceUpdate) defaultSpacerHorizontal,
            ExpandedElivatedButton(
              text: 'Update',
              onPressed: updateNow,
              color: Colors.green,
            ),
            defaultSpacerHorizontal,
          ],
        )
      ],
    );
  }
}
