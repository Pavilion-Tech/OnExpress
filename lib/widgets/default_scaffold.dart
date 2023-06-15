import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_express/shared/components/components.dart';

import '../shared/styles/colors.dart';

class DefaultScaffold extends StatelessWidget {
  DefaultScaffold({
    required this.child,
    this.appBar,
    this.titleAppbar = '',
    this.haveArrow = true,
    this.haveNotification = true,
    this.bottomSheet,
  });

  Widget child;
  Widget? bottomSheet;
  AppBar? appBar;
  String titleAppbar;
  bool haveArrow;
  bool haveNotification;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar:appBar ?? defaultAppbar(context: context,title: titleAppbar,haveArrow: haveArrow,haveNotification: haveNotification),
      body: Stack(
        children: [
          Container(color: defaultColor,),
          Container(
            decoration: BoxDecoration(
              color: HexColor('#FDFDFD'),
              borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(250)),
            ),
          ),
          SafeArea(
            bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                child: child,
              )
          ),
        ],
      ),
      bottomSheet:bottomSheet ,
    );
  }
}
