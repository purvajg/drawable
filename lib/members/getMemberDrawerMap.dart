import 'dart:collection';
import 'package:flutter/cupertino.dart';

class GetMemberDrawerMap{

  Map<String, bool> main({@required String drawerTokenId, @required Map<String, dynamic> membersNameTokenMap}){

    Map<String, bool> result = new HashMap();
    membersNameTokenMap.forEach((name, tokenId) {
      if(tokenId == drawerTokenId){
        result[name] = true;
      }else result[name] = false;
    });

    return result;
  }


}