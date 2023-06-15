import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_states.dart';

import '../../../../../shared/components/constants.dart';
import '../../../../../shared/images/images.dart';
import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/default_form.dart';
import '../../../../../widgets/default_scaffold.dart';
import '../../../widgets/add/vendor_choose_images.dart';

class EditServiceScreen extends StatelessWidget {
  const EditServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorCubit, VendorStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
      haveNotification: false,
      titleAppbar: tr('edit_service'),
      child: Column(
        children: [
          Text(
            tr('determine'),
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0,bottom: 35),
            child: Text(
              tr('indicates_fields'),
              style: TextStyle(fontSize: 10,color: Colors.grey),
            ),
          ),
          DefaultForm(
              hint:tr('service_title')
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: DefaultForm(
              hint:tr('describe_service'),
              maxLines: 5,
            ),
          ),
          DefaultForm(
              hint:tr('price')
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 35),
            child: DefaultForm(
                hint:tr('price_after_discount')
            ),
          ),
          ConditionalBuilder(
            condition: VendorCubit.get(context).serviceImages.isNotEmpty,
            fallback: (c)=>const SizedBox(),
            builder: (c)=> SizedBox(
              height: 133,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: ListView.separated(
                    itemBuilder: (c,i)=>itemBuilder(VendorCubit.get(context).serviceImages[i]!,context),
                    separatorBuilder: (c,i)=>const SizedBox(width: 15,),
                    scrollDirection: Axis.horizontal,
                    itemCount: VendorCubit.get(context).serviceImages.length
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              showModalBottomSheet(
                  enableDrag: true,
                  shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart:  Radius.circular(20),
                          topEnd: Radius.circular(20)
                      )
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  context: context,
                  builder: (context) => VendorChooseImages()
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
              text: tr('edit_service'),
              onTap: (){
                Navigator.pop(context);
              },
              width: size!.width*.8,
            ),
          )
        ],
      ),
    );
  },
);
  }

  Widget itemBuilder(XFile file,BuildContext context){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 133,width: size!.width*.434,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              color: Colors.black
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.file(File(file.path),fit: BoxFit.cover,),
        ),
        InkWell(
            onTap: (){
              VendorCubit.get(context).serviceImages.remove(file);
              VendorCubit.get(context).emitState();
            },
            child: Image.asset(Images.canceled,color: Colors.red,width: 30,))
      ],
    );
  }

}
