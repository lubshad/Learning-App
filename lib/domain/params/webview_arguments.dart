import 'package:equatable/equatable.dart';
import 'package:learning_app/data/core/api_constants.dart';

class WebViewArguments extends Equatable {
  final String title, url;

  const WebViewArguments(
      {this.title = "Web view", this.url = ApiConstants.defaultWebUrl});

  @override
  List<Object?> get props => [title, url];
}
