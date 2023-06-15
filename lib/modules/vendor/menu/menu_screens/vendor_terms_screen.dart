import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class VendorTermsScreen extends StatelessWidget {
  const VendorTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: tr('terms'),
        haveNotification: false,
        child:SingleChildScrollView(
          child: Text(
            'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, gm ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
            style: TextStyle(fontSize: 15,height: 2),
          ),
        )
    );
  }

}
