import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customTextFieldDialogBox.dart';
import 'package:flutter/cupertino.dart';

class EnterIdPopUp{

  String id;

  main({@required BuildContext context}) async{
    return await CustomTextFieldDialogBox(
        text: TextConfig.enterTheCode,
        buttonText: TextConfig.ok,
        onChanged:(value){
          String tempId = value;
          id = tempId;
        },
        buttonOnPressed: (){
          if(id != TextConfig.blankString && id != null){
            /// check the id from database
            /// 1) take the code entered by the user
            /// 2) match it with the existing codes
            /// await VerifyId()

            /// send the user to whiteBoard screen:
            /// pop is a placeholder
            Navigator.of(context).pop();
          }
        },
    ).dialog(context);
  }

}