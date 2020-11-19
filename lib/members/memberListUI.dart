import 'package:drawable/responsive/colorPallete.dart';
import 'package:drawable/responsive/iconConfig.dart';
import 'package:drawable/responsive/textConfig.dart';
import 'package:drawable/responsive/widgetConfig.dart';
import 'package:drawable/widgets/customAppBar.dart';
import 'package:drawable/widgets/customIcon.dart';
import 'package:drawable/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberListUI extends StatelessWidget {
  final Map<String,bool> memberList;

  MemberListUI({@required this.memberList});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(WidgetConfig.appBarSeventy),
        child: CustomAppBar(
          title: CustomText(text: TextConfig.membersList).bigFont(),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: memberList.length,
        itemBuilder: (context, index){
          String name = memberList.keys.elementAt(index);/// iterating through map
          bool isDrawer = memberList[name];
          return ListTile(
            title: CustomText(text: name,),
            trailing: Visibility(
              visible: isDrawer,
              child: CustomIcon(iconName: IconConfig.pencil,),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: white,
        ),
      ),
    );
  }
}
