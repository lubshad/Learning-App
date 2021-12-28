import 'package:flutter/material.dart';

RelativeRect buttonMenuPosition(BuildContext context) {
  final RenderBox bar = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;
  const Offset offset = Offset.zero;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
      bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
    ),
    offset & overlay.size,
  );
  return position;
}
