import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:on_express/modules/buyer/widgets/menu/with_sign.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        haveArrow: false,
        titleAppbar: 'My Profile',
        child: SingleChildScrollView(child: WithSign())
    );
  }


}
