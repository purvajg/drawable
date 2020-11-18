import 'package:drawable/members/memberListUI.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/whiteBoard/whiteBoardUI.dart';
import 'package:flutter/cupertino.dart';

class MemberListUIRoute{

  static Widget main(BuildContext context){

    Map<String,dynamic> map = ModalRoute.of(context).settings.arguments;
    final Map<String,bool> memberList = map[TextConfig.memberList];

    return MemberListUI(memberList: memberList,);
  }

}