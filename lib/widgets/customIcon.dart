import 'package:drawable/responsive/iconConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final String iconName;

  CustomIcon({this.iconName});


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/$iconName.svg',
      width: IconConfig.flushbarIconThirty,/// 30
      height: IconConfig.flushbarIconThirty,/// 30
    );
  }

  Widget networkIcon(BuildContext context) {
    return SvgPicture.network(
      iconName,
      width: IconConfig.flushbarIconThirty,/// 30
      height: IconConfig.flushbarIconThirty,/// 30
    );
  }
}
