import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldDialogBox {
  final String text;
  final ValueChanged<String> onChanged;
  final String buttonText;
  final VoidCallback buttonOnPressed;

  CustomTextFieldDialogBox({this.text, this.onChanged, this.buttonText, this.buttonOnPressed});

  dialog(BuildContext context) async{
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: CustomText(text: text,),
            content: TextField(
              onChanged: onChanged,
            ),
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
