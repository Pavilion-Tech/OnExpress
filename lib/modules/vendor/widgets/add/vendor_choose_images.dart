import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/layout/buyer/buyer_cubit/buyer_cubit.dart';
import 'package:on_express/layout/buyer/buyer_cubit/buyer_states.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_states.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../layout/vendor/vendor_cubit/vendor_cubit.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../../../shared/styles/colors.dart';

class VendorChooseImages extends StatelessWidget {
  VendorChooseImages({Key? key}) : super(key: key);
  bool haveImage = false;


  @override
  Widget build(BuildContext context) {
    if(VendorCubit.get(context).serviceImages.isNotEmpty)haveImage=true;
    return  BlocConsumer<VendorCubit, VendorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: haveImage?null:250,
              color: defaultColor,),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: haveImage?null:250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(200)),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: haveImage?null:250,
              child: Padding(
                padding: const EdgeInsets.only(top: 70,left: 30,right: 30,bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ConditionalBuilder(
                        condition: VendorCubit.get(context).serviceImages.isNotEmpty,
                        fallback: (c)=>Text(tr('choose_image')),
                        builder: (c)=> ListView.separated(
                            itemBuilder: (c,i)=>itemBuilder(VendorCubit.get(context).serviceImages[i]!,context),
                            separatorBuilder: (c,i)=>const SizedBox(width: 15,),
                            scrollDirection: Axis.horizontal,
                            itemCount: VendorCubit.get(context).serviceImages.length
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageType(
                              onTap: ()async{
                                VendorCubit.get(context).serviceImages.add(await VendorCubit.get(context).pick(ImageSource.camera));
                                haveImage = true;
                                VendorCubit.get(context).emitState();
                              },
                              title: tr('use_camera'),
                              image: Images.camera,
                            ),
                          ),
                          Expanded(
                            child: imageType(
                              onTap: (){
                                haveImage = true;
                                VendorCubit.get(context).pickListImage();
                              },
                              title: tr('choose_library'),
                              image: Images.image,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DefaultButton(
                      onTap: ()=>Navigator.pop(context),
                      text: tr('send'),
                    )
                  ],
                ),
              ),
            ),
          ],
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
              if(VendorCubit.get(context).serviceImages.isEmpty)haveImage = false;
              VendorCubit.get(context).emitState();
            },
            child: Image.asset(Images.canceled,color: Colors.red,width: 30,))
      ],
    );
  }

  Widget imageType({
    required VoidCallback onTap,
    required String title,
    required String image,
  }){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image,width: 18,color: defaultColor,),
          const SizedBox(width: 5,),
          Text(
            title,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }

}
