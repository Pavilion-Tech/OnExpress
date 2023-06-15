import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/menu/menu_screens/address/map_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_form.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../../shared/components/constants.dart';

class AddEditAddressScreen extends StatelessWidget {
  const AddEditAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: tr('add_new_address'),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,bottom: 15),
              child: DefaultForm(hint: tr('address_title')),
            ),
            DefaultForm(
                hint: '182256, Tillman, North Glena.....',
                readOnly: true,
              onTap: (){
                navigateTo(context, MapScreen());
              },
            ),
          ],
        )
    );
  }
}
