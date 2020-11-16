import 'package:drawable/responsive/colorPallete.dart';
import 'package:drawable/responsive/iconConfig.dart';
import 'package:drawable/widgets/customIconButton.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget{
  final VoidCallback onPressed;
  final Widget title;
  final List<Widget> actions;

  CustomAppBar({Key key, this.onPressed, this.title, this.actions});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: secondryColor.withOpacity(.03),
        elevation: 0,
        title: FittedBox(child: title),
        actions: actions,
        leading: CustomIconButton(
          iconNameInImageFolder:IconConfig.backArrow,
          onPressed: onPressed,
        ),
      ),
    );
  }

  noLeading(){
    return SafeArea(
      child: AppBar(
        backgroundColor: secondryColor.withOpacity(.03),
        elevation: 0,
        title: title,
        actions: actions,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
