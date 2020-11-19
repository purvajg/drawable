import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/firebase/sessions.dart';
import 'package:flutter/cupertino.dart';

class VerifyId{
  /// retrive a set of active Ids from database
  /// if the id is in the set
  /// add the user to the stream of that id


  Future<bool> main({@required String sessionId}) async{
    Set<String> set = await getSetOfSessionIds();
    if(set.contains(sessionId)) return true;
    return false;
  }


  Future<Set> getSetOfSessionIds() async{
    QuerySnapshot qs = await Sessions().getQuerySnapshotListOfSessionIds();
    List<DocumentSnapshot> list = qs.documents;
    Set<String> set = new HashSet();

    list.forEach((documentSnapshot) {
      set.add(documentSnapshot.documentID);
    });

    return set;
  }
}