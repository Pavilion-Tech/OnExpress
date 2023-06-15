import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../shared/images/images.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        haveNotification: false,
        child: SingleChildScrollView(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('reset_password'),
                style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10,bottom: 30),
                child: Text(
                  tr('enter_password'),
                  style: TextStyle(fontSize: 12,color: Colors.grey,height: 1.5),
                ),
              ),
              Text(
                tr('new_password'),
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
              ),
              const SizedBox(height:5),
              DefaultForm(
                hint: tr('new_password'),
                obscureText: true,
                suffix: Image.asset(Images.showPassword,width: 22,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                child: Text(
                  tr('confirm_password'),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
              ),
              DefaultForm(
                hint: tr('confirm_password'),
                obscureText: true,
                suffix: Image.asset(Images.showPassword,width: 22,),
              ),
              const SizedBox(height: 30,),
              Center(
                child: DefaultButton(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  text: tr('sign_in'),
                  width: size!.width*.8,
                ),
              )
            ],
          ),
        )
    );
  }
}
