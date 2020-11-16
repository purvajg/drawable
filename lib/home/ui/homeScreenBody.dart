
import 'package:drawable/responsive/paddingConfig.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenBody extends StatelessWidget {
  final String bodyImage;
  final String bodyTitleText;

  HomeScreenBody({
    this.bodyImage,this.bodyTitleText
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: PaddingConfig.five, right:PaddingConfig.five),
                child: CustomText(
                  text: bodyTitleText,
                  textAlign: TextAlign.center,
                ).welcome(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: PaddingConfig.eight),
              child: Image.asset(
                bodyImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
