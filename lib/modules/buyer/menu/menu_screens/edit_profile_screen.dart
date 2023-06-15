import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/buyer/menu/cubit/menu_cubit.dart';
import 'package:on_express/modules/buyer/menu/cubit/menu_states.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import 'package:on_express/widgets/image_net.dart';

import '../../../../widgets/choose_photo_type.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
        titleAppbar: tr('edit_profile'),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 190,width: 190,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: defaultGrey),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:MenuCubit.get(context).profileImage!=null
                      ? Image.file(File(MenuCubit.get(context).profileImage!.path),fit: BoxFit.cover,)
                      : Image.asset(Images.person),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context)=>ChoosePhotoTypeDialog(
                          browseTap: ()async{
                            MenuCubit.get(context).profileImage = await MenuCubit.get(context).pick(ImageSource.gallery);
                            MenuCubit.get(context).emitState();
                            Navigator.pop(context);
                          },
                          cameraTap: ()async{
                            MenuCubit.get(context).profileImage = await MenuCubit.get(context).pick(ImageSource.camera);
                            MenuCubit.get(context).emitState();
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 10),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  tr('phone_number'),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
              ),
            ),
            DefaultForm(
              prefix: Image.asset(Images.flag,width: 22,),
              hint: myLocale=='ar'?'5678 1234 05':'05 1234 5678',
            ),
            const SizedBox(height: 30,),
            DefaultButton(
              text: tr('save_changes'),
              onTap: (){
                Navigator.pop(context);
              },
              width: size!.width*.8,
            )
          ],
        )
    );
  },
);
  }
}
