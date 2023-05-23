import 'package:flutter/material.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: 'Settings',
        child: Column(
          children: [
            const SizedBox(height: 30,),
            itemBuilder(
              title: 'Language',
              value: 'English'
            ),
            const SizedBox(height: 30,),
            itemBuilder(
              title: 'Notifications',
              value: 'On'
            ),
          ],
        )
    );
  }

  Widget itemBuilder({
  required String title,
  required String value,
}){
    return Row(
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
    );
  }
}
