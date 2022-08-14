import 'package:drawing_app/models/drawing_data.dart';
import 'package:drawing_app/models/point.dart';
import 'package:drawing_app/models/point_painter.dart';
import 'package:drawing_app/picked_color.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 219, 204, 204)),
      home: drawingApp(),
    );
  }
}

class drawingApp extends StatefulWidget {
  const drawingApp({Key? key}) : super(key: key);

  @override
  State<drawingApp> createState() => _drawingAppState();
}

class _drawingAppState extends State<drawingApp> {
  Offset mousePosition = Offset(0, 0);
  Color _drawingColor = Colors.red;
  GlobalKey _key = GlobalKey(debugLabel: "123");

  void changeColor(Color) {
    setState(() {
      _drawingColor = Color;
    });
  }

  @override
  Widget build(BuildContext context) {
    Offset? o = null;

    return Scaffold(
      body: Stack(children: [
        Container(
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
            onPanDown: (details) {
              setState(() {
                DrawingPoints.list.add(DataPoint(
                    details.globalPosition,
                    Paint()
                      ..color = _drawingColor
                      ..style = PaintingStyle.fill
                      ..strokeMiterLimit = 10
                      ..strokeWidth = 7));
              });
            },
            onPanStart: (DragStartDetails details) {
              setState(() {
                DrawingPoints.list.add(DataPoint(
                    details.globalPosition,
                    Paint()
                      ..color = _drawingColor
                      ..style = PaintingStyle.fill
                      ..strokeMiterLimit = 10
                      ..strokeWidth = 7));
              });
            },
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                DrawingPoints.list.add(DataPoint(
                    details.globalPosition,
                    Paint()
                      ..color = _drawingColor
                      ..style = PaintingStyle.fill
                      ..strokeMiterLimit = 10
                      ..strokeWidth = 7));
              });
            },
            onPanEnd: (details) {
              setState(() {
                DrawingPoints.list.add(DataPoint(null, null));
              });
            },
            child: FittedBox(
              child: ClipRect(
                child: CustomPaint(
                  key: _key,
                  painter: PointPainter(_drawingColor, mousePosition, _key),
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  DrawingPoints.list.clear();
                });
              },
              child: Text("Clear"),
            ),
            
            PickedColor(Colors.red, changeColor,_drawingColor),
            PickedColor(Colors.blue, changeColor,_drawingColor),
          ]),
        )
      ]),
    );
  }
}
