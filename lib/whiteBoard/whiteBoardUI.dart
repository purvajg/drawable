import 'package:drawable/firebase/sessions.dart';
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
  final String sessionId;
  final bool isDrawer;
  final DrawChunk drawingChunkStream;

  WhiteBoardUI({@required this.sessionId, @required this.isDrawer, this.drawingChunkStream});

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


    /// for drawer:
    if(widget.isDrawer == true){
      controller.onChunk().listen((drawChunk) {
        /// for drawer : push the chunk to firebase
        Sessions().pushDrawingData(chunk: drawChunk, sessionId: widget.sessionId);
      });
    }

    /// for viewer
    /// use data provided by streambuilder from whiteBoardData class:
    else{
    sketchStreamController.addChunk(widget.drawingChunkStream);
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(WidgetConfig.appBarSeventy),
        child: CustomAppBar(
          title: CustomText(text: TextConfig.shareTheCode + widget.sessionId.toUpperCase(),),
          onPressed: (){
            Navigator.pop(context);
          },
          actions: [
            CustomIconButton(
              iconNameInImageFolder: IconConfig.settings,
              onPressed: () {
                Map<String,dynamic> navigatorMap = new Map();
                navigatorMap[TextConfig.sessionId] = widget.sessionId;
                Navigator.pushNamed(context, NavigatorConfig.memberListData,arguments: navigatorMap );
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
              controller: widget.isDrawer == true ? controller : sketchStreamController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
