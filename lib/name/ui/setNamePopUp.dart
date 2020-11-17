import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customTextFieldDialogBox.dart';
import 'package:flutter/cupertino.dart';

class SetNamePopUp{

  String name;

  main({@required BuildContext context}) async{
    return await CustomTextFieldDialogBox(
        text: TextConfig.enterYourName,
        buttonText: TextConfig.ok,
        buttonOnPressed: (){
          if(name != TextConfig.blankString && name != null){
            /// push the name to database

            /// pop the dialog box:
            Navigator.of(context).pop();
          }
        },
        onChanged:(value){
          String tempName = value;
          name = tempName;
        }
    ).dialog(context);
  }

}