import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customOkDialogBox.dart';
import 'package:flutter/cupertino.dart';

class InvalidSessionPopUp{
  
  main({@required BuildContext context}) async{
    return await CustomOkDialogBox(
      text: TextConfig.invalidCode,
      buttonText: TextConfig.ok,
      buttonOnPressed: (){
        Navigator.pushNamed(context, NavigatorConfig.homeScreen);
      }
    ).dialog(context);
  }

}