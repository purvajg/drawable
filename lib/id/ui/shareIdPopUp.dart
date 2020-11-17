import 'package:drawable/responsive/colorPallete.dart';
import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customRichTextOkDialogBox.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';

class ShareIdPopUp{

  final String id;

  ShareIdPopUp({@required this.id});

  main({@required BuildContext context}) async{
    return await CustomRichTextOkDialogBox(
        children: <TextSpan>[
          CustomText(text: TextConfig.shareThisCode,).richText(),
          CustomText(text: id,textColor: primaryColor,).richText(),
        ],
        buttonText: TextConfig.ok,
        buttonOnPressed: (){
          /// send the user to whiteBoard screen:
          /// pop is a placeholder
          Map<String,dynamic> navigatorMap = new Map();
          navigatorMap[TextConfig.id] = id;
          Navigator.pushNamed(context, NavigatorConfig.whiteBoardUI,arguments: navigatorMap);
          }
    ).dialog(context);
  }

}