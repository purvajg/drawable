import 'dart:collection';
import 'dart:ui';

import 'package:drawable/firebase/sessions.dart';
import 'package:flutter/cupertino.dart';

class GetMemberDrawerMap{

  Map<String, bool> main({@required String drawerTokenId, @required Map<String, dynamic> membersNameTokenMap}){
//    String drawerTokenId = Sessions().getTokenIdStream(sessionId: sessionId);
//    Map<String, dynamic> nameTokenMap = await Sessions().getMembersMap(sessionId: sessionId);
//    print("nameTokenMap : $nameTokenMap");

    Map<String, bool> result = new HashMap();
    membersNameTokenMap.forEach((name, tokenId) {
      print("name in main : $name");
      print("tokenId in main : $tokenId");
      print("drawerTokenId in main : $drawerTokenId");
      if(tokenId == drawerTokenId){
        result[name] = true;
      }else result[name] = false;
    });

    return result;
  }


}