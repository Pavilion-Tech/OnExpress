import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

import '../../../order/vendor_track_screen.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: defaultGrey
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '352365',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 18
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, VendorTrackScreen());
                },
                child: Text(
                  tr('track'),
                  style: TextStyle(color: defaultColor,fontSize: 15,fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(Images.person,color: defaultColor,width: 15,),
              const SizedBox(width: 10,),
              Text(
                'UserName',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(Images.iphone,color: defaultColor,width: 15,),
              const SizedBox(width: 10,),
              Text(
                '0211515454',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          Row(
            children: [
              Image.asset(Images.location,color: defaultColor,width: 15,),
              const SizedBox(width: 10,),
              Expanded(
                child: Text(
                  '26985 Brighton Lane, Lake Forest, CA 92630.26985 Brighton Lane, Lake Forest, CA 92630.26985 Brighton Lane, Lake Forest, CA 92630.',
                  maxLines: 2,
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
