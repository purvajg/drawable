import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOkDialogBox {
  final String text;
  final String buttonText;
  final VoidCallback buttonOnPressed;

  CustomOkDialogBox({@required this.text,@required this.buttonText,@required this.buttonOnPressed});

  dialog(BuildContext context) async{
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: CustomText(text: text,),
            actions: <Widget>[
              FlatButton(
                child:CustomText(text: buttonText,),
                onPressed: buttonOnPressed,
              )
            ],
          );
        });
  }
}
