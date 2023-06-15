import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_express/modules/buyer/widgets/request_service/choose_images.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../layout/buyer/buyer_cubit/buyer_cubit.dart';
import '../../../../shared/images/images.dart';

class DescribeProblem extends StatelessWidget {
  const DescribeProblem({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 20),
          child: Text(
            tr('describe_problem'),
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.grey.shade700),
          ),
        ),
        ConditionalBuilder(
          condition: BuyerCubit.get(context).problemImages.isNotEmpty,
          fallback: (c)=>const SizedBox(),
          builder: (c)=> SizedBox(
            height: 113,
            child: ListView.separated(
                itemBuilder: (c,i)=>itemBuilder(BuyerCubit.get(context).problemImages[i]!,context),
                separatorBuilder: (c,i)=>const SizedBox(width: 15,),
                scrollDirection: Axis.horizontal,
                itemCount: BuyerCubit.get(context).problemImages.length
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 30),
          child: TextButton(
              onPressed: (){
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
                    builder: (context) => ChooseImages()
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: defaultColor),
                    alignment: AlignmentDirectional.center,
                    child: Image.asset(Images.uploadImage,width: 13,),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    tr('upload_photo'),
                    style: TextStyle(fontSize: 10,color: Colors.grey.shade700),
                  ),
                ],
              )
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: tr('describe_details'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          maxLines: 6,
        )
      ],
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
              BuyerCubit.get(context).problemImages.remove(file);
              BuyerCubit.get(context).emitState();
            },
            child: Image.asset(Images.canceled,color: Colors.red,width: 30,))
      ],
    );
  }
}

