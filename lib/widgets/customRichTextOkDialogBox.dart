import 'package:drawable/widgets/customRichText.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRichTextOkDialogBox {
  final List<InlineSpan> children;
  final String buttonText;
  final VoidCallback buttonOnPressed;

  CustomRichTextOkDialogBox({@required this.children,@required this.buttonText,@required this.buttonOnPressed});

  dialog(BuildContext context) async{
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: CustomRichText(
                children: children,
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
