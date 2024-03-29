import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../shared/components/components.dart';
import '../menu/menu_screens/notification_screen.dart';
import '../widgets/home/ads.dart';
import '../widgets/home/category.dart';
import '../widgets/home/list_stories.dart';
import '../widgets/home/store_around.dart';
import '../widgets/service/list_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Row(
            children: [
              Text(
                'OnExpress',
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18.5,color: Colors.black,height: -.1),
              ),
              const SizedBox(width: 10,),
              Image.asset(Images.appLogo,width: 35,),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                navigateTo(context, NotificationScreen());
              },
              icon:Image.asset(Images.notification,width: 20,)
          )
        ],
      ),
        child: SingleChildScrollView(
          child: Column(
            children:[
              ListStories(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Ads(),
              ),
              HomeCategory(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Category(),
              ),
              const SizedBox(height: 20,),
              StoreAround(),
              const SizedBox(height: 30,),
              ListService(shrinkWrap: true,)
            ],
          ),
        )
    );
  }
}
