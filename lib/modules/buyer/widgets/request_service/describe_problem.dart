import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

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
            'Describe Your Problem',
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.grey.shade700),
          ),
        ),
        SizedBox(
          height: 133,
          child: ListView.separated(
              itemBuilder: (c,i)=>itemBuilder(),
              separatorBuilder: (c,i)=>const SizedBox(width: 15,),
              scrollDirection: Axis.horizontal,
              itemCount: 3
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 30),
          child: TextButton(
              onPressed: (){},
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
                    'Upload Photo',
                    style: TextStyle(fontSize: 10,color: Colors.grey.shade700),
                  ),
                ],
              )
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Describe Your Problem in Details',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          maxLines: 6,
        )
      ],
    );
  }

  Widget itemBuilder(){
    return Container(
      height: 133,width: size!.width*.434,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15),
        color: Colors.black
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(Images.product2,fit: BoxFit.cover,),
    );
  }
}

