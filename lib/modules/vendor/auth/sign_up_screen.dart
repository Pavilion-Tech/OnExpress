import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/vendor/auth/vendor_auth_cubit/vendor_auth_cubit.dart';
import 'package:on_express/modules/vendor/auth/vendor_auth_cubit/vendot_auth_states.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_form.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import '../../../shared/images/images.dart';
import '../../../widgets/choose_photo_type.dart';
import '../widgets/sign_up/spcial_request.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorAuthCubit, VendorAuthStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
        haveNotification: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('welcome'),
                style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10,bottom: 30),
                child: Text(
                  tr('indicates_fields'),
                  style: TextStyle(fontSize: 22,color: Colors.grey,height: 1.5),
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 190,width: 190,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: defaultGrey),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child:VendorAuthCubit.get(context).signUpImage!=null
                          ? Image.file(File(VendorAuthCubit.get(context).signUpImage!.path),fit: BoxFit.cover,)
                          : Image.asset(Images.person),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 5,
                      child:  InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context)=>ChoosePhotoTypeDialog(
                              browseTap: ()async{
                                VendorAuthCubit.get(context).signUpImage = await VendorAuthCubit.get(context).pick(ImageSource.gallery);
                                VendorAuthCubit.get(context).emitState();
                                Navigator.pop(context);
                              },
                              cameraTap: ()async{
                                VendorAuthCubit.get(context).signUpImage = await VendorAuthCubit.get(context).pick(ImageSource.camera);
                                VendorAuthCubit.get(context).emitState();
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 34,width: 34,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Images.image),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              DefaultForm(hint: tr('store_name')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DefaultForm(hint: tr('email_address'),type: TextInputType.emailAddress,),
              ),
              DefaultForm(hint: tr('phone_number'),digitsOnly: true,type: TextInputType.phone,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DefaultForm(hint: tr('city')),
              ),
              DefaultForm(hint: tr('neighborhood')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DefaultForm(hint: tr('choose_category')),
              ),
              DefaultForm(hint: tr('id_number'),digitsOnly: true,type: TextInputType.phone,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SpecialRequest(),
              ),
              DefaultForm(hint: tr('commercial'),digitsOnly: true,type: TextInputType.phone,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DefaultForm(
                  hint: tr('new_password'),
                  obscureText: true,
                  suffix: Image.asset(Images.showPassword,width: 22,),
                ),
              ),
              DefaultForm(
                hint: tr('confirm_password'),
                obscureText: true,
                suffix: Image.asset(Images.showPassword,width: 22,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0,bottom: 20),
                child: Center(
                  child: DefaultButton(
                    text: tr('signup'),
                    onTap: (){},
                    width: size!.width*.8,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${tr('have_account')}  ',
                    style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey),
                  ),
                  InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: Text(
                        tr('sign_in'),
                        style: TextStyle(color: defaultColor,fontWeight: FontWeight.w500),
                      )
                  )
                ],
              ),
              const SizedBox(height: 40,),
            ],
          ),
        )
    );
  },
);
  }
}
