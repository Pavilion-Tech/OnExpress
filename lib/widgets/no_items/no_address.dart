import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/menu/menu_screens/address/add_edit_address_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

class NoAddress extends StatelessWidget {
  const NoAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.noAddress,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            'You Do Not Have Any Addresses Currently,Please Add a New Address.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,color: defaultTextColor
            ),
          ),
        ),
        DefaultButton(
          onTap: (){
            navigateTo(context, AddEditAddressScreen());
          },
          text: 'Add New Address',
          width: size!.width*.8,
        )
      ],
    );
  }
}
