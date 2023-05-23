import 'package:flutter/material.dart';
import 'package:on_express/shared/components/constants.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: 'Edit Profile',
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 190,width: 190,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(Images.product2),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                    height: 34,width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(Images.image),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 10),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                ),
              ),
            ),
            DefaultForm(
              prefix: Image.asset(Images.flag,width: 22,),
              hint: 'Phone Number',
            ),
            const SizedBox(height: 30,),
            DefaultButton(
              text: 'Save Changes',
              onTap: (){
                Navigator.pop(context);
              },
              width: size!.width*.8,
            )
          ],
        )
    );
  }
}
