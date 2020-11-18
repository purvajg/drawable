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
          /// set name:
          await SetNamePopUp().main(context: context);

          /// generate a random id for new room
          String sessionId = await GenerateSessionId().main();

          /// pass that id to ShareIdPopUp which shows a dialog box
          await ShareIdPopUp(id: sessionId).main(context: context);
        },
        joinOnPressed: () async{
          /// set name:
          await SetNamePopUp().main(context: context);

          /// ask to enter the code:
          await EnterIdPopUp().main(context: context);
        },
      ),
    );
  }
}
