import 'package:flutter/material.dart';
import 'models/point_painter.dart';

class PaintingArea extends StatefulWidget {
  const PaintingArea({Key? key}) : super(key: key);

  @override
  State<PaintingArea> createState() => _PaintingAreaState();
}

class _PaintingAreaState extends State<PaintingArea> {
  @override
  Widget build(BuildContext context) {

    Offset mousePosition = Offset(0, 0);
    GlobalKey _key = GlobalKey(debugLabel: "123");

    void updatedrawing(DragUpdateDetails details) {
      var x = details.globalPosition.dx;
      var y = details.globalPosition.dy;

      print('${x}  ${y}');

      mousePosition = Offset(x, y);
    }
     void startrawing(DragStartDetails details) {
      var x = details.globalPosition.dx;
      var y = details.globalPosition.dy;

      print('${x}  ${y}');

      mousePosition = Offset(x, y);
    }

    return Container(
      margin: EdgeInsets.all(100),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3, color: Colors.white),
            top: BorderSide(width: 3, color: Colors.white),
            left: BorderSide(width: 3, color: Colors.white),
            right: BorderSide(width: 3, color: Colors.white),
          ),
          color: Colors.white),
      padding: EdgeInsets.all(1),
      child: GestureDetector(
       
        onPanEnd: (_) => print("pan ended"),
        child: FittedBox(
          child: ClipRect(
            child: CustomPaint(
              key: _key,
              painter: PointPainter(Colors.red, mousePosition, _key),
              size: Size(200, 200),
            ),
          ),
        ),
      ),
    );
  }
}
