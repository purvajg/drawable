import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/responsive/collectionPaths.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:flutter/foundation.dart';

class Sessions{

  CollectionReference path(){
    CollectionReference cr = CollectionPaths.sessionsCollectionPath;
    return cr;
  }

  Future<String> generateId() async{
    CollectionReference cr = path();
    Map<String, dynamic> map = new HashMap();
    DocumentReference sessionIdDocumentReference = await cr.add(map);
    String sessionId = sessionIdDocumentReference.documentID;
    return sessionId;
  }

  void setName({@required String sessionId, @required String name, @required String tokenId, }){
    CollectionReference cr = path();
    Map<String, Map<String, String>> map = new HashMap();

    Map<String, String> nameTokenMap = new HashMap();
    nameTokenMap[name] = tokenId;

    map[TextConfig.members] = nameTokenMap;

    cr.document(sessionId).setData(map, merge: true);
  }


  Future<Map<String, String>> getMembersMap({@required String sessionId}) async{
    CollectionReference cr = path();
    DocumentSnapshot dc = await cr.document(sessionId).get();
    /// if the user is the creator, then there wont be any memberlist
    /// and the map of members would be null
    if(dc.data != null){
      Map<String, dynamic> map = dc.data;
      Map<String, String> nameTokenMap = map[TextConfig.members];
      return nameTokenMap;
    }
    return null;
  }

  void setCreator({@required String sessionId,@required String tokenId }){
    CollectionReference cr = path();
    Map<String, String> creatorMap = new HashMap();
    creatorMap[TextConfig.creator] = tokenId;
    cr.document(sessionId).setData(creatorMap, merge: true);
  }
}