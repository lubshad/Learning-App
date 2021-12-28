import 'package:equatable/equatable.dart';

class MyOrdersParams extends Equatable {
  final int offset;

  const MyOrdersParams({required this.offset});

  @override
  List<Object?> get props => [offset];

  Map<String, dynamic> toMap() => {"offset": offset};
}
