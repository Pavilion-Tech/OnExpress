import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';

import '../../request_service/request_service_screen.dart';

class ListService extends StatelessWidget {
  ListService({this.shrinkWrap = false});

  bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c,i)=>ServiceItem(),
        shrinkWrap: shrinkWrap,
        physics: shrinkWrap?const NeverScrollableScrollPhysics():null,
        separatorBuilder: (c,i)=>const SizedBox(height: 20,),
        itemCount: 4
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, RequestServiceScreen());
      },
      child: Container(
        height: 122,width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(15),
          color: defaultGrey
        ),
        child: Row(
          children: [
            Container(
              width: 124,height: 122,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(Images.product,fit: BoxFit.cover,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name Of Provider',
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Trash Collecting',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                              onTap: (){},
                              child: Image.asset(Images.favYes,width: 11,),
                          ),
                          const SizedBox(width: 20,),
                        ],
                      ),
                    ),
                    Text(
                      '20\$/h',
                      maxLines: 1,
                      style: TextStyle(color:defaultColor,fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Image.asset(Images.star,width: 12,),
                        Expanded(
                          child: Text(
                            '5.0',
                            style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w500),
                          ),
                        ),
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

