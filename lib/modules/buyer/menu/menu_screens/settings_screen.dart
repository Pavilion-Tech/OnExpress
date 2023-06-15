import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import 'package:on_express/widgets/lang_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: tr('settings'),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            itemBuilder(
              title: tr('language'),
              value: tr(myLocale),
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context)=>LangDialog(true),
                );
              }
            ),
            const SizedBox(height: 30,),
            itemBuilder(
              title: tr('notifications'),
              value: tr('on'),
              onTap: (){}
            ),
          ],
        )
    );
  }

  Widget itemBuilder({
  required String title,
  required String value,
  required VoidCallback onTap,
}){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: defaultTextColor,fontSize: 16,fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(color: defaultTextColor,fontSize: 15),
          ),
          const SizedBox(width: 5,),
          Icon(Icons.arrow_forward_ios_outlined,color: defaultTextColor,size: 12,)
        ],
      ),
    );
  }
}
