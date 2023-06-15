import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/images/images.dart';
import '../../../../../shared/styles/colors.dart';

class TrackWidget extends StatelessWidget {
  TrackWidget({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content(
            title: 'On Going',
            image: Images.onGoing,
            isSelected: true,
            desc: 'pending_desc',
          ),
          line(),
          content(
            title: 'Processing',
            image: Images.processing,
            isSelected:title =='Processing'||title =='Out Of Delivery'||title =='Delivered'||title =='Return',
            desc: 'processing_desc',
          ),
          line(),
          content(
            title: 'Completed',
            image: Images.completed,
            isSelected: title =='Delivered'||title =='Out Of Delivery'||title =='Return',
            desc: 'delivered_desc',
          ),
          line(),
          content(
            title: 'Canceled',
            image: Images.canceled,
            isSelected: title =='Delivered'||title =='Return',
            desc: 'return_desc',
          ),
        ],
      ),
    );
  }


  Widget line (){
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 30.0),
      child: SizedBox(
        width: 1,
        height: 40,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c,i)=>Container(
              height: 5,
              width: 5,
              color: defaultColor,
            ),
            separatorBuilder:(c,i)=>const SizedBox(height: 5,),
            itemCount: 3
        ),
      ),
    );
  }

  Widget content ({
    required String image,required String title,
    required String desc,required bool isSelected
  }){
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: isSelected ?defaultColor:Colors.white,
          child: Image.asset(image,width: 25,color:  isSelected ?Colors.white:null),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr(title),
                style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15,),
              Text(
                tr(desc),
                style:TextStyle(fontSize: 12,color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
