import 'package:drawable/home/ui/homeScreenBottom.dart';
import 'package:drawable/responsive/imageConfig.dart';
import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/home/ui/homeScreenBody.dart';
import 'package:drawable/widgets/customTextFieldDialogBox.dart';
import 'package:drawable/widgets/customWelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
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
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name;

  @override
  Widget build(BuildContext context) {
    return CustomWelcomeScreen(
      onBackPressed: widget.onBackPressed,
      body: HomeScreenBody(
        bodyImage: ImageConfig.homeScreenImage,
        bodyTitleText: TextConfig.DRAWABEL,
      ),
      bottom: HomeScreenBottom(
        startOnPressed: () async{
          await CustomTextFieldDialogBox(
            text: TextConfig.enterYourName,
            buttonText: TextConfig.ok,
            buttonOnPressed: (){
              print("name : $name");
              if(name != TextConfig.blankString && name != null){
                /// push the name to database

                /// pop the dialog box:
                Navigator.of(context).pop();
              }
            },
            onChanged:(value){
              print("value : $value");
              String tempName = value;
              name = tempName;
            }
          ).dialog(context);
          //Navigator.pushNamed(context, NavigatorConfig.nameScreen);
        },
        joinOnPressed: (){
          Navigator.pushNamed(context, NavigatorConfig.nameScreen);
        },
      ),
    );
  }
}
