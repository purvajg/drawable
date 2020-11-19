import 'package:drawable/firebase/sessions.dart';
import 'package:drawable/id/data/createTokenId.dart';
import 'package:drawable/id/data/generateSessionId.dart';
import 'package:drawable/id/ui/enterIdPopUp.dart';
import 'package:drawable/id/ui/shareIdPopUp.dart';
import 'package:drawable/name/ui/setNamePopUp.dart';
import 'package:drawable/home/ui/homeScreenBottom.dart';
import 'package:drawable/responsive/imageConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/home/ui/homeScreenBody.dart';
import 'package:drawable/widgets/customWelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomWelcomeScreen(
      body: HomeScreenBody(
        bodyImage: ImageConfig.homeScreenImage,
        bodyTitleText: TextConfig.DRAWABEL,
      ),
      bottom: HomeScreenBottom(
        startOnPressed: () async{

          /// ################## data: ###########################################
          /// set name:
          String name;
          await SetNamePopUp(
            setName:(nameTemp){
              name = nameTemp;
            }
          ).main(context: context);

          /// generate a random id for new room
          String sessionId = await GenerateSessionId().main();

          /// create a token for the name
          String tokenId = await CreateTokenId().setTokenId(sessionId: sessionId);

          /// push the name to database
          Sessions().setName(sessionId: sessionId, name: name, tokenId: tokenId);

          /// set the creator as the initial drawer
          Sessions().setDrawer(sessionId: sessionId, tokenId: tokenId);

          /// set the user as the creator
          Sessions().setCreator(sessionId: sessionId, tokenId: tokenId);

          /// ################## data ends: ####################################

          /// pass that id to ShareIdPopUp which shows a dialog box
          await ShareIdPopUp(sessionId: sessionId, tokenId: tokenId).main(context: context);
        },
        joinOnPressed: () async{
          /// set name:
          String name;
          await SetNamePopUp(
              setName:(nameTemp){
                name = nameTemp;
              }
          ).main(context: context);


          /// ask to enter the code:
          await EnterIdPopUp(name: name).main(context: context);
        },
      ),
    );
  }
}
