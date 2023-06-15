import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

import '../../home/store_around_screen.dart';
import '../../store/store_screen.dart';

class StoreAround extends StatelessWidget {
  const StoreAround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              tr('store_around'),
              style: TextStyle(fontSize: 11),
            ),
            const Spacer(),
            InkWell(
              onTap: ()=>navigateTo(context, StoreAroundScreen()),
              child: Text(
                tr('see_all'),
                style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        SizedBox(
          height: 58,
          child: ListView.separated(
              itemBuilder: (c,i)=>StoreAroundItem(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (c,i)=>const SizedBox(width: 30,),
              itemCount: 4
          ),
        )
      ],
    );
  }
}

class StoreAroundItem extends StatelessWidget {
  const StoreAroundItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, StoreScreen());
      },
      child: Container(
        height: 58,
        width: size!.width*.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10),
          border: Border.all(color: Colors.grey.shade400)
        ),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: 46,width: 46,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(Images.cleaning),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Store Name',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(Images.location,width: 9,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            '3.5 Km Away',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ],
                    )
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

