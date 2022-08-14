import 'dart:ui';

import 'package:drawing_app/main.dart';
import 'package:drawing_app/models/drawing_data.dart';
import 'package:flutter/material.dart';

class PointPainter extends CustomPainter {
  final Color color;
  Offset mousePosition;

  GlobalKey key;
  PointPainter(this.color, this.mousePosition, this.key) : super();
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

//widjet position
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final widjetPosition = renderBox.localToGlobal(Offset.zero);

    //print(widjetPosition);
    //print("m:${mousePosition}");
    //print(DrawingPoints.list);

    // if ((mousePosition.dx < (200 + widjetPosition.dx) &&
    //     (mousePosition.dx > (widjetPosition.dx))) && (mousePosition.dy < (200 + widjetPosition.dy) &&
    //     (mousePosition.dy > (widjetPosition.dy)))){ canvas.drawCircle(mousePosition, 7, paint);}
    //DrawingPoints.list.add(mousePosition);

    for (int i = 0; i < DrawingPoints.list.length - 1; i++) {
      if (DrawingPoints.list[i].of != null && DrawingPoints.list[i + 1].of != null) {
        canvas.drawLine(
            DrawingPoints.list[i].of as Offset,
            DrawingPoints.list[i + 1].of as Offset,
            DrawingPoints.list[i + 1].paint as Paint);
      } else if (DrawingPoints.list[i] != null &&
          DrawingPoints.list[i + 1].of == null) {
        canvas.drawPoints(PointMode.points, [DrawingPoints.list[i].of as Offset],
            DrawingPoints.list[i].paint as Paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
