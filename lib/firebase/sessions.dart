import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/responsive/collectionPaths.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:whiteboardkit/draw_chunk.dart';

class Sessions{


  /// ######### basic path ##########################################################
  CollectionReference path(){
    CollectionReference cr = CollectionPaths.sessionsCollectionPath;
    return cr;
  }


  /// ######### push ##########################################################
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

  void setCreator({@required String sessionId,@required String tokenId }){
    CollectionReference cr = path();
    Map<String, String> creatorMap = new HashMap();
    creatorMap[TextConfig.creator] = tokenId;
    cr.document(sessionId).setData(creatorMap, merge: true);
  }


  void setDrawer({@required String sessionId,@required String tokenId }){
    CollectionReference cr = path();
    Map<String, String> drawerMap = new HashMap();
    drawerMap[TextConfig.drawer] = tokenId;
    cr.document(sessionId).setData(drawerMap, merge: true);
  }


  setDrawingData({@required String sessionId}){
    CollectionReference cr = path();
    List<Map<String, dynamic>> drawingChunk = new List();


    cr.document(sessionId).setData({TextConfig.chunk : drawingChunk}, merge: true);
  }

  void pushDrawingData({@required DrawChunk chunk, @required String sessionId}){
    //setDrawingData(sessionId: sessionId);
    updateDrawingData(chunk: chunk, sessionId: sessionId);
  }



  /// ######### retrive ##########################################################
  Future<Map<String, dynamic>> getMembersMap({@required String sessionId}) async{
    CollectionReference cr = path();
    DocumentSnapshot dc = await cr.document(sessionId).get();
    /// if the user is the creator, then there wont be any memberlist
    /// and the map of members would be null
    if(dc.data != null){
      Map<String, dynamic> map = dc.data;
      Map<String, dynamic> nameTokenMap = map[TextConfig.members];
      return nameTokenMap;
    }
    return null;
  }


  Stream<DocumentSnapshot> getSessionsStream({@required String sessionId}){
    return path().document(sessionId).snapshots();
  }


  Future<String> getMemberName({@required String sessionId, @required String tokenId}) async{
    CollectionReference cr = path();
    DocumentSnapshot dc = await cr.document(sessionId).get();
    Map<String, String> map = dc[TextConfig.members];
    String name = map.keys.firstWhere((name) => map[name] == tokenId, orElse: () => null);
    return name;
  }


  Future<List<dynamic>> getDrawChunkList({@required String sessionId}) async{
    CollectionReference cr = path();
    DocumentSnapshot dc = await cr.document(sessionId).get();
    List<dynamic> drawChunkList = dc[TextConfig.chunk];
    return drawChunkList;
  }

  Future<int> getDrawChunkListLength({@required String sessionId}) async{
    List<dynamic> drawChunkList = await getDrawChunkList(sessionId: sessionId);
    int length = drawChunkList.length;
    return length;
  }


  Future<QuerySnapshot> getQuerySnapshotListOfSessionIds() async{
    CollectionReference cr = path();
    QuerySnapshot qs = await cr.getDocuments();
    return qs;
  }


  /// ######### update #########################################################

  void updateDrawer({@required String sessionId,@required String tokenId }){
    CollectionReference cr = path();
    Map<String, String> drawerMap = new HashMap();
    drawerMap[TextConfig.drawer] = tokenId;
    cr.document(sessionId).updateData(drawerMap);
  }

  updateDrawingData({@required DrawChunk chunk, @required String sessionId}){
    CollectionReference cr = path();

    List<Map<String, dynamic>> drawingChunk = new List();
    drawingChunk.add(chunk.toJson());

    cr.document(sessionId).updateData({TextConfig.chunk: FieldValue.arrayUnion(drawingChunk),});
  }
}