import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/app_error.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:learning_app/presentation/widgets/error_with_retry.dart';
import 'package:learning_app/presentation/widgets/loading_widget.dart';

class NetworkResource extends StatelessWidget {
  const NetworkResource({
    Key? key,
    required this.retry,
    required this.appError,
    required this.child,
    required this.loading,
  }) : super(key: key);

  final VoidCallback retry;
  final AppError? appError;
  final Widget? child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.ease,
          duration: defaultAnimationDuration,
          child: loading
              ? const LoadingWidgetBounce()
              : appError != null
                  ? ErrorWithRetry(
                      appError: appError!,
                      retry: retry,
                    )
                  : child!),
    );
  }
}
