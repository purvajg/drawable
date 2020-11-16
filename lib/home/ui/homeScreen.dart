import 'package:drawable/home/ui/homeScreenBottom.dart';
import 'package:drawable/responsive/imageConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/home/ui/homeScreenBody.dart';
import 'package:drawable/widgets/customWelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final String bodyImage;
  final String bodyTextTitle;
  final String bodyTextSubtitle;
  final String bottomText;
  final VoidCallback nextIconOnPressed;
  final VoidCallback onBackPressed;

  HomeScreen({this.bodyImage, this.bodyTextTitle,
    this.bodyTextSubtitle,
    this.nextIconOnPressed, this.bottomText, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return CustomWelcomeScreen(
      onBackPressed: onBackPressed,
      body: HomeScreenBody(
        bodyImage: ImageConfig.homeScreenImage,
        bodyTitleText: TextConfig.DRAWABEL,
      ),
      bottom: HomeScreenBottom(
        startOnPressed: (){},
        joinOnPressed: (){},
      ),
    );
  }
}
