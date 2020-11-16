
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/widgets/customRaisedButton.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';


class HomeScreenBottom extends StatelessWidget {
  final VoidCallback startOnPressed;
  final VoidCallback joinOnPressed;

  HomeScreenBottom({ this.startOnPressed, this.joinOnPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 1,
//            fit: FlexFit.tight,
            child: CustomRaisedButton(
              child: CustomText(text: TextConfig.start,),
              onPressed: startOnPressed,/// if not given then the button appears grey
            ),
          ),
          Flexible(
            flex: 1,
//            fit: FlexFit.tight,
            child: CustomRaisedButton(
              child: CustomText(text: TextConfig.join,),
              onPressed: joinOnPressed,/// if not given then the button appears grey
            ),
          )
        ],
      ),
    );
  }
}
