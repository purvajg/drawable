import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/whiteBoard/whiteBoardData.dart';
import 'package:drawable/whiteBoard/whiteBoardUI.dart';
import 'package:flutter/cupertino.dart';

class WhiteBoardDataRoute{

  static Widget main(BuildContext context){

    Map<String,dynamic> map = ModalRoute.of(context).settings.arguments;
    final String sessionId = map[TextConfig.sessionId];
    final String tokenId = map[TextConfig.tokenId];

    return WhiteBoardData(sessionId: sessionId,tokenId:tokenId ,);
  }

}