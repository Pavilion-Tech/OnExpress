
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/widgets/menu/chat/sendoffer_dialog.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../../shared/styles/colors.dart';

AppBar vendorChatAppbar({
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
    actions: [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: DefaultButton(
          text: 'Send Offer',
          onTap: (){
            showDialog(
                context: context,
                builder: (context)=>SendOfferDialog('')
            );
          },
          height: 40,
          width: 100,
          textSize: 12,
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}