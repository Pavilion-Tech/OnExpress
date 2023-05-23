import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: 'Notifications',
        child: ListView.separated(
            itemBuilder: (c,i)=>NotificationItem(),
            separatorBuilder: (c,i)=>const SizedBox(height: 20,),
            itemCount: 4
        )
    );
  }
}


class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: defaultGrey,
        borderRadius: BorderRadiusDirectional.circular(15)
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification title',
            style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 57,width: 57,
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(Images.product2,fit: BoxFit.cover,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notification Description',
                    style: TextStyle(color: defaultTextColor,fontSize: 10,height: 1.5),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

