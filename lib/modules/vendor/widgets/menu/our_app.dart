import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/widgets/menu/vendor_log_dialog.dart';
import 'package:on_express/shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/images/images.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../splash_screen.dart';
import '../../../../widgets/default_button.dart';
import '../../../buyer/auth/login_screen.dart';
import '../../menu/menu_screens/vendor_contact_screen.dart';
import '../../menu/menu_screens/vendor_about_us_screen.dart';
import '../../menu/menu_screens/vendor_terms_screen.dart';

class OurApp extends StatelessWidget {
  const OurApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('our_app'),
            style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.w700
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemBuilder(
                    title: 'contact',
                    onTap: (){
                      navigateTo(context, VendorContactScreen());
                    }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: itemBuilder(
                      title: 'about',
                      onTap: (){
                        navigateTo(context, VendorAboutUsScreen());
                      }
                  ),
                ),
                itemBuilder(
                    title: 'terms',
                    onTap: (){
                      navigateTo(context, VendorTermsScreen());
                    }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: itemBuilder(
                      title: tr('log_as_user'),
                      onTap: (){
                        navigateTo(context, LoginScreen());
                      }
                  ),
                ),
                Center(
                  child: Padding(
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
                ),
                Center(
                  child: InkWell(
                      onTap: ()=>openUrl('https://pavilion-teck.com/'),
                      child: Image.asset(Images.pavilion,width: 87,height: 20,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 100),
                  child: DefaultButton(
                      text: tr('logout'),
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
                            builder: (context) => VendorLogDialog()
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget itemBuilder({
    required VoidCallback onTap,
    required String title,
  }){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            tr(title),
            style: TextStyle(
                color: defaultColorFour,fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,color: defaultColorFour,size: 15,)
        ],
      ),
    );
  }
}
