import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/vendor/menu/cubit/vendor_menu_states.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../widgets/choose_photo_type.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';
import '../../../../widgets/default_scaffold.dart';
import '../../widgets/sign_up/spcial_request.dart';
import '../cubit/vendor_menu_cubit.dart';

class VendorEditProfileScreen extends StatelessWidget {
  const VendorEditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorMenuCubit, VendorMenuStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
        haveNotification: false,
        titleAppbar: tr('edit_profile_info'),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 190,width: 190,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: defaultGrey),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child:VendorMenuCubit.get(context).profileImage!=null
                          ? Image.file(File(VendorMenuCubit.get(context).profileImage!.path),fit: BoxFit.cover,)
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
                                VendorMenuCubit.get(context).profileImage = await VendorMenuCubit.get(context).pick(ImageSource.gallery);
                                VendorMenuCubit.get(context).emitState();
                                Navigator.pop(context);
                              },
                              cameraTap: ()async{
                                VendorMenuCubit.get(context).profileImage = await VendorMenuCubit.get(context).pick(ImageSource.camera);
                                VendorMenuCubit.get(context).emitState();
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
                padding: const EdgeInsets.only(top: 30.0,bottom: 30),
                child: Center(
                  child: DefaultButton(
                    text: tr('save'),
                    onTap: (){},
                    width: size!.width*.8,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  },
);
  }
}
