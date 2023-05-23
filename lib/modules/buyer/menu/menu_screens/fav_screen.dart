import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleAppbar: 'Favorite Services',
        child: ListService()
    );
  }
}
