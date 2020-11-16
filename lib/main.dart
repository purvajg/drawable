
import 'package:drawable/home/ui/homeScreen.dart';
import 'package:drawable/navigators/nameScreenRoute.dart';
import 'package:drawable/responsive/colorPallete.dart';
import 'package:drawable/responsive/navigatorConfig.dart';
import 'package:drawable/responsive/sizeConfig.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// LayoutBuilder is a widget which provides the dimensions of its parent so
    /// we can know how much space we have for the widget and can build it our
    /// child accordingly
    return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                ///MaterialApp is a widget that introduces many interesting tools such
                /// as Navigator or Theme to help you develop your app.
                ///Material is, on the other hand, a widget used to define a UI
                ///element respecting Material rules. It defines what elevation is,
                ///shape, and stuff. Then reused by many material widgets such as
                ///Appbar or Card or FloatingButton.
                return MaterialApp(
                    theme: ThemeData(
                      primaryColor: white,
                      accentColor: subtitleGray,
                    ),
                    title: 'Drawable',
                    routes: {
                      NavigatorConfig.nameScreen : (context){return NameScreenRoute.main(context);},
                    },
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen(),
                );
              }
          );
        }
    );
  }
}

