import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../widgets/menu/account_settings.dart';
import '../widgets/menu/our_app.dart';

class VendorMenuScreen extends StatelessWidget {
  const VendorMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveNotification: false,
      titleAppbar: tr('account_settings'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            AccountSettings(),
            OurApp(),
          ],
        ),
      ),
    );
  }
}
