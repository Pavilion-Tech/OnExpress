import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_express/modules/buyer/menu/menu_screens/contact_screen.dart';
import 'package:on_express/modules/buyer/widgets/menu/delete_account_dialog.dart';
import 'package:on_express/modules/buyer/widgets/menu/log_dialog.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../../vendor/auth/provider_login_screen.dart';
import '../../menu/menu_screens/about_us_screen.dart';
import '../../menu/menu_screens/address/address_screen.dart';
import '../../menu/menu_screens/edit_profile_screen.dart';
import '../../menu/menu_screens/fav_screen.dart';
import '../../menu/menu_screens/settings_screen.dart';
import '../../menu/menu_screens/terms_screen.dart';

class WithSign extends StatelessWidget {
  const WithSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 142,width: 142,
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(Images.product2,fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 15,),
          itemBuilder(
              onTap: (){
                navigateTo(context, EditProfileScreen());
              },
              title: 'edit_profile',
              icon: Images.edit
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, SettingsScreen());
              },
              title: 'settings',
              icon: Images.settings
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, FavScreen());
              },
              title: 'my_favorites',
              icon: Images.favNo
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, AddressScreen());
              },
              title: 'my_addresses',
              icon: Images.location
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, ContactScreen());
              },
              title: 'help',
              icon: Images.help
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, AboutUsScreen());
              },
              title: 'about',
              icon: Images.aboutUs
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, TermsScreen());
              },
              title: 'terms',
              icon: Images.terms
          ),
          itemBuilder(
              onTap: (){
                navigateTo(context, ProviderLoginScreen());
              },
              title: 'log_as_provider',
              icon: Images.log2
          ),
          itemBuilder(
              onTap: (){
                showModalBottomSheet(
                    enableDrag: true,
                    shape:const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart:  Radius.circular(20),
                            topEnd: Radius.circular(20)
                        )
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    context: context,
                    builder: (context) => LogDialog()
                );
              },
              title: 'logout',
              icon: Images.log
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 10),
            child: Text.rich(
              TextSpan(
                  text: '${tr('version')} ',
                  style: TextStyle(fontSize: 13),
                  children: [
                    TextSpan(
                    text: version,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700)
                  )
                ]
              )
            ),
          ),
          InkWell(
              onTap: ()=>openUrl('https://pavilion-teck.com/'),
              child: Image.asset(Images.pavilion,width: 87,height: 20,)),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 100),
            child: DefaultButton(
                text: tr('delete_account'),
                onTap: (){
                  showModalBottomSheet(
                      enableDrag: true,
                      shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart:  Radius.circular(20),
                              topEnd: Radius.circular(20)
                          )
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      context: context,
                      builder: (context) => DeleteAccountDialog()
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  Widget itemBuilder({
    required VoidCallback onTap,
    required String icon,
    required String title,
  }){
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Image.asset(icon,width: 20,color: defaultColor,),
          const SizedBox(width: 15,),
          Text(
            tr(title),
            style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
