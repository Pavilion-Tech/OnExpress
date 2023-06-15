import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/layout/buyer/buyer_layout.dart';
import 'package:on_express/modules/buyer/menu/menu_screens/address/add_edit_address_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.noNotifications,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            tr('no_notifications'),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,color: defaultTextColor
            ),
          ),
        ),
        DefaultButton(
          onTap: (){
            navigateTo(context, BuyerLayout());
          },
          text: tr('homepage'),
          width: size!.width*.8,
        )
      ],
    );
  }
}
