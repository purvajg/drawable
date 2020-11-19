import 'package:drawable/firebase/sessions.dart';
import 'package:flutter/cupertino.dart';

class CreateTokenId{

  Future<int> geNumberOfMembers({@required String sessionId}) async{
    Map<String, dynamic> nameTokenMap = await Sessions().getMembersMap(sessionId: sessionId);
    /// if the user is the creator, then there wont be any memberlist
    /// and the map of members would be null
    if(nameTokenMap == null) return 1;
    int length = nameTokenMap.length;
    return length;
  }

  Future<String> setTokenId({@required String sessionId}) async{
    int length = await geNumberOfMembers(sessionId: sessionId);
    return length.toString();
  }

}