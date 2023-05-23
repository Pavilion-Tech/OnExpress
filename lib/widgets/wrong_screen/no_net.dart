import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/images/images.dart';
import '../default_button.dart';

class NoNet extends StatelessWidget {
  const NoNet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.nonet,width: 210,height: 240,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                tr('net_title'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600,fontSize: 22.5,fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              tr('net_desc'),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500,fontSize: 11,fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20,),
            DefaultButton(text: tr('reload'), onTap: (){})
          ],
        ),
      ),
    );
  }
}
