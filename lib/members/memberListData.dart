import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/firebase/sessions.dart';
import 'package:drawable/members/getMemberDrawerMap.dart';
import 'package:drawable/members/memberListUI.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberListData extends StatelessWidget {
  final String sessionId;

  MemberListData({@required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Sessions().getSessionsStream(sessionId: sessionId),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          DocumentSnapshot dc = snapshot.data;
          Map<String, dynamic> map = dc.data;
          String drawerTokenId = map[TextConfig.drawer];
          Map<String, dynamic> membersNameTokenMap = map[TextConfig.members];

          Map<String, bool> memberList = GetMemberDrawerMap().main(
              drawerTokenId: drawerTokenId, membersNameTokenMap: membersNameTokenMap);

          return MemberListUI(
            memberList: memberList,
          );
        }return Center(child: CircularProgressIndicator());
      }
    );
  }
}
