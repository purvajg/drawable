import 'package:drawable/id/ui/shareIdPopUp.dart';
import 'package:drawable/name/ui/setName.dart';
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
          await SetNamePopUp().main(context: context);
          //Navigator.pushNamed(context, NavigatorConfig.nameScreen);
          /// generate a random id for new room

          /// pass that id to ShareIdPopUp which shows a dialog box
          await ShareIdPopUp(id: '12345').main(context: context);
        },
        joinOnPressed: () async{
          await SetNamePopUp().main(context: context);
        },
      ),
    );
  }
}
