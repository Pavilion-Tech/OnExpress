import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/layout/buyer/buyer_cubit/buyer_cubit.dart';
import 'package:on_express/layout/buyer/buyer_layout.dart';
import 'package:on_express/layout/vendor/vendor_layout.dart';
import 'package:on_express/shared/images/images.dart';

import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/network/local/cache_helper.dart';

class LangDialog extends StatelessWidget {
  LangDialog(this.isUser);
  
  bool isUser;
  
  void submit(String lang,BuildContext context){
    myLocale = lang;
    context.setLocale(Locale(myLocale));
    CacheHelper.saveData(key: 'locale', value: myLocale);
    if(isUser) navigateAndFinish(context, BuyerLayout());
    else navigateAndFinish(context, VendorLayout());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 110),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent)
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemBuilder(
              onTap: (){
                submit('ar',context);
              },
              title: 'ar',
              image: Images.ar,
            ),
            const SizedBox(height: 20,),
            itemBuilder(
              onTap: (){
                submit('en',context);
              },
              title: 'en',
              image: Images.en,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder({
  required VoidCallback onTap,
  required String title,
  required String image,
}){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image,width: 23,),
          const SizedBox(width: 30,),
          Text(
            tr(title),
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
