import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customTextFieldDialogBox.dart';
import 'package:flutter/cupertino.dart';

class SetNamePopUp{

  String name;
  final ValueChanged<String> setName;

  SetNamePopUp({this.setName});

  main({@required BuildContext context}) async{
    return await CustomTextFieldDialogBox(
        text: TextConfig.enterYourName,
        buttonText: TextConfig.ok,
        buttonOnPressed: (){
          if(name != TextConfig.blankString && name != null){

            /// pop the dialog box:
            print("name in setName : $name");
            setName(name);
            Navigator.of(context).pop(name);
          }
        },
        onChanged:(value){
          String tempName = value;
          name = tempName;
        }
    ).dialog(context);
  }

}