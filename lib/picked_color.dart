import 'package:flutter/material.dart';

class PickedColor extends StatelessWidget {
  Color color;
  Function changedColor;
  Color selected;
  PickedColor(this.color, this.changedColor,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.all(10),
       alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
        border: color==selected
            ? Border.all(color: Colors.black,width: 3 )
            : null,
      ),
      child: GestureDetector(
        onTap: () {
          changedColor(color);
        },
      ),
    );
  }
}
