import 'package:drawable/responsive/colorPallete.dart';
import 'package:flutter/material.dart';


class CustomRaisedButton extends StatelessWidget {
  VoidCallback onPressed;
  final Widget child;
  ShapeBorder shape;
  double minWidth;
  double height;
  final Color color;
  final double elevation;
  final BorderSide borderSideColor;
  CustomRaisedButton({this.onPressed, this.child, this.shape,this.minWidth,
    this.height,this.color,this.elevation, this.borderSideColor});

  //VerticalPadding({this.child, @required this.verticleHeight});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: shape == null ? RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: borderSideColor == null ?BorderSide(color : Colors.black) : borderSideColor,
        ) : shape,
        onPressed: onPressed,
        color: Colors.white,
        elevation: elevation == null ? 0 : elevation,
        hoverColor: white,
        child: child
    );
  }

  Widget elevated() {
    return RaisedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

