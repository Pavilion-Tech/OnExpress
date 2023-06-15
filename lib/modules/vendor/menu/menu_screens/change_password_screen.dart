import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../shared/images/images.dart';
import '../../../../widgets/default_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: tr('change_password'),
      haveNotification: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: DefaultForm(
              hint: tr('old_password'),
              obscureText: true,
              suffix: Image.asset(Images.showPassword,width: 22,),
            ),
          ),
          DefaultForm(
            hint: tr('new_password'),
            obscureText: true,
            suffix: Image.asset(Images.showPassword,width: 22,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: DefaultForm(
              hint: tr('confirm_password'),
              obscureText: true,
              suffix: Image.asset(Images.showPassword,width: 22,),
            ),
          ),
          DefaultButton(
            onTap: (){},
            text: tr('save'),
            width: size!.width*.8,
          )
        ],
      ),
    );
  }
}
