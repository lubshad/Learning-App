import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learning_app/presentation/theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color = whiteColor,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color,
      size: defaultPadding * 1.5,
      lineWidth: defaultPadding / 4,
    );
  }
}

class LoadingWidgetBounce extends StatelessWidget {
  const LoadingWidgetBounce({
    Key? key,
    this.color = primaryColor,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(color: color);
  }
}
