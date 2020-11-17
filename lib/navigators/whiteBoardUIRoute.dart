import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/whiteBoard/whiteBoardUI.dart';
import 'package:flutter/cupertino.dart';

class WhiteBoardUIRoute{

  static Widget main(BuildContext context){

    Map<String,dynamic> map = ModalRoute.of(context).settings.arguments;
    final String id = map[TextConfig.id];

    return WhiteBoardUI(id: id,);
  }

}