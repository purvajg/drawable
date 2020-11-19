import 'package:drawable/members/memberListData.dart';
import 'package:drawable/members/memberListUI.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:flutter/cupertino.dart';

class MemberListDataRoute{

  static Widget main(BuildContext context){

    Map<String,dynamic> map = ModalRoute.of(context).settings.arguments;
    final String sessionId = map[TextConfig.sessionId];

    return MemberListData(sessionId: sessionId,);
  }

}