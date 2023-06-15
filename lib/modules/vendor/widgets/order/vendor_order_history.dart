import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../widgets/default_button.dart';
import '../../../buyer/order/track_screen.dart';
import '../../order/vendor_order_screen.dart';

class VendorOrderHistoryWidget extends StatelessWidget {
  const VendorOrderHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c,i)=>OrderHistoryItem(),
        separatorBuilder: (c,i)=>const SizedBox(height: 30,),
        itemCount: 5
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, VendorOrderScreen());
      },
      child: SizedBox(
        height: 112,width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 124,height: 122,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadiusDirectional.circular(15)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(Images.product,fit: BoxFit.cover,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name Of Provider',
                                maxLines: 1,
                                style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 2,),
                              Text(
                                'Trash Collecting',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                              width: 40,height: 40,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: defaultColor.withOpacity(.3)),
                              alignment: AlignmentDirectional.center,
                              child: Image.asset(Images.chat,width: 17,)
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '20\$/h',
                      maxLines: 1,
                      style: TextStyle(color:defaultColor,fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Image.asset(Images.star,width: 12,),
                        Expanded(
                          child: Text(
                            '5.0',
                            style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w500),
                          ),
                        ),
                        DefaultButton(
                          onTap: (){
                            navigateTo(context, TrackScreen());
                          },
                          text: 'Track',
                          height: 21,
                          width: 72,
                          textSize: 9,
                          radius: 5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

