import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/menu/menu_screens/address/add_edit_address_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

class NoBookings extends StatelessWidget {
  const NoBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.noBookings,),
        const SizedBox(height: 15,),
        Text(
          tr('no_bookings'),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,color: defaultTextColor
          ),
        ),
      ],
    );
  }
}
