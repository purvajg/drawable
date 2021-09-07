import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/firebase/sessions.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/whiteBoard/whiteBoardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/draw_chunk.dart';
import 'package:whiteboardkit/sketch_stream_controller.dart';

import 'whiteBoardUI.dart';

class WhiteBoardData extends StatelessWidget {
  final String sessionId;
  final String tokenId;

  WhiteBoardData({@required this.sessionId, this.tokenId});

  Set<int> set = new Set();
  SketchStreamController sketchStreamController = new SketchStreamController();


  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: Sessions().getSessionsStream(sessionId: sessionId),
      builder: (context, snapshot) {
        if(snapshot.hasData){

          DocumentSnapshot dc = snapshot.data;
          Map<String, dynamic> map = dc.data;
          String drawerTokenId = map[TextConfig.drawer];

          bool isDrawer = false;

          if(drawerTokenId == tokenId) isDrawer = true;

          List<dynamic> drawingChunkList = map[TextConfig.chunk];

          if(!isDrawer && drawingChunkList != null){
            DrawChunk newDrawChunk;
            drawingChunkList.forEach((element) {
              Map<String, dynamic> drawChunkToJsonMap = element;
              newDrawChunk = DrawChunk.fromJson(drawChunkToJsonMap);
              if(set.contains(newDrawChunk.id) == false){
                sketchStreamController.addChunk(newDrawChunk);
                set.add(newDrawChunk.id);
              }
            });
          }

          return WhiteBoardUI(
                  sessionId: sessionId,
                  isDrawer: isDrawer,
                  sketchStreamController: sketchStreamController,
                );
        }return Center(child: CircularProgressIndicator());
      }
    );
  }
}
