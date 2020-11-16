import 'package:drawable/responsive/colorPallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomWelcomeScreen extends StatelessWidget {
  final int bodyFlex;
  final int bottomFlex;
  final Widget body;
  final Widget bottom;
  final VoidCallback onBackPressed;

  CustomWelcomeScreen({this.onBackPressed,this.bottomFlex,
    this.bodyFlex, this.body,this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: bodyFlex == null ? 4 : bodyFlex,
            child: Align(
                alignment: Alignment.center,
                child: body
            ),
          ),
          Expanded(
              flex: bottomFlex == null ? 1 : bottomFlex,
              child: bottom
          ),
        ],
      ),
    );
  }
}

