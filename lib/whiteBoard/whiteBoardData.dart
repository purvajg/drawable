import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/firebase/sessions.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/whiteBoard/whiteBoardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/draw_chunk.dart';

class WhiteBoardData extends StatelessWidget {
  final String sessionId;
  final String tokenId;

  WhiteBoardData({@required this.sessionId, this.tokenId});

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

          List<Map<String, dynamic>> drawingChunkList = map[TextConfig.chunk];
//          List<DrawChunk> drawingChunk = drawingChunkJson

          return FutureBuilder(
            future: Sessions().getDrawChunkListLength(sessionId: sessionId),
            builder: (BuildContext context, AsyncSnapshot newDrawChunkSnapshot) {
              if (newDrawChunkSnapshot.connectionState == ConnectionState.done) {

                print("newIndex : ${newDrawChunkSnapshot}");
                print("newIndex : ${newDrawChunkSnapshot.data}");
                int newIndex = newDrawChunkSnapshot.data;

                Map<String, dynamic> drawChunkToJsonMap = drawingChunkList[newIndex];

                DrawChunk newDrawChunk = DrawChunk.fromJson(drawChunkToJsonMap);

                return WhiteBoardUI(
                  sessionId: sessionId,
                  isDrawer: isDrawer,
                  drawingChunkStream: newDrawChunk,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }return Center(child: CircularProgressIndicator());
      }
    );
  }
}
