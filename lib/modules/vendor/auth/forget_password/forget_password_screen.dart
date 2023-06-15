import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/auth/forget_password/reset_password_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        haveNotification: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('forget_password'),
                style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10,end: 100,bottom: 30),
                child: Text(
                  tr('enter_phone'),
                  style: TextStyle(fontSize: 12,color: Colors.grey,height: 1.5),
                ),
              ),
              Text(
                tr('phone_number'),
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5,),
              DefaultForm(
                hint: myLocale=='ar'?'5678 1234 05':'05 1234 5678',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30,),
              Center(
                child: DefaultButton(
                  onTap: (){
                    navigateTo(context, ResetPasswordScreen());
                  },
                  text: tr('next'),
                  width: size!.width*.8,
                ),
              )
            ],
          ),
        )
    );
  }
}
