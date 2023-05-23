import 'package:flutter/material.dart';
import 'package:on_express/layout/buyer/buyer_layout.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../shared/styles/colors.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  //Successful Bookings You Will Be Notified Soon

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: defaultColor,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(200)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70,left: 30,right: 30,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Images.successDialog,width: 201,),
              Text.rich(
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
                TextSpan(
                  text: 'Successful ',
                  style: TextStyle(fontSize: 23),
                  children: [
                    TextSpan(
                      text: 'Bookings ',
                      style: TextStyle(fontSize: 23,color: defaultColor,fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: 'You Will Be Notified Soon',
                      style: TextStyle(fontSize: 23),
                    ),
                  ]
                )
              ),
              DefaultButton(
                  text: 'Homepage',
                  onTap: (){
                    Navigator.pop(context);
                    navigateAndFinish(context, BuyerLayout());
                  }
              )
            ],
          ),
        ),
      ],
    );
  }
}
