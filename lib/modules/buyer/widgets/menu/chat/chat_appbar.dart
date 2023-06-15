
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/widgets/menu/chat/sendoffer_dialog.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../../shared/styles/colors.dart';

AppBar chatAppbar({
  required BuildContext context,
  required String title,
}){
  return AppBar(
    leading: IconButton(
      onPressed: ()=>Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: defaultTextColor),
    ),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}