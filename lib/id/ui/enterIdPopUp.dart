import 'package:drawable/firebase/sessions.dart';
import 'package:drawable/id/data/createTokenId.dart';
import 'package:drawable/id/data/verifyId.dart';
import 'package:drawable/id/ui/invalidSessionPopUp.dart';
import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customTextFieldDialogBox.dart';
import 'package:flutter/cupertino.dart';

class EnterIdPopUp{

  final String name;

  EnterIdPopUp({@required this.name});

  String sessionId;

  main({@required BuildContext context}) async{
    return await CustomTextFieldDialogBox(
        text: TextConfig.enterTheCode,
        buttonText: TextConfig.ok,
        onChanged:(value){
          String tempId = value;
          sessionId = tempId;
        },
        buttonOnPressed: () async{
          if(sessionId != TextConfig.blankString && sessionId != null){
            /// check the id from database
            /// 1) take the code entered by the user
            /// 2) match it with the existing codes
            /// await VerifyId()
            bool sessionExists = await VerifyId().main(sessionId: sessionId);


            if(sessionExists){
              /// create a tokenId for him
              String tokenId = await CreateTokenId().setTokenId(sessionId: sessionId);

              /// push the name to database
              Sessions().setName(sessionId: sessionId, name: name, tokenId: tokenId);

              /// send the user to whiteBoard screen:
              Map<String,dynamic> navigatorMap = new Map();
              navigatorMap[TextConfig.sessionId] = sessionId;
              navigatorMap[TextConfig.tokenId] = tokenId;
              Navigator.pushNamed(context, NavigatorConfig.whiteBoardData,arguments: navigatorMap);
            }else{
              /// show him a dialog that the session does not exist and pop
              /// that dialog when he presses ok
              await InvalidSessionPopUp().main(context: context);
            }
          }
        },
    ).dialog(context);
  }

}