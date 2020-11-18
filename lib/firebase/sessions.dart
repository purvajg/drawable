import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/responsive/collectionPaths.dart';
import 'package:drawable/responsive/textConfig.dart';

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
}