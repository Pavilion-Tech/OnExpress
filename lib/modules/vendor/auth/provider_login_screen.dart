import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/auth/provider_verification.dart';
import 'package:on_express/modules/vendor/auth/sign_up_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_form.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../widgets/default_button.dart';
import 'forget_password/forget_password_screen.dart';

class ProviderLoginScreen extends StatelessWidget {
  const ProviderLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveNotification: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('sign_in'),
                style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0,bottom: 5),
                child: Text(
                  tr('phone_number'),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
              ),
              DefaultForm(
                hint: myLocale=='ar'?'5678 1234 05':'05 1234 5678',
                digitsOnly: true,
                prefix: Image.asset(Images.flag,width: 22,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                child: Text(
                  tr('password'),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
              ),
              DefaultForm(
                hint: tr('password'),
                obscureText: true,
                suffix: Image.asset(Images.showPassword,width: 22,),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: ()=>navigateTo(context, ForgetPasswordScreen()),
                        child: Text(
                          tr('forget_password?'),
                          style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey),
                        ),
                      ),
                    ),
                    DefaultButton(
                      text: tr('sign_in'),
                      onTap: (){
                        showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            shape:const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart:  Radius.circular(20),
                                    topEnd: Radius.circular(20)
                                )
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (context) => ProviderVerification()
                        );
                      },
                      width: size!.width*.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,bottom: 8),
                      child: Text(
                        tr('havent_account?'),
                        style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey),
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          navigateTo(context, SignUpScreen());
                        },
                        child: Text(
                          tr('signup'),
                          style: TextStyle(color: defaultColor,fontWeight: FontWeight.w500),
                        )
                    )
                  ],
                ),
              )

            ],
          ),
        )
    );
  }
}
