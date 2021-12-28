import 'package:flutter/material.dart';
import 'package:learning_app/domain/entities/app_error.dart';

class ErrorWithRetry extends StatelessWidget {
  const ErrorWithRetry({
    Key? key,
    required this.appError,
    required this.retry,
  }) : super(key: key);

  final AppError appError;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appError.errorMessage()),
          TextButton(
            child: const Text("Retry"),
            onPressed: retry,
          )
        ],
      ),
    );
  }
}
