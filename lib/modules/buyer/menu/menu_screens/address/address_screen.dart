import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../../shared/images/images.dart';
import '../../../../../shared/styles/colors.dart';
import '../../../../../widgets/default_button.dart';
import 'add_edit_address_screen.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: tr('manage_addresses'),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (c,i)=>AddressItem(),
                  separatorBuilder: (c,i)=>const SizedBox(height: 30,),
                  itemCount: 2
              ),
            ),
            Center(
              child:DefaultButton(
                  text: tr('add_new_address'),
                  width: 159,
                  height: 33,
                  radius: 9,
                  textSize: 11,
                  onTap: ()=>navigateTo(context, AddEditAddressScreen())
              ),
            ),
            const SizedBox(height: 20,),
          ],
        )
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,width: double.infinity,
      decoration: BoxDecoration(
          color: defaultGrey,
          borderRadius: BorderRadiusDirectional.circular(20)
      ),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),
                ),
                Row(
                  children: [
                    Image.asset(Images.location,width: 12,),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(
                        '26985 Brighton Lane, Lake Forest, CA 92630.',
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, AddEditAddressScreen());
            },
              child: Image.asset(Images.edit2,width: 19,))
        ],
      ),
    );
  }
}

