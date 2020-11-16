import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  String iconNameInImageFolder;
  double iconsize;

  CustomIconButton({this.onPressed, this.iconNameInImageFolder, this.iconsize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset('images/$iconNameInImageFolder.svg',),
      onPressed: onPressed,
    );
  }

  resize(){
    return IconButton(
      icon: SvgPicture.asset('images/$iconNameInImageFolder.svg',),
      onPressed: onPressed,
      iconSize: iconsize,/// default size is 24
    );
  }

  Widget network(BuildContext context) {
    return IconButton(
      icon: SvgPicture.network(iconNameInImageFolder,),
      onPressed: onPressed,
    );
  }
}
