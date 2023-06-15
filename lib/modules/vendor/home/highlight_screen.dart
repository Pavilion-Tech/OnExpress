import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_states.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import '../../../shared/images/images.dart';
import '../../../widgets/choose_photo_type.dart';
import '../../../widgets/default_button.dart';

class HighlightScreen extends StatelessWidget {
  const HighlightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorCubit, VendorStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
      haveNotification: false,
      titleAppbar: tr('add_highlight'),
      child: Column(
        children: [

          ConditionalBuilder(
              condition: VendorCubit.get(context).highlightImage!=null,
              builder: (c)=>Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.file(File(VendorCubit.get(context).highlightImage!.path),fit: BoxFit.cover,),
                ),
              ),
              fallback: (c)=>const SizedBox()
          ),
          InkWell(
            onTap: (){
              showDialog(
                context: context,
                builder: (context)=>ChoosePhotoTypeDialog(
                  browseTap: ()async{
                    VendorCubit.get(context).highlightImage = await VendorCubit.get(context).pick(ImageSource.gallery);
                    VendorCubit.get(context).emitState();
                    Navigator.pop(context);
                  },
                  cameraTap: ()async{
                    VendorCubit.get(context).highlightImage = await VendorCubit.get(context).pick(ImageSource.camera);
                    VendorCubit.get(context).emitState();
                    Navigator.pop(context);
                  },
                ),
              );
            },
            child: Container(
              height: 68,width: 216,
              decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),border:Border.all(color: Colors.grey.shade500)),
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.camera,width: 18,),
                  const SizedBox(width: 8,),
                  Text(
                    tr('upload_image'),
                    style: TextStyle(
                        color: Colors.grey.shade500,fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: DefaultButton(
              text: tr('add_highlight'),
              onTap: (){},
            ),
          )
        ],
      ),
    );
  },
);
  }
}
