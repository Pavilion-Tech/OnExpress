import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: tr('favorite_services'),
        child: ListService()
    );
  }
}
