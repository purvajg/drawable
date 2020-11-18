import 'package:drawable/responsive/iconConfig.dart';
import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/responsive/widgetConfig.dart';
import 'package:drawable/widgets/customAppBar.dart';
import 'package:drawable/widgets/customIconButton.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/sketch_stream_controller.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

class WhiteBoardUI extends StatefulWidget {
  final String id;

  WhiteBoardUI({this.id});

  @override
  _WhiteBoardUIState createState() => _WhiteBoardUIState();
}

class _WhiteBoardUIState extends State<WhiteBoardUI> {

  DrawingController controller;
  SketchStreamController sketchStreamController;

  @override
  void initState() {
    controller = new DrawingController(enableChunk: true);
    sketchStreamController = new SketchStreamController();
    //    controller.onChange().listen((draw) {
    //      /// push to firebase
    //      print("drawing");
    //    });

    /// for viewer:
    /// use streamBuilder to get chunks from firebase
//    getChunksFromStreamBuilder();


    /// for drawer:
    controller.onChunk().listen((drawChunk) {
      sketchStreamController.addChunk(drawChunk);
      /// for drawer : push the chunk to firebase
      print("onChunk");

    });
    // TODO: implement initState
    super.initState();
  }


//  getChunksFromStreamBuilder(){
//    /// for viewer:
//    /// use streamBuilder to get chunks from firebase
//    StreamBuilder(
//      stream: getDrawingData(),
//      builder: (context, snapshot){
//        if(snapshot.hasData){
//          DrawChunk drawChunkFromFirebase = snapshot.data;
//          sketchStreamController.addChunk(drawChunkFromFirebase);
//
//          return Container();
//        }return Container();
//      },
//    );
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(WidgetConfig.appBarSeventy),
        child: CustomAppBar(
          title: CustomText(text: TextConfig.shareTheCode + widget.id.toUpperCase(),),
          actions: [
            CustomIconButton(
              iconNameInImageFolder: IconConfig.settings,
              onPressed: (){
                final Map<String,bool> memberList = {
                  'aba': false,
                  'taba': false,
                  'baba': true,
                  'shaba': false,
                };
                Map<String,dynamic> navigatorMap = new Map();
                navigatorMap[TextConfig.memberList] = memberList;
                Navigator.pushNamed(context, NavigatorConfig.memberListUI,arguments: navigatorMap );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Whiteboard(
              controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}
