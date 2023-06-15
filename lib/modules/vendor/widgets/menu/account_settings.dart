import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/widgets/lang_dialog.dart';
import '../../../../shared/styles/colors.dart';
import '../../menu/menu_screens/change_password_screen.dart';
import '../../menu/menu_screens/chat/vendor_chat_history_screen.dart';
import '../../menu/menu_screens/edit_profile_screen.dart';
import '../../menu/menu_screens/service/manage_service_screen.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('my_account'),
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 50),
          child: Column(
            children: [
              itemBuilder(
                  title: 'edit_profile_info',
                  onTap: (){
                    navigateTo(context, VendorEditProfileScreen());
                  }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: itemBuilder(
                    title: 'change_password',
                    onTap: () {
                      navigateTo(context, ChangePasswordScreen());
                    }
                ),
              ),
              itemBuilder(
                  title: 'manage_services',
                  onTap: () {
                    navigateTo(context, ManageServiceScreen());
                  }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: itemBuilder(
                    title: 'chat_history',
                    onTap: () {
                      navigateTo(context, VendorChatHistoryScreen());
                    }
                ),
              ),
              itemBuilder(
                  title: 'change_language',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context)=>LangDialog(false),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemBuilder({
    required VoidCallback onTap,
    required String title,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            tr(title),
            style:
                TextStyle(color: defaultColorFour, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: defaultColorFour,
            size: 15,
          )
        ],
      ),
    );
  }
}
