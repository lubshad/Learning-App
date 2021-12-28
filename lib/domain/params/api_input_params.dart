import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiInputParams extends Equatable {
  final String sessionId;
  final String userId;
  final String language;

  const ApiInputParams({required this.sessionId, required this.userId, required this.language});

  @override
  List<Object?> get props => [sessionId, userId, language];

  Map<String, dynamic> toMap() {
    return {
      'session_id': sessionId,
      'user_id': userId,
      'language': language,
    };
  }

  factory ApiInputParams.fromMap(Map<String, dynamic> map) {
    return ApiInputParams(
      sessionId: map['session_id'],
      userId: map['user_id'],
      language: map['language'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiInputParams.fromJson(String source) => ApiInputParams.fromMap(json.decode(source));
}
