import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/auth/verification.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_form.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../shared/components/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(top: 25.0,bottom: 80),
                child: DefaultButton(
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
                        builder: (context) => Verification()
                    );
                  },
                  text: tr('sign_in'),
                ),
              ),
              itemBuilder(
                image: Images.google,
                title: 'Sign in With Google',
                onTap: (){}
              ),
              const SizedBox(height: 15,),
              itemBuilder(
                image: Images.apple,
                title: 'Sign in With Apple',
                onTap: (){}
              )
            ],
          ),
        )
    );
  }

  Widget itemBuilder({
  required String image,
  required String title,
  required VoidCallback onTap,
}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58,width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          border: Border.all(color: Colors.black)
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,width: 22,),
            const SizedBox(width: 8,),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ),
    );
  }
}
